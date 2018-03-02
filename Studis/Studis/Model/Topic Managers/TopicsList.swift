//
//  TopicsList.swift
//  Studis
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

class TopicsList {
    
    private var topics: [Topic] = [] {
        didSet {
            topics = topics.sorted()
        }
    }
    
}

extension TopicsList: TopicsManager {
    
    func addTopic(name: String) {
        let topic = Topic(name: name, reviewsCount: 0, lastReview: 1)
        topics.append(topic)

    }
    
    func getNextTopic() -> Topic? {
        guard var nextTopic = topics.first else { return nil }
        nextTopic.reviewsCount += 1
        nextTopic.lastReview = Date().timeIntervalSince1970
        return topics.first
    }
    
    func getNextTopics(quantity: Int) -> [Topic] {
        
        var selectedTopics: [Topic] = Array(self.topics.dropFirst(quantity))
        
        let now = Date().timeIntervalSince1970
        
        for i in 0 ..< selectedTopics.count {
            selectedTopics[i].lastReview = now
            selectedTopics[i].reviewsCount += 1
        }
        
        self.topics.append(contentsOf: selectedTopics)
        
        return selectedTopics
    }
    
    func deleteTopic(named: String) {
        
        for i in 0 ..< topics.count where topics[i].name == named {
            topics.remove(at: i)
        }
        
    }
    
}
