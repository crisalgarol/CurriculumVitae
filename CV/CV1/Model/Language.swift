//
//  Language.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/21/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class Language: Codable{
    
    let language:String
    let percentage:String
    
    /*private enum CodingKeys:String, CodingKey{
        case language = "language"
        case percentage = "percentage" 
    }*/
    
    init(language:String, percentage:String) {
        self.language = language
        self.percentage = percentage
    }
    
    
}

