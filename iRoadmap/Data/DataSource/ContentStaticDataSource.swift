//
//  ContentStaticDataSource.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import Foundation

class ContentStaticDataSource {
    
    public func allContent() -> [Content] {
        return [content1, content2, content3, content4, content5, dummy, dummy, dummy, dummy, dummy]
    }
    
    private let content1: Content = Content(name: "Swift Programming Language", subContent: subContent1, totalSub: subContent1.count)
    private static let subContent1: [SubContent] = [
        SubContent(name: "Variable & Function", learningObj: learningObj1, link: link1, totalLO: learningObj1.count),
        SubContent(name: "Object Oriented Programming", learningObj: learningObj2, link: link2, totalLO: learningObj2.count),
        SubContent(name: "Error Handling", learningObj: learningObj3, link: link3, totalLO: learningObj3.count)
    ]
    private static let learningObj1: [LearningObjective] = [
        LearningObjective(name: "I know all of data type"),
        LearningObjective(name: "I understand how Access Modifier working"),
        LearningObjective(name: "I can create any function style")
    ]
    private static let link1: [Link] = [
        Link(title: "The Basics — The Swift Programming Language (Swift 5.7)", url: "https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html"),
        Link(title: "Swift Variables, Constants and Literals (With Examples)", url: "https://www.programiz.com/swift-programming/variables-constants-literals"),
        Link(title: "Functions — The Swift Programming Language (Swift 5.7)", url: "https://docs.swift.org/swift-book/LanguageGuide/Functions.html"),
        Link(title: "A Deep Dive Into Functions in Swift | by Neel Bakshi", url: "https://betterprogramming.pub/functions-in-swift-5d8ee85f2de6", type: .additional),
    ]
    private static let learningObj2: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link2: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    private static let learningObj3: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link3: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    
    private let content2: Content = Content(name: "Common Topics", subContent: subContent2, totalSub: subContent2.count)
    private static let subContent2: [SubContent] = [
        SubContent(name: "Mobile Human Interface Guideline", learningObj: learningObj4, link: link4, totalLO: learningObj4.count),
        SubContent(name: "iOS Technology", learningObj: learningObj5, link: link5, totalLO: learningObj5.count)
    ]
    private static let learningObj4: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link4: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    private static let learningObj5: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link5: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    
    private let content3: Content = Content(name: "Getting Deeper", subContent: subContent3, totalSub: subContent3.count)
    private static let subContent3: [SubContent] = [
        SubContent(name: "Network Programming", learningObj: learningObj6, link: link6, totalLO: learningObj6.count),
        SubContent(name: "Communication Pattern", learningObj: learningObj7, link: link7, totalLO: learningObj7.count)
    ]
    private static let learningObj6: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link6: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    private static let learningObj7: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link7: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    
    private let content4: Content = Content(name: "Reactive Programming", subContent: subContent4, totalSub: subContent4.count)
    private static let subContent4: [SubContent] = [
        SubContent(name: "RxSwift", learningObj: learningObj8, link: link8, totalLO: learningObj8.count)
    ]
    private static let learningObj8: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link8: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    
    private let content5: Content = Content(name: "Testing", subContent: subContent5, totalSub: subContent5.count)
    private static let subContent5: [SubContent] = [
        SubContent(name: "XCTest", learningObj: learningObj9, link: link9, totalLO: learningObj9.count)
    ]
    private static let learningObj9: [LearningObjective] = [
        LearningObjective(name: "I Can ..."),
        LearningObjective(name: "I Can ...")
    ]
    private static let link9: [Link] = [
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com"),
        Link(title: "Introduction", url: "www.introduction.com", type: .additional),
    ]
    
    private let dummy: Content = Content(name: "Dummy", subContent: subContent5, totalSub: subContent5.count)
}
