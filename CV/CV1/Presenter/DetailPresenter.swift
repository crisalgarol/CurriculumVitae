//
//  DetailPresenter.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenter:DetailPresenterProtocol{
    
    weak var delegate: DetailViewProtocol?
    
    var appHolder: ApplicationT = ApplicationT(name: "", icon: "", description: "")
    
    func convertB64ToImage() -> UIImage{
        
        let imb64 = appHolder.icon.components(separatedBy: ",")
        
        guard let imData = Data(base64Encoded: imb64[1], options: .ignoreUnknownCharacters) else{return UIImage()}
        return UIImage(data: imData)!
        
    }


    
}
