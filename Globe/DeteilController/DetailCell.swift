//
//  DetailCell.swift
//  Globe
//
//  Created by zagid on 29.10.17.
//  Copyright © 2017 zagid. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
