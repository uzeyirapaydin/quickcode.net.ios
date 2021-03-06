//
//  AppDelegate.swift
//  quickcode.net
//
//  Created by Uzeyir APAYDIN on 22.02.2021.
//

import UIKit
import CoreData
import SwiftMessages
import QuickCodeNetClient

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "quickcode_net")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func showInfoMessage(title: String, message: String ){
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level(rawValue: UIWindow.Level.statusBar.rawValue))
        
        config.interactiveHide = false
        SwiftMessages.show (config: config) {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.warning)
            view.configureDropShadow()
            let iconText = ["🔔"].randomItem!
            view.configureContent(title: title, body:  message, iconText: iconText)
            view.button?.isHidden = true
            return view
        }
    }
    
//    func clearCustomerData(){
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "CustomerData")
//        self.customerData = CustomerData(customerId: -1, customerName: "",customerSurname: "",customerEmail: "",  firebaseId: "")
//    }
//    
//
//    
//    func getCustomerData() -> CustomerData {
//        
//        let defaults = UserDefaults.standard
//        
//        if let customerDataString = defaults.value(forKey: "CustomerData") {
//            
//            let customerData =  try? JSONDecoder().decode(CustomerData.self, from: customerDataString as! Data)
//            if customerData == nil {
//               clearCustomerData()
//                
//                Installations.installations().delete(completion: { (error) in
//                    print(error.debugDescription)
//                })
//  
//                
//                let storyboard = UIStoryboard(name: "Login", bundle: nil)
//                let navigationController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
//                
//                navigationController.setViewControllers([storyboard.instantiateViewController(withIdentifier: "welcome")], animated: false)
//                let window = UIApplication.shared.delegate!.window!!
//                window.rootViewController = navigationController
//                
//                UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//            }
//            else{
//                self.customerData=customerData!
//            }
//            
//            
//            
//            
//            return self.customerData
//        }
//        
//        return self.customerData;
//    }

}

