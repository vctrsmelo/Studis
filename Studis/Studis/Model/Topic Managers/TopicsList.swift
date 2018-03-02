//
//  TopicsList.swift
//  Studis
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

class TopicsList {
    
    private var _topics: [Topic] = [] {
        didSet {
            _topics = _topics.sorted()
        }
    }
    
}

extension TopicsList: TopicsManager {
    
    var topics: [Topic] {
        return _topics
    }
    
    func addTopic(name: String) {
        let topic = Topic(name: name, reviewsCount: 0)
        _topics.append(topic)
    }
    
    func getNextTopic() -> Topic? {
        guard var nextTopic = topics.first else { return nil }
        _topics.remove(at: 0)
        
        nextTopic.reviewsCount += 1
        nextTopic.lastReview = Date().timeIntervalSince1970
        _topics.append(nextTopic)
        
        return nextTopic
    }
    
    func getNextTopics(quantity: Int) -> [Topic] {
        
        var selectedTopics: [Topic] = Array(self.topics.dropFirst(quantity))
        
        let now = Date().timeIntervalSince1970
        
        for i in 0 ..< selectedTopics.count {
            selectedTopics[i].lastReview = now
            selectedTopics[i].reviewsCount += 1
        }
        
        self._topics.append(contentsOf: selectedTopics)
        
        return selectedTopics
    }
    
    func deleteTopic(named: String) {
        
        for i in 0 ..< topics.count where topics[i].name == named {
            _topics.remove(at: i)
        }
    }
    
}
