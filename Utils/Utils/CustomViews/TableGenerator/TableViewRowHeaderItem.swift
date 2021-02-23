//
//  TableViewRowHeaderItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation

public class TableViewRowHeaderItem : TableViewRowNibItem {
    var titleTop : String = ""
    var titleDetail : String = ""
    var cell : TableHeaderViewCell? = nil
    
//    public required convenience init(titleTop: String, titleDetail: String) {
//        self.init(nibName: "TableHeaderViewCell", reuseIdentifier: "tableHeaderViewCell", rowHeight: 110)
//        self.titleTop=titleTop
//        self.titleDetail=titleDetail
//    }
    
    public required convenience init(parameters: [String: String]) {
        self.init(nibName: "TableHeaderViewCell", reuseIdentifier: "tableHeaderViewCell", rowHeight: 110)
        initializeRow(titleTop: parameters["TitleTop"]!, titleDetail: parameters["TitleDetail"]!)
    }
    
    func initializeRow(titleTop: String, titleDetail: String){
        self.titleTop = titleTop
        self.titleDetail = titleDetail
    }
    
}
