//
//  SquareView.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    @IBOutlet var lable: UILabel!
    
    private(set) var isCancelled = false
    private(set) var isMoving = false
    private(set) var isAnimated = true

    private var squarePosition = Position.topLeft
    private let positionGenerator = PositionGenerator(objects: Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    private let durationAnimate = 2.0
    
    public func onStart(_ sender: UIButton) {
        self.isCancelled.toggle()
        if self.isCancelled && !self.isMoving {
            self.moveSquare(with: self.durationAnimate, animated: self.isAnimated)
            self.setDesignForButton(
                sender: sender,
                backgroundColor: .flatRed,
                titleText: "STOP",
                titleColor: .white
            )
        } else {
            self.setDesignForButton(
                sender: sender,
                backgroundColor: .flatGreen,
                titleText: "START",
                titleColor: .white
            )
        }
    }
    
    private func moveSquare(with durationAnimate: TimeInterval, animated: Bool) {
        var position = lable.frame.origin
        let frame = self.frame.inset(
            by: UIEdgeInsets(
                top: self.safeAreaInsets.top,
                left: 0,
                bottom: self.lable.frame.height,
                right: self.lable.frame.width
            )
        )
        
        switch self.squarePosition {
        case .topLeft:
            position = frame.topLeft
        case .topRight:
            position = frame.topRight
        case .bottomRight:
            position = frame.bottomRight
        case .bottomLeft:
            position = frame.bottomLeft
        }
        
        self.animateMove(to: position, duration: durationAnimate, animated: animated)
        self.squarePosition = self.positionGenerator.next()
    }
    
    private func animateMove(to position: CGPoint, duration: TimeInterval, animated: Bool) {
        UIView.animate(
            withDuration: animated ? duration : 0.0,
            animations: {
                self.lable.frame.origin = position
                self.isMoving = true
            },
            completion: {_ in
                if self.isCancelled {
                    self.moveSquare(with: duration, animated: animated)
                } else {
                    self.isMoving = false
                }
            }
        )
    }
    
    private func setDesignForButton(
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
