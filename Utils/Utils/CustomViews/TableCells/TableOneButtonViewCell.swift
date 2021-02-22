//
//  TableOneButtonViewCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 23.11.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import SwiftyButton

public class TableOneButtonViewCell: UITableViewCell {
    
    @IBOutlet public weak var btnYes: CustomPressableButton!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnYes.colors = .init(button: UIColor(hexString: "#F79A17"), shadow: UIColor(hexString: "#e88b07"))
        self.btnYes.shadowHeight=4
    }
    
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

