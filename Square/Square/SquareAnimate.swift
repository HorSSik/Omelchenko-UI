//  SquareAnimate.swift
//  actionsSquare
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareAnimate: UILabel {
    
    enum Position {
        case left
        case right
        case rightDown
        case leftDown
    }
    
    var leftPoint = CGPoint(x: 20, y: 44)
    var rightPoint = CGPoint(x: 300, y: 44)
    var rightDownPoint = CGPoint(x: 300, y: 750)
    var leftDownPoint = CGPoint(x: 20, y: 750)
    
    var myPosition = Position.left
    
    var squarePosition: Position {
        return self.myPosition
    }
    
    func setDesignForButton(
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
