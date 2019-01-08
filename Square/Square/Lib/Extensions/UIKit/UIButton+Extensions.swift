//
//  UIButton+Extensions.swift
//  Square
//
//  Created by Student on 08.01.2019.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func setDesign(
        sender: UIButton,
        backgroundColor: UIColor,
        titleText: String,
        titleColor: UIColor
    ) {
        sender.backgroundColor = backgroundColor
        sender.setTitle(titleText, for: .normal)
        sender.setTitleColor(titleColor, for: .normal)
    }
}
