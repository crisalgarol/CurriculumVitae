//
//  TitleTableViewCell.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/19/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell, SetUpCell {

    typealias DataType = HeaderT
    

    @IBOutlet var icon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUp(data: HeaderT) {
        icon.image = data.convertB64ToImage()
        titleLabel.text = data.title
    }
}
