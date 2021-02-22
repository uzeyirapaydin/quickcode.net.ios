//
//  TableInputTextCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 25.07.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import KMPlaceholderTextView


public class TableInputRichTextCell: UITableViewCell {
    
    
    @IBOutlet weak var lblIcon: UILabel!
    
    @IBOutlet var txtInput: KMPlaceholderTextView!
    var isValid : Bool = false
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        lblIcon.font = UIFont.fontAwesome(ofSize: 17.0, style: .solid)
        
    }
    
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
