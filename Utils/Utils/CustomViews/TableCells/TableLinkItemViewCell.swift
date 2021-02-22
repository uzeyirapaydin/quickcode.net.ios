//
//  TableLinkItemViewCell.swift
//  Utils
//
//  Created by Uzeyir APAYDIN on 21.02.2019.
//  Copyright © 2019 Uzeyir APAYDIN. All rights reserved.
//

import UIKit

public class TableLinkItemViewCell: UITableViewCell {

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet public weak var lblLinkButton: UIButton!
    
    @IBOutlet public weak var lblLinkText: UILabel!
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
