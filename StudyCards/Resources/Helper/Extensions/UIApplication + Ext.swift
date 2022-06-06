//
//  UIApplication + Ext.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit

extension UIApplication {
    static var appCurrentWindow : UIWindow? {
        return UIApplication.shared.connectedScenes
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    static var foregroundKeyWindow : UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    class func currentVCOnCurrentWindow(_ controller: UIViewController? = UIApplication.appCurrentWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return currentVCOnCurrentWindow(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return currentVCOnCurrentWindow(selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return currentVCOnCurrentWindow(presented)
        }
        return controller
    }
}
