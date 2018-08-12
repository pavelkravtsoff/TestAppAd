//
//  CountryTableViewCell.swift
//  sandbox
//
//  Created by JigSaw on 12.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
