//
//  LoginViewController.swift
//  QuickCode.Net
//
//  Created by Uzeyir APAYDIN on 23.05.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import MaterialTextField
import QuickCodeNetClient
import UITextField_Shake
import SCLAlertView
import UserNotifications
import NVActivityIndicatorView
import Utils

class LoginViewController: UIViewController,UITextFieldDelegate,NVActivityIndicatorViewable, UIScrollViewDelegate {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var viewBackground: UIImageView!
    @IBAction func btnForgetPassword_click(_ sender: UIButton) {
      
    }
    @IBOutlet weak var txtEmail: MFTextField!
    @IBOutlet weak var txtPassword: MFTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.hideKeyboardWhenTappedAround()
        
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.keyboardWillChange(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.keyboardWillChange(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.keyboardWillChange(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
        txtEmail.autocorrectionType = .no
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    func hideKeyboard(){
        txtPassword.resignFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func btnBack_click(_ sender: UIButton) {
         hideKeyboard()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
    }
    
    func checkIsUserLogin(){
        
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        hideKeyboard()
        let size = CGSize(width: 60, height: 60)
        startAnimating(size, message: "Please wait...", type: NVActivityIndicatorType.ballClipRotatePulse, fadeInAnimation: nil)
        //appDelegate.clearCustomerData()
        let group = DispatchGroup()
        var portalLoginRequest : PortalLoginRequest = PortalLoginRequest(username: txtEmail.text, password: txtPassword.text)
        PortalAPI.portalLogin(body: portalLoginRequest) { (response, error) in
            self.stopAnimating()
            if response?.code == 0 {
                self.appDelegate.showInfoMessage(title: "Login Success", message: "Login Success")
      
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
                vc.modalPresentationStyle = .fullScreen
                        vc.modalTransitionStyle = .crossDissolve

                UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
                

      
               
            }else{
                
                self.txtEmail.shake(10,              // 10 times
                                    withDelta: 5.0,  // 5 points wide
                                    speed: 0.08,     // 30ms per shake
                                    shakeDirection: ShakeDirection.horizontal
                )
                
                self.appDelegate.showInfoMessage(title: "Login Error", message: "Please check email and password.")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80), execute: {
                    self.txtPassword.shake(10,              // 10 times
                                           withDelta: 5.0,  // 5 points wide
                                           speed: 0.08,     // 30ms per shake
                                           shakeDirection: ShakeDirection.horizontal
                    ){
                        
                        
                    }
                })
                
                
            }
           
        }
//        let customerLoginRequest :  CustomerLoginRequest = CustomerLoginRequest(email: txtEmail.text, password: txtPassword.text, result: nil )
//        CallStoredProceduresAPI.callStoredProceduresCallCustomerLogin(request: customerLoginRequest) { (response, error) in
//            
//            
//            if error == nil {
//                if (response?.value?.returnTable?.count)!>0 {
//                    let responseItem =  response?.value?.returnTable?.first
//                    
//                    let customerData : CustomerData = CustomerData(customerId: (responseItem?._id)!, customerName: (responseItem?.name)!, customerSurname: (responseItem?.surname)!, customerEmail: (responseItem?.email)! ,firebaseId:"")
//                    self.appDelegate.showInfoMessage(title: "Login Success", message: "Login Success")
//                    self.appDelegate.saveCustomerData(customerData: customerData)
//                    
//                    
//                    
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let navigationController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
//                    Messaging.messaging().token { token, error in
//                        if let error = error {
//                            print("Error fetching remote instange ID: \(error)")
//                        } else {
//                            print("Remote instance ID token: \(token ?? "")")
//                            let requestUpdateFirebaseId =  UpdateCustomerFirebaseIdRequest(customerId: customerData.customerId, firebaseId: token)
//                            
//                            self.appDelegate.updateFirebaseIdCustomerData(firebaseId: token!)
//                            self.appDelegate.FillCustomHeaders()
//                            
//                            CustomerAPI.customerUpdateFirebaseId(request: requestUpdateFirebaseId) { (response, error) in
//                                //Messaging.messaging().shouldEstablishDirectChannel = true
//                                
//                                group.enter()
//                                StateAPI.stateGetAvailableStates { [self] (response, error) in
//                                    if (error == nil) {
//                                        self.appDelegate.availableStateList =  (response?.value)!
//                                    }
//                                    
//                                    group.leave()
//                                }
//                                
//                                group.enter()
//                                VehicleTypeAPI.vehicleTypeList(listRequest: ListRequest(pageNumber: nil, pageSize: nil)) { (response, error) in
//                                    if (error == nil) {
//                                        self.appDelegate.availableVehicleTypeList =  (response?.value)!
//                                    }
//                                    group.leave()
//                                }
//                                
//                                group.notify(queue: .main) {
//                                    self.stopAnimating()
//                                    
//                                    navigationController.setViewControllers([storyboard.instantiateViewController(withIdentifier: "Dashboard")], animated: false)
//                                    
//                                    
//                                    let mainViewController = storyboard.instantiateInitialViewController() as! MainViewController
//                                    mainViewController.rootViewController = navigationController
//                                    mainViewController.setup(type: 6)
//                                    
//                                    let window = UIApplication.shared.delegate!.window!!
//                                    window.rootViewController = mainViewController
//                                    
//                                    UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//                                }
//                            }
//                        }
//                    }
//                    
//                    
//                    
//                }else{
//                    
//                    self.txtEmail.shake(10,              // 10 times
//                        withDelta: 5.0,  // 5 points wide
//                        speed: 0.08,     // 30ms per shake
//                        shakeDirection: ShakeDirection.horizontal
//                    )
//                    
//                    self.appDelegate.showInfoMessage(title: "Login Error", message: "Please check email and password.")
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80), execute: {
//                        self.txtPassword.shake(10,              // 10 times
//                            withDelta: 5.0,  // 5 points wide
//                            speed: 0.08,     // 30ms per shake
//                            shakeDirection: ShakeDirection.horizontal
//                        ){
//                            
//                            
//                        }
//                    })
//                    
//                    
//                    
//                }
//            }
//        }
//        
       
       
        
      
    }
    @objc func keyboardWillChange(notification: NSNotification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue  else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification{
//            if  view.frame.origin.y < 0{
//                view.frame.origin.y = 0
//            }else{
                view.frame.origin.y = -keyboardRect.height
//            }
        }else{
            view.frame.origin.y = 0
        }
    }
    
    
    
    @objc func keyboardWillDissapear(notification: NSNotification){
        // print(notification)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //tap.cancelsTouchesInView = false
        viewBackground.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension UIViewController {
  
}
