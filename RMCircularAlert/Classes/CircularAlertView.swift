//
//  CircularAlertView.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit

public class CircularAlertView: UIView {
    
    private var superView: UIView!
    
    // SubView
    private var centerCircularView: CenterCircleView!

    
    public init() {
        super.init(frame: CGRect.zero)
        guard let window = UIApplication.shared.delegate?.window, let rvc = window?.rootViewController else{
            return
        }
        
        superView = Helper.getCurrentViewController(rvc)?.view
        configureView()
        
        // adding gesture
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeUp.direction = .up
        self.addGestureRecognizer(swipeUp)
        
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        frame = CGRect(x: 0.0, y: 0.0, width: superView.frame.width, height: superView.frame.height)
        backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        
    }
    
    public func presentNormalAlert(withTitle title: String, andMessage message: String) {
        
            self.centerCircularView = CenterCircleView(forView: self)
            self.centerCircularView.setupSubViews(withTitle: title, andMessage: message)
            self.addSubview(self.centerCircularView)
            self.centerCircularView.presentAnimated()
        
            self.superView.addSubview(self)
            
        
    }
    
    @objc func dismissAlert() {
        centerCircularView.dismissAnimated {
            self.removeFromSuperview()
        }

    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .up:
                dismissAlert()
            default:
                break
            }
        }
    }
}


