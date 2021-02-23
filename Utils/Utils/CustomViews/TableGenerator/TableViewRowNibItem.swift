//
//  TableViewRowNibItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation



public class TableViewRowNibItem {
   public var nibName: String = ""
   public var reuseIdentifier: String = ""
   public var rowHeight :  CGFloat = 50
    
    public required init(nibName: String, reuseIdentifier: String) {
        self.nibName = nibName
        self.reuseIdentifier = reuseIdentifier
    }
    
    public required init(nibName: String, reuseIdentifier: String, rowHeight : CGFloat) {
        self.nibName = nibName
        self.reuseIdentifier = reuseIdentifier
        self.rowHeight=rowHeight
    }
}

public enum TableViewRowTextFieldItemType : CaseIterable{
    case TextField
    case TextFieldAmount
    case TextFieldInteger
    case TextFieldPassword
    case TextFieldEmail
    case TextFieldPhone
    case TextFieldDateTime
    case TextFieldDate
    case TextFieldTime
    case TextFieldOptional
    case TextFieldCreditCard
    case TextFieldCreditCardCvc
    case TextFieldCreditCardDate
    
    static func from(string: String) -> Self? {
        return self.allCases.first { string == "\($0)" }
    }
    
    func toString() -> String { "\(self)" }

}
