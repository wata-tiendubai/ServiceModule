// tran tuan vu 

import UIKit
enum ScreenCoordinator {
    static func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
        let vc = viewController ?? UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = vc as? UINavigationController {
            return topViewController(navigationController.topViewController)
        } else if let tabBarController = vc as? UITabBarController {
            return tabBarController.presentedViewController != nil ? topViewController(tabBarController.presentedViewController) : topViewController(tabBarController.selectedViewController)
            
        } else if let presentedViewController = vc?.presentedViewController, !presentedViewController.isKind(of: UIAlertController.self) {
            return topViewController(presentedViewController)
        }
        return vc
    }
    
   
}
