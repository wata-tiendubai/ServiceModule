//  tran tuan vu
//  BaseToast.swift


import Foundation
import UIKit
class BaseToast{
    
    static let shareIntanse = BaseToast()
    static var viewError = UIView()
    
    func showToast(message: String, duration: TimeInterval = ToastManager.shared.duration, completion: ((_ didTap: Bool) -> Void)? = nil) {
        
        guard let currentVC = ScreenCoordinator.topViewController() else { return }
        
        var style = ToastStyle()
        style.messageColor = .white
        style.cornerRadius = 4
        style.verticalPadding = 16
        style.horizontalPadding = 16
      //  style.messageFont = sFontsMgr.sourceSansPro.regular(14)
        style.displayShadow = true
      //  style.shadowColor = sColorMgr.darkShadow
        style.shadowOpacity = 0.24
        style.shadowRadius = 8
        style.shadowOffset = CGSize(width: 0, height: 0)
        style.titleAlignment = .center
        style.messageAlignment = .center
       // style.backgroundColor = sColorMgr.color(hexString: "353535")
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true

        if let completion = completion {
            currentVC.view.isUserInteractionEnabled = false
            currentVC.view.makeToast(message, duration: duration, completion: {(finish) in
                currentVC.view.isUserInteractionEnabled = true
                completion(finish)
            })
        } else {
            currentVC.view.makeToast(message, duration: duration)
        }
        
    }
}
