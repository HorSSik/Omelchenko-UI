//
//  SquareViewController.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = SquareView
    
    @IBAction func onStart(_ sender: UIButton) {
        self.rootView?.onStart(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
