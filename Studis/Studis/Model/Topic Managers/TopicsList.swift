//
//  TopicsList.swift
//  Studis
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

class TopicsList: TopicsManager {
    
    private var _topics: [Topic] = [] {
        didSet {
            _topics = _topics.sorted()
        }
    }
    
}

extension TopicsList {
    
    var topics: [Topic] {
        return _topics
    }
    
    func addTopic(name: String) {
        let topic = Topic(name: name, reviewsCount: 0)
        _topics.append(topic)
    }
    
    func updateTopic(oldName: String, newName: String) {
        
        for index in 0 ..< _topics.count where _topics[index].name == oldName {
            _topics[index].name = newName
            break
        }
        
    }
    
    func getNextTopic() -> Topic? {
        guard var nextTopic = topics.first else { return nil }
        _topics.remove(at: 0)
        
        nextTopic.addReview()

        nextTopic.reviewsCount += 1
        nextTopic.lastReview = Date().timeIntervalSince1970
        _topics.append(nextTopic)
        
        return nextTopic
    }
    
    /**
     Used when user want to actively review an specific topic
    */
    func addAReviewToTopic(named topicName: String) {
        guard var topic = topics.first(where: { $0.name == topicName }) else { print("Topic not found"); return }
        let index = topics.indexOf(topic)
        _topics.remove(at: index)
        topic.addReview()
        _topics.append(topic)
    }
    
    func getNextTopics(quantity: Int) -> [Topic] {
        
        var selectedTopics: [Topic] = Array(self.topics.dropFirst(quantity))
        
        let now = Date().timeIntervalSince1970
        
        for index in 0 ..< selectedTopics.count {
            selectedTopics[index].lastReview = now
            selectedTopics[index].reviewsCount += 1
        }
        
        self._topics.append(contentsOf: selectedTopics)
        
        return selectedTopics
    }
    
    func deleteTopic(named: String) {
        
        for index in 0 ..< topics.count where topics[index].name == named {
            _topics.remove(at: index)
            break
        }
    }
    
    func deleteTopic(at index: Int) {
        _topics.remove(at: index)
    }
}
