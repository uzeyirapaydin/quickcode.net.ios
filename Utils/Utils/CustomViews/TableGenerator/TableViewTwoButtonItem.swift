//
//  TableViewTwoButtonItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation


public class TableViewTwoButtonItem : TableViewRowNibItem {
    var buttonYesTitle : String = ""
    var buttonNoTitle : String = ""
    public var cell : TableTwoButtonViewCell? = nil
    
//    public required convenience init(buttonYesTitle: String, buttonNoTitle: String) {
//        self.init(nibName: "TableTwoButtonViewCell", reuseIdentifier: "tableTwoButtonViewCell", rowHeight: 75)
//        self.buttonNoTitle=buttonNoTitle
//        self.buttonYesTitle=buttonYesTitle
//    }
//    
    
    public required convenience init(parameters: [String: String]) {
        self.init(nibName: "TableTwoButtonViewCell", reuseIdentifier: "tableTwoButtonViewCell", rowHeight: 75)
        initializeRow(buttonYesTitle: parameters["ButtonYesTitle"]!,buttonNoTitle: parameters["ButtonNoTitle"]!)
    }
    
    func initializeRow(buttonYesTitle: String, buttonNoTitle: String){
        self.buttonNoTitle=buttonNoTitle
        self.buttonYesTitle=buttonYesTitle
    }
}
