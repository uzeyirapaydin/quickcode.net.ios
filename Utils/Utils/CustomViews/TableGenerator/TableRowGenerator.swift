//
//  TableRowGenerator.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//
import UIKit
import LRTextField
import CoreTelephony
import KMPlaceholderTextView


public class TableViewRowGenerator {
    var tableView: UITableView
    public var rows =  [(name: String, value: Any)]()
    var rowCells : [Int: UITableViewCell] = [:]
    var rowsIndex : [Int : String] = [:]
    var registeredNibs : Array<String> = []
    
    required public  init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    public func addNewRow(key: String, value: Any){
        rows.append((name: key, value: value))
        rowsIndex[rowsIndex.count] = key
        let valueNib=value as! TableViewRowNibItem
        if(!registeredNibs.contains(valueNib.nibName)){
            var className: AnyClass? = NSClassFromString("Utils." + valueNib.nibName)
            if className == nil {
               className = NSClassFromString(valueNib.nibName)!
            }
            tableView.register(UINib(nibName: valueNib.nibName, bundle: Bundle(for: className!)), forCellReuseIdentifier: valueNib.reuseIdentifier)
        }
    }
    
    public func getValue(key: String) -> String {
        
        for item in  rows.makeIterator() {
            if item.name == key {
                if let cellItem =  item.value as? TableViewRowTextFieldItem {
                    return (cellItem.cell?.txtInput.text)!
                }else if let cellItem =  item.value as? TableViewRowRichTextFieldItem {
                    return (cellItem.cell?.txtInput.text)!
                }
                else if let cellItem =  item.value as? TableViewRowStateItem {
                    return (cellItem.cell?.lblStateName.text)!
                }
            }
        }
        
        return ""
    }
    
    public func getIntValue(key: String) -> Int {
        
        for item in  rows.makeIterator() {
            if item.name == key {
                if let cellItem =  item.value as? TableViewRowStateItem {
                    return (cellItem.cell?.lblStateName.tag) ?? -1
                }
            }
        }
        
        return -1
    }
    
    public func isFormValid() -> Bool {
        let returnValue: Bool = true
        for item in  rows.makeIterator() {
            if item.value is TableViewRowTextFieldItem {
                if let cellItem =  item.value as? TableViewRowTextFieldItem {
                    let isCellValid =  cellItem.cell?.txtInput.validate().isValid
                    if !isCellValid! {
                        return false
                    }
                }
            }
            else if item.value is TableViewRowRichTextFieldItem {
                if let cellItem =  item.value as? TableViewRowRichTextFieldItem {
                    let isCellValid =  cellItem.cell?.txtInput.validate().isValid
                    if !isCellValid! {
                        return false
                    }
                }
            }
            else if item.value is TableViewRowImageItem {
                if let cItem = item.value as? TableViewRowImageItem {
                    let isValid : Bool = (cItem.cell?.addImage)!
                    
                    if isValid {
                        return false
                    }
                }
            }
            else if item.value is TableViewRowUserPhotoItem {
                if let cItem = item.value as? TableViewRowUserPhotoItem {
                    
                    if cItem.isOptional {
                        continue;
                    }
                    
                    if(cItem.cell?.imgPhoto.image == nil){
                        return false
                    }
                }
            }
            
            
        }
        
        return returnValue
    }
    
    public func getFormInvalidText() -> [String] {
        var returnValue: [String] = []
        for item in  rows.makeIterator() {
            if item.value is TableViewRowTextFieldItem {
                if let cellItem =  item.value as? TableViewRowTextFieldItem {
                    if(   !(cellItem.cell?.txtInput.validate().isValid)!){
                        for rule : AnyValidationRule<String>  in   (cellItem.cell?.txtInput.validationRules?.rules.makeIterator())! {
                            if !rule.validate(input: cellItem.cell?.txtInput.text) {
                                let stringMessage :  String  =  "\(cellItem.placeholderText) - \((rule.error as! ValidationError).message)"
                                returnValue.append(stringMessage)
                            }
                        }
                    }
                    
                }
            }
            if item.value is TableViewRowRichTextFieldItem {
                if let cellItem =  item.value as? TableViewRowRichTextFieldItem {
                    if(   !(cellItem.cell?.txtInput.validate().isValid)!){
                        for rule : AnyValidationRule<String>  in   (cellItem.cell?.txtInput.validationRules?.rules.makeIterator())! {
                            if !rule.validate(input: cellItem.cell?.txtInput.text) {
                                let stringMessage :  String  =  "\(cellItem.placeholderText) - \((rule.error as! ValidationError).message)"
                                returnValue.append(stringMessage)
                            }
                        }
                    }
                    
                }
            }
            else if item.value is TableViewRowImageItem {
                if let cItem = item.value as? TableViewRowImageItem {
                    let addImage : Bool = (cItem.cell?.addImage)!
                    if addImage {
                        returnValue.append(cItem.validationMessage)
                    }
                }
            }
            else if item.value is TableViewRowStateItem {
                if let cItem = item.value as? TableViewRowStateItem {
                    let isNotValid : Bool = (cItem.cell?.lblStateName.text == "Please Select State")
                    if isNotValid {
                        returnValue.append("State must be selected")
                    }
                }
            }
            else if item.value is TableViewRowUserPhotoItem {
                if let cItem = item.value as? TableViewRowUserPhotoItem {
                    let isEmpty : Bool = cItem.cell?.imgPhoto.image == nil
                    let isValid : Bool = cItem.cell!.isOptional || !isEmpty
                    if !isValid {
                        returnValue.append("User photo must be select")
                    }
                }
            }
        }
        
        return returnValue
    }
    
    public func getValueCell(key: String) -> Any {
        for item in  rows.makeIterator() {
            if item.name == key {
                return item.value
            }
        }
        
        return ""
    }
    
    public func setValueImage(key : String, image :  UIImage) {
        for item in  rows.makeIterator() {
            if item.name == key {
                if let cellItem =  item.value as? TableViewRowUserPhotoItem {
                    cellItem.cell!.contentMode = .center
                    
                    cellItem.cell!.viewUser.isHidden = !( cellItem.cell!.viewUser.isHidden)
                    cellItem.cell!.viewPhoto.isHidden = !( cellItem.cell!.viewPhoto.isHidden)
                    cellItem.cell!.imgPhoto.image = image
                    break
                }
            }
        }
    }
    
    public func getValueImage(key: String) -> Data? {
        
        for item in  rows.makeIterator() {
            if item.name == key {
                if let cellItem =  item.value as? TableViewRowUserPhotoItem {
                    if cellItem.cell!.imgPhoto.image != nil {
                        let imageData: Data = cellItem.cell!.imgPhoto.image!.jpegData(compressionQuality: 0.7)!
                        return  imageData
                    }
                    break
                }
                else if let cellItem =  item.value as? TableViewRowImageItem {
                    if cellItem.cell!.imageDriverLicense.image != nil {
                        let imageData: Data = cellItem.cell!.imageDriverLicense.image!.jpegData(compressionQuality: 0.7)!
                        return  imageData
                    }
                    break
                }
              
            }
        }
        
        return nil
    }
    
    public func getCell(indexPath: IndexPath) -> UITableViewCell  {
        let selectedNib = rowsIndex.lazy.filter{ r in r.key == indexPath.row }.first?.value
        let valueNib = rows.lazy.filter { r in r.name == selectedNib  }.first?.value  as! TableViewRowNibItem
        
        if rowCells[indexPath.row] != nil {
            return rowCells[indexPath.row]!
        }
        
        rowCells[indexPath.row] = self.tableView.dequeueReusableCell(withIdentifier: valueNib.reuseIdentifier, for: indexPath)
        var tableCell = rowCells[indexPath.row]

        if tableCell is TableHeaderViewCell {
            let rowCell = valueNib as! TableViewRowHeaderItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableHeaderViewCell
                rowCell.cell?.lblHeaderItem1.text=rowCell.titleTop
                rowCell.cell?.lblHeaderItem2.text=rowCell.titleDetail
                
            }else{
                tableCell = rowCell.cell!
            }
        }
        if tableCell is TableStateSelect {
            let rowCell = valueNib as! TableViewRowStateItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableStateSelect
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableInputTextCell {
            let rowCell = valueNib as! TableViewRowTextFieldItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableInputTextCell
                rowCell.cell?.txtInput.placeholder = rowCell.placeholderText
                rowCell.cell?.lblIcon.text=rowCell.iconValue
                addKeyboardToolBar(textField: (rowCell.cell?.txtInput)!)
                rowCell.setInputType()
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableInputRichTextCell {
            let rowCell = valueNib as! TableViewRowRichTextFieldItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableInputRichTextCell
                rowCell.cell?.txtInput.placeholder = rowCell.placeholderText
                rowCell.cell?.lblIcon.text=rowCell.iconValue
                addKeyboardToolBar(textField: (rowCell.cell?.txtInput)!)
                rowCell.setInputType()
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableButtonViewCell {
            let rowCell = valueNib as! TableViewTwoButtonItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableTwoButtonViewCell
                rowCell.cell?.btnNo.setTitle(rowCell.buttonNoTitle, for: UIControl.State.normal)
                rowCell.cell?.btnYes.setTitle(rowCell.buttonYesTitle, for: UIControl.State.normal)
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableTwoButtonViewCell {
            let rowCell = valueNib as! TableViewTwoButtonItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableTwoButtonViewCell
                rowCell.cell?.btnNo.setTitle(rowCell.buttonNoTitle, for: UIControl.State.normal)
                rowCell.cell?.btnYes.setTitle(rowCell.buttonYesTitle, for: UIControl.State.normal)
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableOneButtonViewCell {
            let rowCell = valueNib as! TableViewOneButtonItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableOneButtonViewCell
                rowCell.cell?.btnYes.setTitle(rowCell.buttonTitle, for: UIControl.State.normal)
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableUserPhotoViewCell {
            let rowCell = valueNib as! TableViewRowUserPhotoItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableUserPhotoViewCell
                rowCell.cell?.isOptional = rowCell.isOptional
                
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableImageViewCell {
            let rowCell = valueNib as! TableViewRowImageItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableImageViewCell
                rowCell.cell?.imageName = rowCell.imageName
                rowCell.cell?.popUpMessage = rowCell.popUpMessage
                rowCell.cell?.validationMessage = rowCell.validationMessage
                rowCell.cell!.reloadImage()
                
            }else{
                tableCell = rowCell.cell!
            }
        }
        else  if tableCell is TableLinkItemViewCell {
            let rowCell = valueNib as! TableLinkItem
            if rowCell.cell == nil {
                rowCell.cell = tableCell as? TableLinkItemViewCell
                
            }else{
                tableCell = rowCell.cell!
            }
            
        }
        else{
            print("Else")
        }
        
        return tableCell!
    }
    
    public func addKeyboardToolBar(textField : LRTextField) {
        var nextButton: UIBarButtonItem?
        let keyboardToolBar = UIToolbar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(textField.frame.size.width), height: CGFloat(25)))
        keyboardToolBar.sizeToFit()
        keyboardToolBar.barStyle = .default
        textField.inputAccessoryView = keyboardToolBar
        
        nextButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick(sender:)))
        
        keyboardToolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), nextButton] as? [UIBarButtonItem]
    }
    
    
    public func addKeyboardToolBar(textField : KMPlaceholderTextView) {
        var nextButton: UIBarButtonItem?
        let keyboardToolBar = UIToolbar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(textField.frame.size.width), height: CGFloat(25)))
        keyboardToolBar.sizeToFit()
        keyboardToolBar.barStyle = .default
        textField.inputAccessoryView = keyboardToolBar
        
        nextButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick(sender:)))
        
        keyboardToolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), nextButton] as? [UIBarButtonItem]
    }
    
    @objc func doneClick(sender : UIBarButtonItem) {
        tableView.endEditing(true)
    }
    
    
}

