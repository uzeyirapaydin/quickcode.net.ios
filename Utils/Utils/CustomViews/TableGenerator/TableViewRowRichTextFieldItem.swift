//
//  TableViewRowTextFieldItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import LRTextField
import CoreTelephony
import FontAwesome_swift

public class TableViewRowRichTextFieldItem : TableViewRowNibItem {

    var cell : TableInputRichTextCell? = nil
    var placeholderText : String = ""
    var iconValue : String = ""
    var defaultValue : String = ""
    var isReadonly : Bool = false
    
    
//   public  required convenience init( placeholderText: String, iconValue :  String, defaultValue : String = "", isReadonly: Bool = false) {
//        self.init(nibName: "TableInputRichTextCell", reuseIdentifier: "tableInputRichTextCell")
//        self.placeholderText=placeholderText
//        self.iconValue = iconValue
//        self.defaultValue=defaultValue
//        self.isReadonly=isReadonly
//        self.rowHeight=120
//    }
    
    public required convenience init(parameters: [String: String] ) {
        self.init(nibName: "TableInputRichTextCell", reuseIdentifier: "tableInputRichTextCell")
        initializeRow(placeholderText: parameters["PlaceholderText"]!, iconValue: parameters["IconValue"]!, defaultValue: (parameters["DefaultValue"] ?? ""), isReadonly: (parameters["IsReadonly"] ?? "").boolValue)
    }
    
    func initializeRow(placeholderText: String, iconValue :  String, defaultValue : String = "", isReadonly: Bool = false){
        
        var fontAwesomeIconName = iconValue
        if !fontAwesomeIconName.starts(with: "fa-") {
            fontAwesomeIconName = "fa-user"
        }

        self.iconValue =  FontAwesome.init(rawValue: fontAwesomeIconName)!.unicode
        self.placeholderText=placeholderText
        self.defaultValue=defaultValue
        self.isReadonly=isReadonly
        self.rowHeight=120
    }
    
    public func setInputType()  {
        var inputRules = ValidationRuleSet<String>()
        
        let minLengthRule = ValidationRuleLength(min: 2, error: ValidationError(message: "Min 2 Chars"))
        inputRules.add(rule: minLengthRule)
        self.cell?.txtInput.text = defaultValue
    
        self.cell?.txtInput.validationRules=inputRules
        
        
    }
}
