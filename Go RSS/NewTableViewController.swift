//
//  MasterViewController.swift
//  Go RSS
//
//  Created by Roger on 7/22/15.
//  Copyright (c) 2015 Roger. All rights reserved.
//

import UIKit
import MWFeedParser
import MBProgressHUD
import KINWebBrowser

class NewsTableViewController: UITableViewController, MWFeedParserDelegate {
    
//    var detailViewController: DetailViewController? = nil
    var source: RSSSource? = RSSSource(title: "Tongji University", url: NSURL(string: "http://news.tongji.edu.cn/rss.php?classid=12")!, brief: "Tongji News")
    var objects = [MWFeedItem]()
    var progressHUD: MBProgressHUD?

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
//        if let split = self.splitViewController {
//            let controllers = split.viewControllers
//            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
//        }
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.registerClass(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        fetch()
        
    }

    func fetch() {
        if let url = source?.url {
            let feedParser = MWFeedParser(feedURL: url)
            feedParser.delegate = self
            feedParser.parse()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                let object = objects[indexPath.row] 
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! KINWebBrowserViewController
//                controller.detailItem = object
//                controller.loadURL(NSURL(string: object.link))
//                controller.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "dismiss:")
//                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

//    func dismiss(sender: AnyObject){
//        self.navigationController?.visibleViewController.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    //MARK: - MWFeedParserDelegate
    func feedParserDidStart(parser: MWFeedParser!) {
        progressHUD = MBProgressHUD()
        progressHUD?.show(true)
//        self.objects = [MWFeedItem]()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        progressHUD?.hide(true)
        self.tableView.reloadData()
    }
    
    func feedParser(parser: MWFeedParser!, didFailWithError error: NSError!) {
        progressHUD?.hide(true)
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        println(info)
        self.title = info.title
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        println(item)
        self.objects.append(item)
    }
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! NewsTableViewCell

        cell.object = objects[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = objects[indexPath.row] as MWFeedItem
        let con = KINWebBrowserViewController()
        con.loadURL(NSURL(string: item.link))
        self.navigationController?.pushViewController(con, animated: true)
    }

}

