//
//  StandaloneNavigationBar.swift
//  ChoicePopup
//
//  Created by Nayem on 2/14/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class StandaloneNavigationBar: UINavigationBar {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let color = UIColor.black
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
    }

}
