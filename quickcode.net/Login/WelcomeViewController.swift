//
//  ViewController.swift
//  QuickCode.Net
//
//  Created by Uzeyir APAYDIN on 22.05.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import QuickCodeNetClient
import NVActivityIndicatorView
import Utils


class WelcomeViewController: UIViewController , NVActivityIndicatorViewable {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBAction func btnSignUp_click(_ sender: UIButton) {

    }
    
    @IBAction func btnLogin_click(_ sender: UIButton) {
        let v  = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        let group = DispatchGroup()

//            let driverData = self.appDelegate.getCustomerData()
//            
//            if( driverData.customerId > 0){
//                let size = CGSize(width: 60, height: 60)
//                startAnimating(size, message: "Please wait...", type: NVActivityIndicatorType.ballClipRotatePulse, fadeInAnimation: nil)
//              
//                
//                let dispatchQueue = DispatchQueue.global()
//
//                print("before")
//
//                dispatchQueue.sync {
//                   
//                }
//                
//                group.notify(queue: .main) {
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let navigationController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
//                
//                
//                navigationController.setViewControllers([storyboard.instantiateViewController(withIdentifier: "Dashboard")], animated: false)
//                
//                
//                let mainViewController = storyboard.instantiateInitialViewController() as! MainViewController
//                mainViewController.rootViewController = navigationController
//                mainViewController.setup(type: 6)
//                
//                let window = UIApplication.shared.delegate!.window!!
//                window.rootViewController = mainViewController
//                
//                UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//                }
//            }
       

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

