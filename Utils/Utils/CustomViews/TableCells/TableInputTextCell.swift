//
//  TableInputTextCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 25.07.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import LRTextField


public class TableInputTextCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var txtFromBottom: NSLayoutConstraint!
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var txtInput: LRTextField!
    var isValid : Bool = false
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        txtInput.delegate=self
        lblIcon.font = UIFont.fontAwesome(ofSize: 17.0, style: .solid)

    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.count)!>0 {
            txtFromBottom.constant=3
        }else{
            txtFromBottom.constant=10
        }
    }
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        txtFromBottom.constant=3
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
