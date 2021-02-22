//
//  TableCheckBoxViewCell.swift
//  Utils
//
//  Created by Uzeyir APAYDIN on 21.02.2019.
//  Copyright © 2019 Uzeyir APAYDIN. All rights reserved.
//

import UIKit

class TableCheckBoxViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var switchItem: UISwitch!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
