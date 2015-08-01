//
//  NewsTableViewCell.swift
//  Go RSS
//
//  Created by Roger on 7/22/15.
//  Copyright (c) 2015 Roger. All rights reserved.
//

import UIKit
import MWFeedParser

class NewsTableViewCell: UITableViewCell {

    var object: MWFeedItem? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(){
        if object != nil {
            titleLabel?.text = nil
            summaryLabel?.text = nil
            
            titleLabel?.text = object!.title
            summaryLabel?.text = object!.summary
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
