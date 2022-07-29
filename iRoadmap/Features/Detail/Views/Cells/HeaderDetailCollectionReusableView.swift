//
//  HeaderDetailCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class HeaderDetailCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderDetailCollectionReusableView"
    
    private let labelContent = descLabel(title: "Learn the Basics")
    private let labelSubContent = titleLabel(title: "Swift Programming Language", font: .largeTitle)
    
    public func config(content: String, subContent: String) {
        addSubview(labelContent)
        addSubview(labelSubContent)
        
        labelContent.textAlignment = .center
        labelContent.numberOfLines = 0
        labelContent.textColor = .darkGray
        labelContent.text = content
        labelContent.snp.makeConstraints { comp in
            comp.top.equalToSuperview().offset(58)
            comp.leading.equalToSuperview().offset(32)
            comp.trailing.equalToSuperview().offset(-32)
        }
        
        labelSubContent.textAlignment = .center
        labelSubContent.numberOfLines = 0
        labelSubContent.text = subContent
        labelSubContent.snp.makeConstraints { comp in
            comp.top.equalTo(labelContent.snp.bottom).offset(8)
            comp.leading.equalTo(labelContent)
            comp.trailing.equalTo(labelContent)
        }
    }
}
