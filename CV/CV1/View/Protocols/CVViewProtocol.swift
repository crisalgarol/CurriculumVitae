//
//  CVViewProtocol.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

protocol CVViewProtocol:NSObjectProtocol{

    func setUpBar()
    func setUpProfileImage()
    func animateUI()
    func updateUI(items:[SetterUpCell], CV:Curriculum)
    func setUpUI()
    
    
}
