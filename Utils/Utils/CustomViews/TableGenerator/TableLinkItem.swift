//
//  TableLinkItem.swift
//  Utils
//
//  Created by Uzeyir APAYDIN on 21.02.2019.
//  Copyright © 2019 Uzeyir APAYDIN. All rights reserved.
//

import Foundation


public class TableLinkItem : TableViewRowNibItem {
    public var linkCaption : String = ""
    public var linkButtonCaption : String = ""
    public var linkUrl : String = ""
    public var cell : TableLinkItemViewCell? = nil
    
//    public required convenience init(linkCaption: String, linkUrl : String, linkButtonCaption : String) {
//        self.init(nibName: "TableLinkItemViewCell", reuseIdentifier: "tableLinkItemViewCell", rowHeight: 45)
//        self.linkCaption=linkCaption
//        self.linkButtonCaption=linkButtonCaption
//        self.linkUrl=linkUrl
//    }
//    
    
    public required convenience init(parameters: [String: String] ) {
        self.init(nibName: "TableLinkItemViewCell", reuseIdentifier: "tableLinkItemViewCell", rowHeight: 45)
        initializeRow(linkCaption: parameters["LinkCaption"]!, linkUrl: parameters["LinkUrl"]!, linkButtonCaption: parameters["LinkButtonCaption"]!)
    }
    
    func initializeRow(linkCaption: String, linkUrl : String, linkButtonCaption : String){
        self.linkCaption=linkCaption
        self.linkButtonCaption=linkButtonCaption
        self.linkUrl=linkUrl
    }
}
