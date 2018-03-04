//
//  StudisTests.swift
//  StudisTests
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import XCTest
@testable import Studis

class StudisTests: XCTestCase {
    
    var topicsManager: TopicsManager!
    
    override func setUp() {
        topicsManager = TopicsList()
        super.setUp()
    }
    
    override func tearDown() {
        topicsManager = nil
        super.tearDown()
    }

    func testTopicsListAddTopic() {
        topicsManager.addTopic(name: "CloudKit")
        XCTAssertNotNil(topicsManager.topics.first { $0.name == "CloudKit" })
    }
    
    func testTopicsListGetNextTopic_oneTopic() {
        topicsManager.addTopic(name: "Core Data")
        var topic = topicsManager.getNextTopic()
        XCTAssertNotNil(topic)
        XCTAssertEqual(topic!.name, "Core Data")
        
        topic = topicsManager.topics.first(where: {$0.name == topic!.name })
        
        XCTAssertEqual(topic?.reviewsCount, 1)
    }
    
    func testTopicsListGetNextTopic_multipleTopics() {
        topicsManager.addTopic(name: "Core Data")
        topicsManager.addTopic(name: "CloudKit")

        let topic1 = topicsManager.getNextTopic()
        
        sleep(4)

        let topic2 = self.topicsManager.getNextTopic()
        XCTAssertNotEqual(topic1, topic2)
        
        let topic1Again = self.topicsManager.getNextTopic()
        XCTAssertEqual(topic1!.name, topic1Again!.name)
    }
    
//    func addTopic(name: String)
//    func getNextTopic() -> Topic?
//    func getNextTopics(quantity: Int) -> [Topic]
//    func deleteTopic(named: String)
    
    func testTopicsListGetNextTopics() {
        topicsManager.addTopic(name: "Core Data")
        topicsManager.addTopic(name: "CloudKit")
        
        XCTAssertEqual(topicsManager.topics.count, 2)

        topicsManager.topics.forEach {
            XCTAssertTrue($0.name == "Core Data" || $0.name == "CloudKit")
        }
    }
    
    func testTopicsListDeleteTopic() {
        topicsManager.addTopic(name: "Core Data")
        topicsManager.addTopic(name: "CloudKit")
        
        let topic1 = topicsManager.getNextTopic()
        XCTAssertEqual(topic1!.name, "Core Data")
        
        topicsManager.deleteTopic(named: "CloudKit")

        let topic1Again = topicsManager.getNextTopic()
        
        XCTAssertEqual(topic1Again!.name, topic1!.name)
    }
}
