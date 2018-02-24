//
//  DismissButton.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit

class AlertIcon: UIImageView {
    
    
    init(forView view: UIView) {
        let viewWidth = view.frame.width
        
        let widht: CGFloat = 60.0
        let height: CGFloat = 60.0
        let xPosition: CGFloat = (viewWidth / 2) - (widht / 2)
        let yPosition: CGFloat = 10.0
        super.init(frame: CGRect(x: xPosition, y: yPosition, width: widht, height: height))
        layer.cornerRadius = widht/2
        contentMode = .scaleAspectFill
        image = getImageFromBundle(name: "Alert-Icon")
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getImageFromBundle(name: String) -> UIImage {
        let podBundle = Bundle(for: AlertIcon.self)
        if let image = UIImage(named: name, in: podBundle, compatibleWith: nil) {
            return image
        }
    
        return UIImage()
    }
    
}


