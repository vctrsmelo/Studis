//
//  MainViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct MainViewViewModel {
    
    var areaNameSelected: String?
    var areasName: [String] = PersistenceManager.shared.areas.map { (area) -> String in
        return area.name
    }

    mutating func sync() {
        self.areasName = []
        PersistenceManager.shared.areas.forEach { areasName.append($0.name) }
    }
}

