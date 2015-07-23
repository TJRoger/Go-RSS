//
//  RSSItem.swift
//  Go RSS
//
//  Created by Roger on 7/22/15.
//  Copyright (c) 2015 Roger. All rights reserved.
//

import Foundation

class RSSItem: Printable {
    var source: RSSSource!
    var title: String!
    var summary: String?
    
    var description: String {
        return "\(title)-\(summary)"
    }
}