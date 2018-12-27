//
//  LableView.swift
//  actionsSquare
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class LableView: UIView {
    
    @IBOutlet var lable: SquareAnimate!
    
    public func moveSquare(with durationAnimate: TimeInterval, animated: Bool) {
        var position = self.lable.frame.origin

        switch self.lable.squarePosition {
        case .topLeft:
            position = self.lable.points[0]
            self.lable.squarePosition = .topRight
        case .topRight:
            position = self.lable.points[1]
            self.lable.squarePosition = .bottomRight
        case .bottomRight:
            position = self.lable.points[2]
            self.lable.squarePosition = .bottomLeft
        case .bottomLeft:
            position = self.lable.points[3]
            self.lable.squarePosition = .topLeft
        }
        
        self.animateMove(to: position, duration: durationAnimate, animated: animated)
    }
    
    private func animateMove(to position: CGPoint, duration: TimeInterval, animated: Bool) {
        UIView.setAnimationsEnabled(animated)
        UIView.animate(
            withDuration: duration,
            animations: {
                self.lable.frame.origin = position
                self.lable.isMoving = true
            },
            completion: {_ in
                if self.lable.isCancelled {
                    self.moveSquare(with: duration, animated: animated)
                } else {
                    self.lable.isMoving = false
                }
            }
        )
    }
    
    public func setDesignForButton(
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
