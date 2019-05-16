//
//  YelpItemCell.swift
//  yelp-app
//
//  Created by Harry Zhang on 4/18/19.
//  Copyright © 2019 Harry Zhang. All rights reserved.
//

import UIKit

class YelpItemCell: UITableViewCell {

    @IBOutlet weak var businessLabel: UILabel!
    @IBOutlet weak var businessInfo: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
