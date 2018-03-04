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
    var isEditingTopic = false
    var oldName: String?
    
    var topicName: String? {
        didSet {
            if oldValue == nil {
                oldName = topicName
            }
        }
    }
    
    var selectedAreaIndex: Int = 0
    
    var areasName: [String] = PersistenceManager.shared.areas.map { (area) -> String in
        return area.name
    }
    
    func saveTopic() {
        guard let topicName = topicName else {
            print("Couldn't save topic")
            return
        }
        
        let areaSelectedName = areasName[selectedAreaIndex]
        
        if isEditingTopic {
            
            guard let oldName = oldName else {
                print("Couldn't update topic")
                return
            }
            
            PersistenceManager.shared.updateTopic(oldName: oldName, newName: topicName, area: areaSelectedName)
        } else {
            PersistenceManager.shared.addTopic(name: topicName, area: areaSelectedName)
        }
    }
    
}
