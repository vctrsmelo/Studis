//
//  PersistenceManagerTests.swift
//  StudisTests
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import XCTest
import Disk
@testable import Studis

class PersistenceManagerTests: XCTestCase {
    
    private class PersistenceManagerTest: PersistenceManager {
        
        private(set) var areasTest: Set<Area> = []
        
        override func fetchData() {
            do {
                self.areasTest = try Disk.retrieve("areaTest.json", from: .temporary, as: Set<Area>.self)
            } catch {
                fatalError("Couldn't fetch data: \(error.localizedDescription)")
            }
        }
        
        override func storeData() {
            do {
                try Disk.save(areasTest, to: .temporary, as: FileNames.area.rawValue)
            } catch {
                fatalError("Couldn't store data: \(error.localizedDescription)")
            }
        }
        
    }
    
    let persistenceManager = PersistenceManagerTest.shared
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStoring() {
        persistenceManager.addArea(name: "College", topics: ["Database class"])
        
        persistenceManager.storeData()
        
        persistenceManager.fetchData()

        XCTAssertEqual(persistenceManager.areas.count, 1)
        XCTAssertTrue(persistenceManager.areas.contains(where: {$0.name == "College"}))
    }
    
}
