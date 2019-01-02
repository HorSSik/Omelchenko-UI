//
//  SquareViewController.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {
    
    public var squareView: SquareView? {
        return when(self.isViewLoaded) {
            cast(self.view)
        }
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.squareView?.onStart(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
