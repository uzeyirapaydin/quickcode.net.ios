//
//  TableUserPhotoViewCell.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 1.08.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import ALCameraViewController
import Photos

public class TableUserPhotoViewCell: UITableViewCell {

    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lblPhotoIcon: UILabel!
    @IBOutlet weak var lblSmallIcon: UILabel!
    @IBOutlet weak var lblDeleteSmallIcon: UILabel!
    
    var cameraViewController : CameraViewController!
    var libraryViewController : UINavigationController!
    var libraryEnabled: Bool = true
    var croppingEnabled: Bool = true
    var allowResizing: Bool = true
    var allowMoving: Bool = true
    var minimumSize: CGSize = CGSize(width: 60, height: 60)
    var isOptional : Bool = true
    
    var croppingParameters: CroppingParameters {
        return CroppingParameters(isEnabled: croppingEnabled, allowResizing: allowResizing, allowMoving: allowMoving, minimumSize: minimumSize)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        lblPhotoIcon.font = UIFont.fontAwesome(ofSize: 55.0, style: .solid)
           lblSmallIcon.font = UIFont.fontAwesome(ofSize: 30.0, style: .solid)
        lblDeleteSmallIcon.font = UIFont.fontAwesome(ofSize: 30.0, style: .solid)
     
        self.viewPhoto.isHidden=true
        self.viewPhoto.isUserInteractionEnabled=true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.openCamera(_:)))
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.deleteImage))
        self.viewUser.addGestureRecognizer(gesture)
        self.lblDeleteSmallIcon.isUserInteractionEnabled=true
        self.lblDeleteSmallIcon.addGestureRecognizer(gesture2)
        
        
        let imageTapGesture = ImageTapGestureRecognizer(target: self, action: #selector(tapImageFunction))
        imageTapGesture.imageView=self.imgPhoto
        self.imgPhoto.isUserInteractionEnabled=true
        self.imgPhoto.addGestureRecognizer(imageTapGesture)
        
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.lblDeleteSmallIcon.backgroundColor = UIColor.black
                self.lblSmallIcon.backgroundColor = UIColor.black
            } else {
                self.lblDeleteSmallIcon.backgroundColor = UIColor.white
                self.lblSmallIcon.backgroundColor = UIColor.white
            }
        } else {
            self.lblDeleteSmallIcon.backgroundColor = UIColor.black
            self.lblSmallIcon.backgroundColor = UIColor.black
        }
    }
    
    
    @objc func tapImageFunction(sender:UITapGestureRecognizer) {
        let imageRecognizer = ( sender as! ImageTapGestureRecognizer)
        
        //KMPopUp.ShowMessage( (self.parentViewController?.parent)!, message: "User Photo", image: imageRecognizer.imageView?.image)
    }
    
    @objc func deleteImage(sender : UITapGestureRecognizer) {
        
        self.viewUser.isHidden = false
        self.viewPhoto.isHidden = true
        self.imgPhoto.image=nil
        
    
        // self.window?.rootViewController?.present(imagePickerViewController, animated: true, completion: nil)
    }
    
    @objc func openCamera(_ sender: Any) {
        cameraViewController = CameraViewController(croppingParameters: croppingParameters, allowsLibraryAccess: libraryEnabled) { [weak self] image, asset in
            
            if image != nil {
                self?.viewUser.isHidden = !(self?.viewUser.isHidden)!
                self?.viewPhoto.isHidden = !(self?.viewPhoto.isHidden)!
                var imgResized = image
                let maxWidth : CGFloat = 600
                if (imgResized?.size.width)! > maxWidth {
                    imgResized = imgResized?.resized(toWidth: maxWidth)
                }
                self?.imgPhoto.image = imgResized
            }

            
            self?.cameraViewController.dismiss(animated: true, completion: nil)
          
        }
        
     
          self.window?.rootViewController?.present(cameraViewController, animated: true, completion: nil)
    }
    
    @objc func openLibrary(_ sender: Any) {
         libraryViewController = CameraViewController.imagePickerViewController(croppingParameters: croppingParameters) { [weak self] image, asset in
          
            if image != nil {
                self?.viewUser.isHidden = !(self?.viewUser.isHidden)!
                self?.viewPhoto.isHidden = !(self?.viewPhoto.isHidden)!
                self?.imgPhoto.image = image
            }
            

             self?.libraryViewController.dismiss(animated: true, completion: nil)
        }
        
          self.window?.rootViewController?.present(libraryViewController, animated: true, completion: nil)
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
