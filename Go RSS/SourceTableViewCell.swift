//
//  SourceTableViewCell.swift
//  Go RSS
//
//  Created by Roger on 7/22/15.
//  Copyright (c) 2015 Roger. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    var object: RSSSource? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
