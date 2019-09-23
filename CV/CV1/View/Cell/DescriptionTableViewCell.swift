//
//  DescriptionTableViewCell.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/19/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import UIKit



class DescriptionTableViewCell: UITableViewCell, SetUpCell{
    typealias DataType = Description
        
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var local:Description?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setUp(data: Description){
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }

    
  
}
