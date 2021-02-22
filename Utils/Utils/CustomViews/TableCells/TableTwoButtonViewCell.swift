//
//  TableButtonViewCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 26.07.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import SwiftyButton

public class TableTwoButtonViewCell: UITableViewCell {

    @IBOutlet public weak var btnNo: CustomPressableButton!
    @IBOutlet public weak var btnYes: CustomPressableButton!

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnYes.colors = .init(button: UIColor(hexString: "#F79A17"), shadow: UIColor(hexString: "#e88b07"))
        self.btnYes.shadowHeight=4

        self.btnNo.colors = .init(button: UIColor(hexString: "#C04C41"), shadow: UIColor(hexString: "#b34136"))
        self.btnNo.shadowHeight=4
    }


    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

