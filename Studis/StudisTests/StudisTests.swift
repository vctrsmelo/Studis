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
    
    func testTopicsListgetNextTopic() {
        topicsManager.addTopic(name: "Core Data")
        var topic = topicsManager.getNextTopic()
        XCTAssertNotNil(topic)
        XCTAssertEqual(topic!.name, "Core Data")
        
        topic = topicsManager.topics.first(where: {$0.name == topic!.name })
        
        XCTAssertEqual(topic?.reviewsCount, 1)
    }
}
