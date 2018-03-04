//
//  TopicsListViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct TopicsListViewViewModel {
    
    private var _areas: [Area]

    func getAreaName(at index: Int) -> String {
        return _areas[index].name
    }
    
    func getTopicName(section: Int, row: Int) -> String {
        return _areas[section].topicsManager.topics[row].name
    }
    
    func deleteTopic(section: Int, row: Int) {
        _areas[section].topicsManager.deleteTopic(at: row)
    }
    
    func numberOfAreas() -> Int {
        return _areas.count
    }
    
    func numberOfTopics(section: Int) -> Int {
        return _areas[section].topicsManager.topics.count
    }
    
    mutating func sync() {
        self._areas = Array(PersistenceManager.shared.areas)
    }
    
}

extension TopicsListViewViewModel {
    public init() {
        self._areas = Array(PersistenceManager.shared.areas)
    }
}
