//
//  UIView+Extension.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/19/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func setGradientBackground(initialColor:UIColor, finalColor:UIColor){
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [initialColor.cgColor, finalColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
        
        
    }
    
}
