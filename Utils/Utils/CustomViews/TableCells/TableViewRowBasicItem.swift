//
//  TableViewRowBasicItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 12.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import FontAwesome_swift


public class TableViewRowBasicItem: UITableViewCell {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        lblIcon.font = UIFont.fontAwesome(ofSize: 17.0, style: .solid)
        // Initialization code
    }
    
    @IBOutlet public weak var lblIcon: UILabel!
    @IBOutlet public weak var lblLabel: UILabel!
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
