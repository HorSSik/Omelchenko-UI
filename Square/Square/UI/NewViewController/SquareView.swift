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
    
    private(set) var isAnimating = true
    
    private var isCancelled = false
    private var isMoving = false

    private var squarePosition = Position.topLeft
    private let positions = Generator<Position>(objects: .topLeft, .topRight, .bottomRight, .bottomLeft)
    
    public func relocation(_ sender: UIButton) {
        self.isCancelled.toggle()
        if self.isCancelled && !self.isMoving {
            self.setSquarePosition(animated: self.isAnimating)
            sender.setDesign(
                backgroundColor: Color.flatRed.opaque,
                titleText: Strings.stop,
                titleColor: .white
            )
        } else {
            sender.setDesign(
                backgroundColor: Color.flatGreen.opaque,
                titleText: Strings.start,
                titleColor: .white
            )
        }
    }
    
    private func setSquarePosition(animated: Bool) {
        self.squarePosition = self.positions.next()
        self.animateMove(to: self.squarePosition, animated: animated)
    }
    
    private func inset(label: UILabel?) -> CGRect {
        guard let label = label else { return .zero }
        let inset = UIEdgeInsets(
            top: self.safeAreaInsets.top,
            left: 0,
            bottom: label.frame.height,
            right: label.frame.width
        )
        
        return self.frame.inset(by: inset)
    }
    
    private func animateMove(to position: Position, animated: Bool) {
        UIView.animate(
            withDuration: animated ? Durations.twoSecond : Durations.zero,
            animations: {
                let frame = self.inset(label: self.label)
                self.label?.frame.origin = frame.point(from: position)
                self.isMoving = true
            },
            completion: {_ in
                if self.isCancelled {
                    self.setSquarePosition(animated: animated)
                } else {
                    self.isMoving = false
                }
            }
        )
    }
}
