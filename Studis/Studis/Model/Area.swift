//
//  Area.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct Area: Codable {
    var name: String
    var topicsManager: TopicsList
}

extension Area: Hashable {
    
    init(name: String) {
        self.name = name
        topicsManager = TopicsList()
    }
    
    static func == (lhs: Area, rhs: Area) -> Bool {
        return lhs.name == rhs.name
    }
    
    var hashValue: Int {
        return name.hashValue
    }
    
}
