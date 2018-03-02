//
//  Topic.swift
//  Studis
//
//  Created by Victor S Melo on 01/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct Topic: Codable {
    var name: String
    var reviewsCount: Int
    var lastReview: TimeInterval
    
    var orderWeight: Double {
        return Double(reviewsCount)*(100*lastReview/Date().timeIntervalSince1970)
    }
}

extension Topic: Comparable {
    
    static func < (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.orderWeight < rhs.orderWeight
    }
    
    static func == (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.name == rhs.name
    }
    
}
