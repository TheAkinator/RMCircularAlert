//
//  Helper.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit

class Helper: NSObject {
    
    override init() {
        super.init()
    }
    
    static func getCurrentViewController(_ vc: UIViewController) -> UIViewController? {
        
        if let pvc = vc.presentedViewController {
            return getCurrentViewController(pvc)
        }
        else if let svc = vc as? UISplitViewController, svc.viewControllers.count > 0 {
            return getCurrentViewController(svc.viewControllers.last!)
        }
        else if let nc = vc as? UINavigationController, nc.viewControllers.count > 0 {
            return getCurrentViewController(nc.topViewController!)
        }
        else if let tbc = vc as? UITabBarController {
            if let svc = tbc.selectedViewController {
                return getCurrentViewController(svc)
            }
        }
        return vc
    }
}
