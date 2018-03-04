//
//  TopicViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct TopicViewViewModel {
    
    // MARK: - Properties
    
    var topicName: String?
    var areaSelectedName: String?
    var areasName: [String] = PersistenceManager.shared.areas.map { (area) -> String in
        return area.name
    }
    
    func saveTopic() {
        guard let topicName = topicName, let areaSelectedName = areaSelectedName else {
            print("Couldn't save topic")
            return
        }
        
        PersistenceManager.shared.addTopic(name: topicName, area: areaSelectedName)
    }
    
}
