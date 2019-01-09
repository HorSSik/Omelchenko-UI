//
//  SquareView.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    @IBOutlet var label: UILabel?
    
    struct Strings {
        
        static let start = "Start"
        static let stop = "Stop"
    }
    
    struct Durations {
        
        static let twoSecond = 2.0
        static let zero = 0.0
    }
    
    typealias Position = CGRect.Position
    
    private var isCancelled = false
    private var isMoving = false
    private var isAnimating = true

    private var squarePosition = Position.topLeft
    private let positions = Generator<Position>(objects: .topLeft, .topRight, .bottomRight, .bottomLeft)
    
    public func start(_ sender: UIButton) {
        self.isCancelled.toggle()
        if self.isCancelled && !self.isMoving {
            self.moveSquare(animated: self.isAnimating)
            sender.setDesign(
                sender: sender,
                backgroundColor: .flatRed,
                titleText: Strings.stop,
                titleColor: .white
            )
        } else {
            sender.setDesign(
                sender: sender,
                backgroundColor: .flatGreen,
                titleText: Strings.start,
                titleColor: .white
            )
        }
    }
    
    private func moveSquare(animated: Bool) {
        self.label.do { lable in
            var position = lable.frame.origin
            let inset = UIEdgeInsets(
                top: self.safeAreaInsets.top,
                left: 0,
                bottom: lable.frame.height,
                right: lable.frame.width
            )
            let frame = self.frame.inset(by: inset)
        
            self.squarePosition = self.positions.next()
            position = frame.point(from: self.squarePosition)
            self.animateMove(to: position, animated: animated)
        }
    }
    
    private func animateMove(to position: CGPoint, animated: Bool) {
        UIView.animate(
            withDuration: animated ? Durations.twoSecond : Durations.zero,
            animations: {
                self.label?.frame.origin = position
                self.isMoving = true
            },
            completion: {_ in
                if self.isCancelled {
                    self.moveSquare(animated: animated)
                } else {
                    self.isMoving = false
                }
            }
        )
    }
}
