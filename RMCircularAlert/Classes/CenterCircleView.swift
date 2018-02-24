//
//  DismissButton.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit

class CenterCircleView: UIView {
    
    init(forView view: UIView) {
        let viewWidth = view.frame.width
        
        let widht: CGFloat = view.frame.width/1.5
        let height: CGFloat = view.frame.width/1.5
        let xPosition: CGFloat = (viewWidth / 2) - (widht / 2)
        let yPosition: CGFloat = -height
        super.init(frame: CGRect(x: xPosition, y: yPosition, width: widht, height: height))
        
        layer.cornerRadius = widht/2
        backgroundColor = UIColor(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        
        addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 3.0, opacity: 0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubViews(withTitle title: String, andMessage message: String) {
        let alertIcon = AlertIcon(forView: self)
        let alertTitle = AlertTitle(forView: self, withText: title)
        let alertMessage = AlertMessage(forView: self, withText: message)
        let dismissButton = DismissButton(forView: self)
        addSubview(alertIcon)
        addSubview(alertTitle)
        addSubview(alertMessage)
        addSubview(dismissButton)
        
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    func presentAnimated() {

        UIView.animate(withDuration: 0.5) {
            if let viewWidth = self.superview?.frame.width,
                let viewHeight = self.superview?.frame.height {
                self.center = CGPoint(x: viewWidth/2, y: viewHeight/2)
            }
        }
    

    }
    
    func dismissAnimated(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5, animations: {
            if let viewWidth = self.superview?.frame.width {
                let viewHeight = self.frame.height
                self.center = CGPoint(x: viewWidth/2, y: -viewHeight)
            }
        }) { (success) in
            UIView.animate(withDuration: 0.2, animations: {
                self.superview?.alpha = 0.0
            }, completion: { (success) in
                completion()
            })
            
        }
    }
    
}



