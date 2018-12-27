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
    
    private let screen = UIScreen.main.bounds
    private lazy var sizeLable = self.bounds
    
    private lazy var topLeftPoint = CGPoint(x: self.screen.minX, y: self.screen.minY)
    private lazy var topRightPoint = CGPoint(x: self.screen.maxX - self.sizeLable.width, y: self.screen.minY)
    private lazy var bottomRightPoint = CGPoint(x: self.screen.maxX - self.sizeLable.width, y: self.screen.maxY - self.sizeLable.height)
    private lazy var bottomLeftPoint = CGPoint(x: self.screen.minX, y: self.screen.maxY - self.sizeLable.height)
    
    public lazy var points = [self.topLeftPoint,
                              self.topRightPoint,
                              self.bottomRightPoint,
                              self.bottomLeftPoint]
    
    public var isCancelled = false
    public var isMoving = false
    public var isAnimated = true
    
    private var myPosition = Position.topLeft
    
    public let durationAnimate = 2.0
}
