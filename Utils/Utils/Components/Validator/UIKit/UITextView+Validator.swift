//
//  UITextView+Validator.swift
//  Validator
//
//  Created by Adam Waite on 31/10/2016.
//  Copyright © 2016 adamjwaite.co.uk. All rights reserved.
//

import UIKit

extension UITextView: ValidatableInterfaceElement {
    
    public typealias InputType = String
    
    open var inputValue: String? { return text }
    
    open func validateOnInputChange(enabled: Bool) {
        switch enabled {
        case true: NotificationCenter.default.addObserver(self, selector: #selector(validate3), name: UITextView.textDidChangeNotification, object: self)
        case false: NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
        }
    }
    
    @objc internal func validate3(_ sender: Notification) {
        validate()
    }
    
}

