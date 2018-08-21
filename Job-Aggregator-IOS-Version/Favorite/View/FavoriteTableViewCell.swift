//
//  FavoriteTableViewCell.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 11/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var vacancyNameCell: UILabel!
    @IBOutlet weak var vacancyAreaCell: UILabel!
    @IBOutlet weak var vacancyMinCell: UILabel!
    @IBOutlet weak var vacancyMaxCell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
