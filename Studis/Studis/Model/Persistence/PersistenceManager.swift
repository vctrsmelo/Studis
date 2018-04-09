//
//  PersistenceManager.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation
import Disk

class PersistenceManager {

    // MARK: - Singleton
    
    static let shared = PersistenceManager()
    
    private(set) var dataFetched = false
    
    private(set) var areas: Set<Area> = []
    
    private init() {
        fetchData()
    }
    
    // MARK: - Methods
    
    func addArea(name: String, topics: [String]? = nil) {
        let newArea = Area(name: name, topicsManager: TopicsList())
        topics?.forEach { newArea.topicsManager.addTopic(name: $0) }
        areas.insert(newArea)
    }
    
    func deleteArea(name: String) {
        guard let deletedArea = getArea(named: name) else { return }
        
        areas.remove(deletedArea)
    }
    
    func addTopic(name topicName: String, area areaName: String) {
        guard let area = getArea(named: areaName) else { return }
        area.topicsManager.addTopic(name: topicName)
    }
    
    func updateTopic(oldName: String, newName: String, area areaName: String) {
        guard let area = getArea(named: areaName) else { return }
        
        area.topicsManager.updateTopic(oldName: oldName, newName: newName)
    }
    
    func updateArea(oldName: String, newName: String) {
        guard var area = areas.first(where: {$0.name == oldName}) else { return }
        deleteArea(name: oldName)
        area.name = newName
        areas.insert(area)
    }
    
    func addReview(topic topicName: String, area areaName: String) {
        guard let area = getArea(named: areaName) else { return }
        area.topicsManager.addAReviewToTopic(named: topicName)
    }
    
    private func getArea(named areaName: String) -> Area? {
        guard let area = areas.first(where: {$0.name == areaName }) else {
            print("Couldn't find area")
            return nil
        }
        return area
    }
    
    func fetchData() {
        do {
            self.areas = try Disk.retrieve(FileNames.area.rawValue, from: .documents, as: Set<Area>.self)
            dataFetched = true
        } catch {
            print("Couldn't fetch data")

        }
    }
    
    func storeData() {
        do {
            try Disk.save(areas, to: .documents, as: FileNames.area.rawValue)
        } catch {
            fatalError("Couldn't store data: \(error.localizedDescription)")
        }
    }
    
}
