//
//  DismissButton.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit


class DismissButton: UIButton {
    
    init(forView view: UIView) {
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        let widht: CGFloat = 40.0
        let height: CGFloat = 25.0
        let xPosition = (viewWidth / 2) - (widht / 2)
        let yPosition = viewHeight - height - 20
        super.init(frame: CGRect(x: xPosition, y: yPosition, width: widht, height: height))
        
        backgroundColor = .clear
        setImage(getImageFromBundle(name: "White_arrow_up"), for: .normal)
        
        addTarget(view.superview, action: #selector(CircularAlertView.dismissAlert), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func getImageFromBundle(name: String) -> UIImage {
//        let podBundle = Bundle(for: DismissButton.self)
//        if let image = UIImage(named: name, in: podBundle, compatibleWith: nil) {
//            return image
//        }
//
//        return UIImage()
//    }
    
    private func getImageFromBundle(name: String) -> UIImage {
        let podBundle = Bundle(for: DismissButton.self)
        
        if let bundleURL = podBundle.url(forResource: "RMCircularAlert", withExtension: "bundle") {
            
            if let bundle = Bundle(url: bundleURL) {
            if let image = UIImage(named: name, in: bundle, compatibleWith: nil) {
                return image
            }
            
            }
        }
        
        return UIImage()
        
    }
    
}


