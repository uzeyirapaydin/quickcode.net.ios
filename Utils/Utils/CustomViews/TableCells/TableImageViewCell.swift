//
//  TableImageViewCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 30.12.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import ALCameraViewController
import Photos

public class TableImageViewCell: UITableViewCell {
    
    
    var cameraViewController : CameraViewController!
    var libraryViewController : UINavigationController!
    var libraryEnabled: Bool = true
    var croppingEnabled: Bool = true
    var allowResizing: Bool = true
    var allowMoving: Bool = true
    var minimumSize: CGSize = CGSize(width: 60, height: 60)
    var addImage : Bool = true
    var imageName : String = ""
    var popUpMessage : String = ""
    var validationMessage : String = ""
    
    var croppingParameters: CroppingParameters {
        return CroppingParameters(isEnabled: croppingEnabled, allowResizing: allowResizing, allowMoving: allowMoving, minimumSize: minimumSize)
    }
    

    public func reloadImage(){
        let image = UIImage(named: imageName)
        addDriverLicenseImage(image: image!)

    }
    
    @IBOutlet weak var viewAddImage: UIView!
    @IBOutlet weak var lblAddImage: UILabel!
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.imageDriverLicense.isUserInteractionEnabled=true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.btnAddImage(_:)))

        self.viewAddImage.addGestureRecognizer(gesture)
        
        let imageTapGesture = ImageTapGestureRecognizer(target: self, action: #selector(tapImageFunction))
        imageTapGesture.imageView=self.imageDriverLicense
        self.imageDriverLicense.isUserInteractionEnabled=true
        self.imageDriverLicense.addGestureRecognizer(imageTapGesture)
    }

    
    @objc func tapImageFunction(sender:UITapGestureRecognizer) {
        let imageRecognizer = ( sender as! ImageTapGestureRecognizer)
        
        KMPopUp.ShowMessage( (self.parentViewController?.parent)!, message: popUpMessage, image: imageRecognizer.imageView?.image)
    }
    
    
    func addDriverLicenseImage(image : UIImage){
        self.imageDriverLicense.image = image.aspectFitImage(inRect: self.imageDriverLicense.frame)
        self.imageDriverLicense.contentMode = .topLeft
        
    }

    @IBOutlet weak var imageDriverLicense: UIImageView!
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func btnAddImage(_ sender: Any) {
        if addImage {
            openCamera(sender)
        }else{
            let image = UIImage(named: imageName)
            addDriverLicenseImage(image: image!)
            addImage=true
            lblAddImage.text=""
            imageDriverLicense.alpha=0.5
            lblAddImage.textColor = UIColor.black
        }
    }
    
    @objc func openCamera(_ sender: Any) {
        cameraViewController = CameraViewController(croppingParameters: croppingParameters, allowsLibraryAccess: libraryEnabled) { [weak self] image, asset in
            
            if image != nil {
            
                var imgResized = image
                let maxWidth : CGFloat = 2000
                if (imgResized?.size.width)! > maxWidth {
                    imgResized = imgResized?.resized(toWidth: maxWidth)
                }
                
                self?.addImage = false
                self?.lblAddImage.text=""
                self!.lblAddImage.textColor = UIColor.red
                self!.imageDriverLicense.alpha=1

                
                self!.addDriverLicenseImage(image: imgResized!)
             
            }
            
            
            self?.cameraViewController.dismiss(animated: true, completion: nil)
            
        }
        
        
        self.window?.rootViewController?.present(cameraViewController, animated: true, completion: nil)
    }
    
    @objc func openLibrary(_ sender: Any) {
        libraryViewController = CameraViewController.imagePickerViewController(croppingParameters: croppingParameters) { [weak self] image, asset in
            
            if image != nil {
                
                self!.addDriverLicenseImage(image: image!)
                self?.addImage = false
                self?.lblAddImage.text=""
                self!.lblAddImage.textColor = UIColor.red
                self!.imageDriverLicense.alpha=1
            }
            
         
            
            self?.libraryViewController.dismiss(animated: true, completion: nil)
        }
        
        self.window?.rootViewController?.present(libraryViewController, animated: true, completion: nil)
    }
}
