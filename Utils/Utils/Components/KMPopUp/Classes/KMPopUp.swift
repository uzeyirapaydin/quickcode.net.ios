//
//  KMPopUp.swift
//  KMPopUp
//
//  Created by Kirollos Maged Youssef Sawerous on 1/23/18.
//

import Foundation
import UIKit


public class KMPopUp {
    
    public static func ShowMessageWithDuration(_ delegate : UIViewController , message: String = "",image : UIImage? ,duration: Double = 1.0,withAlpha: CGFloat? = 0.8) {
        if image != nil {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KMPopUpViewController") as! KMPopUpViewController
            popUpVC.message = message
            popUpVC.duration = duration
            popUpVC.Alpha = withAlpha!
            
            popUpVC.messageImage = image!
            
            popUpVC.witImage = true
            
            popUpVC.modalPresentationStyle = .overCurrentContext
            popUpVC.view.frame = delegate.view.frame
            delegate.present(popUpVC, animated: true)
        }
    }
    
    public static func ShowMessageWithDuration(_ delegate : UIViewController , message: String = "",image : String ,duration: Double = 1.0,withAlpha: CGFloat? = 0.8) {
        ShowMessageWithDuration(delegate, message: message, image: UIImage(named: image)!,duration:duration, withAlpha: withAlpha)
    }
    
    public static func ShowMessage(_ delegate : UIViewController , message: String = "",image : String ,withAlpha: CGFloat? = 0.8) {
        ShowMessageWithDuration(delegate, message: message, image: UIImage(named: image)!,duration: 0.0, withAlpha: withAlpha)
    }
    
    public static func ShowMessage(_ delegate : UIViewController , message: String = "",image : UIImage? , withAlpha: CGFloat? = 0.8) {
        ShowMessageWithDuration(delegate, message: message, image: image, duration:0.0, withAlpha: withAlpha)
    }
    

    public static func ShowScreenPopUp(_ delegate : UIViewController , message: String = "",image : UIImage ,withAlpha: CGFloat? = 0.8) {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KMPopUpViewController") as! KMPopUpViewController
        popUpVC.message = message
        popUpVC.duration = -1.0
        popUpVC.Alpha = withAlpha!
        popUpVC.messageImage = image
        popUpVC.witImage = true
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.view.frame = delegate.view.frame
        delegate.present(popUpVC, animated: true)
    }

    public static func ShowScreenPopUp(_ delegate : UIViewController , message: String = "",image : String ,withAlpha: CGFloat? = 0.8) {
      ShowScreenPopUp(delegate, message: message, image: UIImage(named: image)! , withAlpha: withAlpha)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
