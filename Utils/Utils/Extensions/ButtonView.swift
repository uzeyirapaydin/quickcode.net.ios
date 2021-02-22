//
//  ButtonView.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 14.11.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import Foundation

public class ButtonView : UIView {
    
    var backColor : UIColor?
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backColor = self.backgroundColor
        self.backgroundColor = backColor?.withAlphaComponent(0.5)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = backColor
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = backColor
    }
}


public extension UIImage {
    
    func aspectFitImage(inRect rect: CGRect) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        var scaleFactor = width > height ? rect.size.height / height : rect.size.width / width
        
        if height > rect.size.height {
            scaleFactor = rect.size.height / height
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width * scaleFactor, height: height * scaleFactor), false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width * scaleFactor, height: height * scaleFactor))
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


public class ImageTapGestureRecognizer: UITapGestureRecognizer {
   public var imageView: UIImageView?
}

public extension Data
{
    func toString() -> String?
    {
        return String(data: self, encoding: .utf8)
    }
    
}
