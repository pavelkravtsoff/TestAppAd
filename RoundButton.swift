//
//  RoundButton.swift
//  sandbox
//
//  Created by JigSaw on 12.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
}
