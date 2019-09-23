//
//  Description.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/21/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class Description: Decodable{
    
    let title :String
    let description : String
    
    private enum CodingKeys:String, CodingKey{
        case title
        case description
    }
    
    
    init(title:String, description:String){
        self.title = title
        self.description = description
    }
    
    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        title = try c.decode(String.self, forKey: .title)
        description = try c.decode(String.self, forKey: .description)
    }
    
}
