//
//  TopicGraph.swift
//  Studis
//
//  Created by Victor S Melo on 01/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

class TopicGraph {
    
    private class Node {
        var topic: Topic
        var reviewsCount: Int
        var lastReviewSince1970: TimeInterval
        
        var weight: Double {
            return Double(reviewsCount)*lastReviewSince1970
        }
        
        init(topic: Topic, reviewsCount: Int = 0, lastReviewSince1970: TimeInterval = 1) {
            self.topic = topic
            self.reviewsCount = reviewsCount
            self.lastReviewSince1970 = lastReviewSince1970
        }
    }
    
}
