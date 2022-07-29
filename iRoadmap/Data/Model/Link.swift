//
//  Link.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import Foundation

struct Link {
    let title: String
    let url: String
    var type: LinkType = .main
}

enum LinkType {
    case main
    case additional
}
