//
//  SetUpCell.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

protocol SetUpCell{
    
    associatedtype DataType
    
    func setUp(data: DataType)
    
}
