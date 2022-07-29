//
//  BadgeStaticDataSource.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import Foundation
import UIKit

class BadgeStaticDataSource {
    
    public func allBadges() -> [Badge] {
        return [badge1, badge2, badge3, badge4]
    }
    
    private let badge1 = Badge(name: "The Beginner", desc: "Atleast you install this app.", color: UIColor(named: "cBadge1")!, image: UIImage(named: "iBadge1")!, progress: 1, total: 1)
    private let badge2 = Badge(name: "Consistent Hooman", desc: "Keep progress 8 days in row. (4/8)", color: UIColor(named: "cBadge2")!, image: UIImage(named: "iBadge2")!, progress: 4, total: 8)
    private let badge3 = Badge(name: "Fundamental Geeks", desc: "Paham 10 LO. “Fundament... (5/10)", color: UIColor(named: "cBadge3")!, image: UIImage(named: "iBadge3")!, progress: 5, total: 10)
    private let badge4 = Badge(name: "Super Consistent Hooman", desc: "Keep progress 15 days in row.", color: UIColor(named: "cBadge4")!, image: UIImage(named: "iBadge4")!, progress: 0, total: 15)
}
