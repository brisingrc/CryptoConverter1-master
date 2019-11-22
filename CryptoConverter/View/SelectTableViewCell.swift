//
//  SelectTableViewCell.swift
//  CryptoConverter
//
//  Created by Мак on 11/10/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {
    @IBOutlet weak var imageQuote: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
