//
//  TableViewTwoButtonItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation


public class TableViewOneButtonItem : TableViewRowNibItem {
    var buttonTitle : String = ""
    
    public var cell : TableOneButtonViewCell? = nil
    
    public required convenience init(buttonTitle: String) {
        self.init(nibName: "TableOneButtonViewCell", reuseIdentifier: "tableOneButtonViewCell", rowHeight: 75)
        self.buttonTitle=buttonTitle
        
    }
}
