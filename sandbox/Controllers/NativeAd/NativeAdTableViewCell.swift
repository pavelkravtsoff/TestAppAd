//
//  NativeAdTableViewCell.swift
//  sandbox
//
//  Created by JigSaw on 12.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit

class NativeAdTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleTextView: UILabel!
    @IBOutlet weak var adChoiceView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    @IBAction func callToActionButton(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
