//
//  AboutTableViewCell.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell,SetUpCell {
    
    typealias DataType = String

    @IBOutlet var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setUp(data: String) {
        self.aboutLabel.text = data
    }
    

}
