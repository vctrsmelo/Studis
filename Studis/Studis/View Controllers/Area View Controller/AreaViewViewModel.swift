//
//  AreaViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct AreaViewViewModel {
    
    var isEditingArea = false
    var oldName: String?
    
    var areaName: String? {
        didSet {
            if oldValue == nil {
                oldName = areaName
            }
        }
    }
    
    func saveArea() {
        guard let areaName = areaName else {
            print("Couldn't save area")
            return
        }
        
        if isEditingArea {
            
            guard let oldName = oldName else {
                print("Couldn't update area")
                return
            }
            
            PersistenceManager.shared.updateArea(oldName: oldName, newName: areaName)
        } else {
            PersistenceManager.shared.addArea(name: areaName)
        }
        
    }
    
}
