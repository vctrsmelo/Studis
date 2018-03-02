//
//  TopicsManager.swift
//  Studis
//
//  Created by Victor Melo on 02/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import Foundation

protocol TopicsManager {
    func addTopic(name: String)
    func getNextTopic()
    func getNextTopics(quantity: Int)
}
