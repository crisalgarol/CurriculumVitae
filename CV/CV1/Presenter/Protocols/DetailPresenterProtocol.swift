//
//  DetailPresenterProtocol.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol{
    var appHolder : ApplicationT {get set}
    func convertB64ToImage() -> UIImage
}
