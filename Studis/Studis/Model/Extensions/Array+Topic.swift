//
//  Array+Topic.swift
//  Studis
//
//  Created by Victor S Melo on 09/04/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

extension Array where Element == Topic {
    
    /**
     - Precondition: element is contained in array.
    */
    func indexOf(_ topic: Topic) -> Int {
        for index in 0 ..< self.count {
            if self[index] == topic {
                return index
            }
        }
        fatalError("Element not contained into array")
    }
    
}
