//
//  TableViewRowUserPhotoItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation


public class TableViewRowImageItem : TableViewRowNibItem {
    
    public var cell : TableImageViewCell? = nil
    var imageName : String = ""
    var popUpMessage : String = ""
    var validationMessage : String = ""
    
//    public required convenience init(imageName: String, popUpMessage :  String, validationMessage:String,  isReadonly: Bool = false) {
//        self.init(nibName: "TableImageViewCell", reuseIdentifier: "tableImageViewCell", rowHeight: 130)
//        self.imageName = imageName
//        self.popUpMessage = popUpMessage
//        self.validationMessage = validationMessage
//        cell?.imageName = imageName
//        cell?.popUpMessage = popUpMessage
//        cell?.validationMessage = validationMessage
//    }
//
    
    public required convenience init(parameters: [String: String] ) {
        self.init(nibName: "TableImageViewCell", reuseIdentifier: "tableImageViewCell", rowHeight: 130)
        initializeRow(imageName: parameters["ImageName"]!,popUpMessage: parameters["PopUpMessage"]!,  validationMessage: parameters["ValidationMessage"]!, isReadonly: (parameters["IsReadonly"] ?? "").boolValue)
    }
    
    func initializeRow(imageName: String, popUpMessage :  String, validationMessage:String,  isReadonly: Bool = false){
        self.imageName = imageName
        self.popUpMessage = popUpMessage
        self.validationMessage = validationMessage
        cell?.imageName = imageName
        cell?.popUpMessage = popUpMessage
        cell?.validationMessage = validationMessage
    }
    
}

