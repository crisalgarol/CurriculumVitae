//
//  ProfileContact.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class ProfileContact:Codable{
    
    let phone:String
    let email:String
    let github:String
    
    init(phone:String, email:String, github:String) {
        self.phone = phone
        self.email = email
        self.github = github
    }
    
}
