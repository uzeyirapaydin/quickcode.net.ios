//
//  TableViewRowHeaderItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation

public class TableViewRowStateItem : TableViewRowNibItem {

    var cell : TableStateSelect? = nil
    
    public required convenience init() {
        self.init(nibName: "TableStateSelect", reuseIdentifier: "tableStateSelect")
    }
    
    public required convenience init(parameters: [String: String]) {
        self.init(nibName: "TableStateSelect", reuseIdentifier: "tableStateSelect")
        initializeRow()
    }
    
    func initializeRow() {
        
    }
}
