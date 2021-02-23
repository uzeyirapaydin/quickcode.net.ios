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

public class TableViewRowTextFieldItem : TableViewRowNibItem {
    var type : TableViewRowTextFieldItemType = .TextField
    var cell : TableInputTextCell? = nil
    var placeholderText : String = ""
    var iconValue : String = ""
    var defaultValue : String = ""
    var isReadonly : Bool = false
    
    
    //    public required convenience init( placeholderText: String, iconValue :  String, defaultValue : String = "", isReadonly: Bool = false) {
    //        self.init(nibName: "TableInputTextCell", reuseIdentifier: "tableInputTextCell")
    //        initializeRow(placeholderText: placeholderText, iconValue: iconValue, type: .TextField, defaultValue: defaultValue, isReadonly: isReadonly)
    //    }
    
    //    public  required convenience init( placeholderText: String, iconValue :  String, type: TableViewRowTextFieldItemType, defaultValue : String = "", isReadonly: Bool = false) {
    //        self.init(nibName: "TableInputTextCell", reuseIdentifier: "tableInputTextCell")
    //        initializeRow(placeholderText: placeholderText, iconValue: iconValue, type: type, defaultValue: defaultValue, isReadonly: isReadonly)
    //    }
    
    public required convenience init(parameters: [String: String] ) {
        self.init(nibName: "TableInputTextCell", reuseIdentifier: "tableInputTextCell")
        initializeRow(placeholderText: parameters["PlaceholderText"]!, iconValue: parameters["IconValue"]!, type: TableViewRowTextFieldItemType.from(string: parameters["Type"] ?? "TextField")!, defaultValue: parameters["DefaultValue"] ?? "", isReadonly: (parameters["IsReadonly"] ?? "").boolValue)
    }
    
    func initializeRow(placeholderText: String, iconValue :  String, type: TableViewRowTextFieldItemType, defaultValue : String = "", isReadonly: Bool = false){
        self.placeholderText=placeholderText
        self.iconValue = iconValue
        self.type = type
        self.defaultValue=defaultValue
        self.isReadonly=isReadonly
    }
    
    public func setInputType()  {
        var inputRules = ValidationRuleSet<String>()
        
        let minLengthRule = ValidationRuleLength(min: 2, error: ValidationError(message: "Min 2 Chars"))
        inputRules.add(rule: minLengthRule)
        self.cell?.txtInput.text = defaultValue
        if type == .TextFieldEmail {
            self.cell?.txtInput.textContentType = UITextContentType.emailAddress
            inputRules = ValidationRuleSet<String>()
            let emailRule = ValidationRulePattern(pattern: EmailValidationPattern.standard, error: ValidationError(message:"Not Valid Email"))
            inputRules.add(rule: emailRule)
            self.cell?.txtInput.keyboardType = .emailAddress
        }
        else   if type == .TextFieldPhone {
            self.cell?.txtInput.textContentType = UITextContentType.telephoneNumber
            self.cell?.txtInput.keyboardType = .phonePad
            
            // Setup the Network Info and create a CTCarrier object
            let networkInfo = CTTelephonyNetworkInfo()
            let carrier = networkInfo.subscriberCellularProvider
            inputRules = ValidationRuleSet<String>()
            
            let phoneNumberRuleTR = ValidationRulePattern(pattern: "^[+][9][0][ ][(][0-9]{3}[)][ ][0-9]{3}[ ][0-9]{2}[ ][0-9]{2}$", error: ValidationError(message:"Not Valid Number") )
            //self.cell?.txtInput.validateOnInputChange(enabled: true)
            let phoneNumberRuleUS = ValidationRulePattern(pattern: "^[+][1][ ][(][0-9]{3}[)][ ][0-9]{3}[-][0-9]{4}$", error: ValidationError(message:"Not Valid Number") )
            
            
            if carrier?.mobileCountryCode == "286" {
                self.cell?.txtInput.format = "+90 (###) ### ## ##"
                inputRules.add(rule: phoneNumberRuleTR)
            }else if carrier?.mobileCountryCode == "310" {
                self.cell?.txtInput.format = "+1 (###) ###-####"
                inputRules.add(rule: phoneNumberRuleUS)
            }else{
                self.cell?.txtInput.format = "+1 (###) ###-####"
                inputRules.add(rule: phoneNumberRuleUS)
            }
            
            
            
        }
        else   if type == .TextFieldAmount {
            
            self.cell?.txtInput.keyboardType = .decimalPad
        }
        else   if type == .TextFieldInteger {
            
            self.cell?.txtInput.keyboardType = .numberPad
        }
        else   if type == .TextFieldPassword {
            inputRules = ValidationRuleSet<String>()
            let minLengthRule = ValidationRuleLength(min: 4, error: ValidationError(message: "Min 4 Chars"))
            inputRules.add(rule: minLengthRule)
            self.cell?.txtInput.textContentType = UITextContentType.password
            self.cell?.txtInput.isSecureTextEntry = true
            
        }
        
        if(type != .TextFieldOptional){
            self.cell?.txtInput.validationRules=inputRules
            
            self.cell?.txtInput.setValidationBlock { (textField, text) -> [String : String]? in
                if (textField?.validate().isValid)! {
                    self.cell?.isValid=true
                    DispatchQueue.main.async {
                        
                        if #available(iOS 12.0, *) {
                            if self.cell?.traitCollection.userInterfaceStyle == .dark {
                                self.cell?.txtInput.textColor = UIColor.white
                            } else {
                                self.cell?.txtInput.textColor = UIColor.black
                            }
                        } else {
                            self.cell?.txtInput.textColor = UIColor.black
                        }
                        
                    }
                    return [ VALIDATION_INDICATOR_YES : "" ]
                }else{
                    self.cell?.isValid=true
                    DispatchQueue.main.async {
                        self.cell?.txtInput.textColor = UIColor.red
                    }
                    
                    return [ VALIDATION_INDICATOR_NO : "!" ]
                }
            }
        }
    }
}

extension String {
    var boolValue: Bool {
        switch self.lowercased() {
        case "true", "t", "yes", "y" , "1":
            return true
        case "false", "f", "no", "n", "", "0":
            return false
        default:
           
            return false
        }
    }
}
