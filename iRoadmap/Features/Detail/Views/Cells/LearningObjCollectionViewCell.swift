//
//  LearningObjCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class LearningObjCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LearningObjCollectionViewCell"
    
    private let checkBox = checkBoxButton()
    private let loLabel: UILabel = titleLabel(title: "I can apply Images and Videos with UIKit")
    private var data: LearningObjective?
    var vc: DetailViewController?
    
    public func config(data: LearningObjective) {
        self.data = data
        
        addSubview(checkBox)
        addSubview(loLabel)
        
        checkBox.isSelected = data.isDone
        checkBox.addTarget(self, action: #selector(tapCheckBox), for: .touchUpInside)
        checkBox.snp.makeConstraints { comp  in
            comp.top.equalToSuperview()
            comp.bottom.equalToSuperview()
            comp.leading.equalToSuperview().offset(12)
            comp.size.equalTo(32)
        }
        
        loLabel.text = data.name
        loLabel.numberOfLines = 3
        loLabel.snp.makeConstraints { comp in
            comp.centerY.equalTo(checkBox)
            comp.leading.equalTo(checkBox.snp.trailing).offset(8)
            comp.trailing.equalToSuperview().offset(-10)
        }
    }
    
    @objc func tapCheckBox() {
        vc?.updateProgress(isDone: !checkBox.isSelected)
        data?.update(isDone: !checkBox.isSelected)
        checkBox.isSelected = !checkBox.isSelected
    }
}
