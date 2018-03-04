//
//  AreaViewViewModel.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

struct AreaViewViewModel {
    
    var areaName: String? {
        didSet {
            guard let areaName = areaName else { return }
            PersistenceManager.shared.addArea(name: areaName)
        }
    }
    
}
