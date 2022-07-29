//
//  SubContent.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import Foundation

class SubContent {
    let name: String
    let learningObj: [LearningObjective]
    let link: [Link]
    let totalLO: Int
    var progressLO: Int = 0
    
    init(name: String, learningObj: [LearningObjective], link: [Link], totalLO: Int) {
        self.name = name
        self.learningObj = learningObj
        self.link = link
        self.totalLO = totalLO
    }
    
    public func update(value: Int) {
        progressLO += value
    }
    
    public func markAsDone() {
        progressLO = totalLO
    }
}
