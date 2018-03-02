//
//  TopicsList.swift
//  Studis
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

fileprivate struct TopicElement {
    var topic: Topic
    var reviewsCount: Int
    var lastReview: TimeInterval
}

extension TopicElement: Comparable {
    
}

struct TopicsList {
    
    private var topics: [TopicElement] {
        didSet {
            topics.sort
        }
    }
    
}
