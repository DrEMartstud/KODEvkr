//
//  GradientExtension.swift
//  VKRDiplomaKODE
//
//  Created by DrEMartstud on 29.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    func setGradientBackground(firstColor: UIColor, secondColor: UIColor) {
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
