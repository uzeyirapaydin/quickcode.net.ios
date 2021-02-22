//
//  TableViewRowUserPhotoItem.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 5.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation


public class TableViewRowUserPhotoItem : TableViewRowNibItem {
    
    public var cell : TableUserPhotoViewCell? = nil
    public var isOptional : Bool = true
    public required convenience init(isOptional : Bool ) {
        self.init(nibName: "TableUserPhotoViewCell", reuseIdentifier: "tableUserPhotoViewCell", rowHeight: 110)
        cell?.isOptional = isOptional
        self.isOptional = isOptional
    }
}

