//
//  MainViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct MainViewViewModel {
    
    var selectedAreaIndex = 0
    var areasName: [String] = PersistenceManager.shared.areas.map { (area) -> String in
        return area.name
    }

    mutating func sync() {
        self.areasName = []
        PersistenceManager.shared.areas.forEach { areasName.append($0.name) }
    }
    
    func getNextTopicName() -> String? {
        let area = PersistenceManager.shared.areas.first { $0.name == areasName[selectedAreaIndex]}
        return area?.topicsManager.getNextTopic()?.name
    }
}
