//
//  DismissButton.swift
//  Nimble
//
//  Created by Raul Marques de Oliveira on 23/02/18.
//

import UIKit

class AlertMessage: UILabel {
    
    
    init(forView view: UIView, withText text: String) {
        let viewWidth = view.frame.width
        
        let widht: CGFloat = viewWidth * 0.8
        let height: CGFloat = 100
        let xPosition = (viewWidth / 2) - (widht / 2)
        let yPosition:CGFloat = 100.0
        super.init(frame: CGRect(x: xPosition, y: yPosition, width: widht, height: height))
        backgroundColor = .clear
        numberOfLines = 0
        textColor = .white
        textAlignment = .center
        self.text = text
        font = UIFont(name: "Avenir", size: 15)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

