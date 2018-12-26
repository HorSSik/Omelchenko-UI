//  SquareAnimate.swift
//  actionsSquare
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareAnimate: UILabel {
    
    enum Position {
        case topLeft
        case topRight
        case bottomRight
        case bottomLeft
    }
    
    public var squarePosition: Position {
        get { return self.myPosition }
        set { self.myPosition = newValue }
    }
    
    public var topLeftPoint = CGPoint(x: 20, y: 44)
    public var topRightPoint = CGPoint(x: 300, y: 44)
    public var bottomRightPoint = CGPoint(x: 300, y: 750)
    public var bottomLeftPoint = CGPoint(x: 20, y: 750)
    
    public var isCancelled = false
    public var isMoving = false
    public var isAnimated = true
    
    private var myPosition = Position.topLeft
    
    public let durationAnimate = 2.0
}
