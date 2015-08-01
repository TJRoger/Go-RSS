//
//  RSSItem.swift
//  Go RSS
//
//  Created by Roger on 7/22/15.
//  Copyright (c) 2015 Roger. All rights reserved.
//

import Foundation

public class RSSSource: Printable {
    var title: String
    var url: NSURL
    var brief: String?
    
    //swift class inherited from NSObject should use override keyword
    public var description: String {
        return "\(title)-\(url)" + (brief == nil ? "" : "-\(brief!)")
    }
    
    init(title: String, url: NSURL, brief: String?) {
        self.title = title
        self.url = url
        self.brief = brief
    }
    
    
}