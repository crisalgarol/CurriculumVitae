//
//  ApplicationT.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/21/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

class ApplicationT:Codable{
    
    let name:String
    let icon:String
    let description:String
    
    init(name:String, icon:String, description:String){
        self.name = name
        self.icon = icon
        self.description = description
    }
    
    func convertB64ToImage() -> UIImage{
        
        let imb64 = self.icon.components(separatedBy: ",")
        
        guard let imData = Data(base64Encoded: imb64[1], options: .ignoreUnknownCharacters) else{return UIImage()}
        return UIImage(data: imData)!

    }
  
    
}
