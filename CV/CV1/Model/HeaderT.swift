//
//  HeaderT.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/21/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

class HeaderT:Codable{
    
    let title:String
    let icon:String
  
    
    init(title:String, icon:String){
        self.title = title
        self.icon = icon
    }

    func convertB64ToImage() -> UIImage{
        
        let imb64 = self.icon.components(separatedBy: ",")
        
        guard let imData = Data(base64Encoded: imb64[1], options: .ignoreUnknownCharacters) else{return UIImage()}
        return UIImage(data: imData)!

    }
    
    

    
}
