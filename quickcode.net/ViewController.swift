//
//  ViewController.swift
//  quickcode.net
//
//  Created by Uzeyir APAYDIN on 22.02.2021.
//

import UIKit
import Utils
import NVActivityIndicatorView
import SCLAlertView

class ViewController: UITableViewController , NVActivityIndicatorViewable{

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDataSource =  TableViewRowGenerator(tableView: self.inputTableView)
        inputTableView.isUserInteractionEnabled=true
        RegisterTableViewCells()

    }

    @IBOutlet weak var inputTableView: UITableView!
    var tableViewDataSource : TableViewRowGenerator? = nil
    func RegisterTableViewCells(){
        var generatedTableViewRowData = [(key : String , value : [ String : [String:String]])]()
        generatedTableViewRowData.insert((key: "Header", value: ["TableViewRowHeaderItem" : ["TitleTop" : "QuickCode.Net", "TitleDetail" : "Sign Up"]]), at: 0)
        generatedTableViewRowData.insert((key: "userPhoto", value: ["TableViewRowUserPhotoItem" : ["IsOptional" : "false"]]), at: 1)
        generatedTableViewRowData.insert((key: "name", value: ["TableViewRowTextFieldItem" : ["PlaceholderText" : "Name", "IconValue" : ""]]), at: 2)
        generatedTableViewRowData.insert((key: "surname", value: ["TableViewRowTextFieldItem" : ["PlaceholderText" : "Surname", "IconValue" : ""]]), at: 3)
        generatedTableViewRowData.insert((key: "phone", value: ["TableViewRowTextFieldItem" : ["PlaceholderText" : "Phone Number", "IconValue" : "" , "Type" : "TextFieldPhone"]]), at: 4)
        
        for (rowIndex, rowData) in generatedTableViewRowData.enumerated(){
            
            let rowKey = rowData.key
            let rowDataValue = rowData.value
            print(rowIndex)
            print(rowKey)
            for (rowType, rowParameters) in rowDataValue {
                var newRowItem : AnyObject? = nil
                
                if rowType == "TableViewRowHeaderItem" {
                    newRowItem = TableViewRowHeaderItem(parameters: rowParameters)
                }
                else if rowType == "TableViewRowTextFieldItem" {
                    newRowItem = TableViewRowTextFieldItem(parameters: rowParameters)
                }
                else if rowType == "TableViewRowUserPhotoItem" {
                    newRowItem = TableViewRowUserPhotoItem(parameters: rowParameters)
                }
                else if rowType == "TableViewRowStateItem" {
                    newRowItem = TableViewRowStateItem(parameters: rowParameters)
                }
                else if rowType == "TableViewRowRichTextFieldItem" {
                    newRowItem = TableViewRowRichTextFieldItem(parameters: rowParameters)
                }
                else if rowType == "TableViewTwoButtonItem" {
                    newRowItem = TableViewTwoButtonItem(parameters: rowParameters)
                }
                else if rowType == "TableViewOneButtonItem" {
                    newRowItem = TableViewOneButtonItem(parameters: rowParameters)
                }
                else if rowType == "TableViewRowImageItem" {
                    newRowItem = TableViewRowImageItem(parameters: rowParameters)
                }
                else if rowType == "TableLinkItem" {
                    newRowItem = TableLinkItem(parameters: rowParameters)
                }
                
                if newRowItem != nil {
                    tableViewDataSource?.addNewRow(key: rowKey, value: newRowItem!)
                }
                
            }
        }

        
//        tableViewDataSource?.addNewRow(key: "Header", value: TableViewRowHeaderItem(parameters: generatedTableViewRowData["Header"]!))
//        tableViewDataSource?.addNewRow(key: "Header", value: TableViewRowHeaderItem(titleTop: "QuickCode.Net", titleDetail: "Sign Up"))
//        tableViewDataSource?.addNewRow(key: "userPhoto", value: TableViewRowUserPhotoItem(isOptional: false))
//        tableViewDataSource?.addNewRow(key: "name", value: TableViewRowTextFieldItem(placeholderText: "Name", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "surname", value: TableViewRowTextFieldItem(placeholderText: "Surname", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "phone", value: TableViewRowTextFieldItem(placeholderText: "Mobile Phone Number", iconValue: "", type: .TextFieldPhone))
//        tableViewDataSource?.addNewRow(key: "email", value: TableViewRowTextFieldItem(placeholderText: "Email", iconValue: "", type: .TextFieldEmail))
//        tableViewDataSource?.addNewRow(key: "password", value: TableViewRowTextFieldItem(placeholderText: "Password", iconValue: "", type: .TextFieldPassword))
//
//        tableViewDataSource?.addNewRow(key: "state", value: TableViewRowStateItem())
//        tableViewDataSource?.addNewRow(key: "socialSecurityNo", value: TableViewRowTextFieldItem(placeholderText: "Social Security Number", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "licenseId", value: TableViewRowTextFieldItem(placeholderText: "Driver License Id", iconValue: ""))
//
//        tableViewDataSource?.addNewRow(key: "licenseImage", value: TableViewRowImageItem(imageName: "Driver License", popUpMessage: "Driver License Image", validationMessage: "Driver License Image"))
//        tableViewDataSource?.addNewRow(key: "vehicleInsuranceImage", value: TableViewRowImageItem(imageName: "Vehicle Insurance", popUpMessage: "Vehicle Insurance Image", validationMessage: "Vehicle Insurance Image"))
//        tableViewDataSource?.addNewRow(key: "vehicleRegistrationImage", value: TableViewRowImageItem(imageName: "Vehicle Registration", popUpMessage: "Vehicle Registration Image", validationMessage: "Vehicle Registration Image"))
//        tableViewDataSource?.addNewRow(key: "brandName", value: TableViewRowTextFieldItem(placeholderText: "Vehicle Brand Name", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "plateNumber", value: TableViewRowTextFieldItem(placeholderText: "Vehicle Plate Number", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "address", value: TableViewRowRichTextFieldItem(placeholderText: "Address", iconValue: ""))
//        tableViewDataSource?.addNewRow(key: "buttons", value: TableViewTwoButtonItem(buttonYesTitle: "Sign Up", buttonNoTitle: "Cancel"))
//
//        tableViewDataSource?.addNewRow(key: "link", value: TableLinkItem(linkCaption: "By Signing up, you are agree to our", linkUrl : "https://www.uzeyirapaydin.com" , linkButtonCaption : "Terms & Conditions."))
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource!.rows.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell =  tableViewDataSource?.rows.item(at:indexPath.row)!.value as! TableViewRowNibItem
        return cell.rowHeight;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableViewDataSource?.getCell(indexPath: indexPath)
        
        if cell is TableTwoButtonViewCell  {
            let buttonRow = tableViewDataSource?.getValueCell(key: "buttons") as! TableViewTwoButtonItem
            buttonRow.cell?.btnYes.addTarget(self, action: #selector(buttonYesAction), for: .touchUpInside)
            buttonRow.cell?.btnNo.addTarget(self, action: #selector(buttonNoAction), for: .touchUpInside)
        }
        else  if cell is TableLinkItemViewCell  {
            let linkRow = tableViewDataSource?.getValueCell(key: "link") as! TableLinkItem
            linkRow.cell?.lblLinkButton.addTarget(self, action: #selector(openLinkAction), for: .touchUpInside)
            linkRow.cell?.lblLinkText.text=linkRow.linkCaption
            linkUrl = linkRow.linkUrl
            
            linkRow.cell?.lblLinkButton.titleLabel?.text=linkRow.linkButtonCaption
        }
        return cell!
    }
    var linkUrl : String = ""
    @objc func openLinkAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Terms & Conditions", message: "By Signing up, you are agree to our Terms & Conditions.", preferredStyle: .actionSheet)
        alert.view.superview?.subviews[0].isUserInteractionEnabled = false
        if let url = URL(string: linkUrl) {
            do {
                let contents = try String(contentsOf: url)
                let data = Data(contents.utf8)

                if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {

                    alert.addTextViewer(text: .html(attributedString), editable: false)
                }
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        alert.show(animated: true, vibrate: true, style: nil) {
//            alert.view.superview?.subviews[0].isUserInteractionEnabled = false
        }
    }
    
    
    
    @objc func buttonYesAction(sender: UIButton!) {
        let rows = tableViewDataSource
        
        
        if (rows?.isFormValid())! {
            
            
           
        }else{
            
            let errorMessages = rows?.getFormInvalidText()
            self.appDelegate.showInfoMessage(title: "Please check fields", message: (errorMessages?.joined(separator: "\n"))!)
        }
        
    }
    
    @objc func buttonNoAction(sender: UIButton!) {
//        let v  = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
//        self.navigationController?.pushViewController(v, animated: true)
    }
        
    
}


public class TableViewRowGeneratorData {
    public var key : String = ""
    public var rowData = [[String :String]]()
    init() {
        rowData.append(["": ""])
    }
}
