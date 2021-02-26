//
//  Helper.swift
//  LGSideMenuControllerDemo
//

import Foundation
import UIKit

func isLightTheme() -> Bool {
    if #available(iOS 13.0, *) {
        let currentStyle = UITraitCollection.current.userInterfaceStyle
        return currentStyle == .light || currentStyle == .unspecified
    }
    else {
        return true
    }
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
