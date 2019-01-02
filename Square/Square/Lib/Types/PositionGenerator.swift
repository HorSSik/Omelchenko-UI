//
//  PositionGenerator.swift
//  Square
//
//  Created by Student on 02.01.2019.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

final class PositionGenerator<Value> {
    
    private let objects = Atomic([Value]())
    private let index = Atomic(0)
    
    init(objects: [Value]) {
        self.objects.value = objects
    }
    
    convenience init(objects: Value...) {
        self.init(objects: objects)
    }
    
    func next() -> Value {
        let index: Int = self.index.modify { index in
            defer {
                index = (index + 1) % self.objects.value.count
            }
            
            return index
        }
        
        return self.objects.value[index]
    }
}
