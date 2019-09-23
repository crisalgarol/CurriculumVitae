//
//  TableCellSetterUp.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation
import UIKit

class TableCellSetterUp<CellType: SetUpCell, DataType>: SetterUpCell where CellType.DataType == DataType, CellType: UITableViewCell{
        
    static var id: String {return String(describing: CellType.self) }
    let item: DataType
    
    init(item: DataType){
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).setUp(data: item)
    }
    
}
