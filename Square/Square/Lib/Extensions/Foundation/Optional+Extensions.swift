//
//  Optional+Extensions.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import Foundation

extension Optional {
    
    func `do`(_ action: (Wrapped) -> ()) {
        self.map(action)
    }
    
    func apply<Result>(_ transform: ((Wrapped) -> Result)?) -> Result? {
        return self.flatMap {
            transform?($0)
        }
    }
}
