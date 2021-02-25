//
//  TableViewRowMenuHeader.swift
//  QuickCode.Net
//
//  Created by Uzeyir APAYDIN on 13.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit

public class TableViewRowMenuHeader: UITableViewCell {

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet private weak var imageHeader: UIImageView!
    @IBOutlet private weak var lblDriverName: UILabel!
    @IBOutlet private weak var lblPlateNumber: UILabel!
    
    public func getImageHeader() -> UIImageView {
        return imageHeader
    }
    
    public func getlblDriverName() -> UILabel {
        return lblDriverName
    }
    
    public func getlblPlateNumber() -> UILabel {
        return lblPlateNumber
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
