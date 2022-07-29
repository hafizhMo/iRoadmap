//
//  LearningObjective.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import Foundation

class LearningObjective {
    let name: String
    var isDone: Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    func update(isDone: Bool) {
        self.isDone = isDone
    }
}
