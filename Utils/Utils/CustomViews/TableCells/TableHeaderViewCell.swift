//
//  TableHeaderViewCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 25.07.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit

public class TableHeaderViewCell: UITableViewCell {

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet public weak var lblHeaderItem2: UILabel!
    @IBOutlet public weak var lblHeaderItem1: UILabel!
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
