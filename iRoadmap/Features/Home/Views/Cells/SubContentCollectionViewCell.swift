//
//  SubContentCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class SubContentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SubContentCollectionViewCell"
    
    private let labelTitle: UILabel = titleLabel(title: "Lesson 1")
    private let labelDescription: UILabel = descLabel(title: "3 Chapter")
    let bgCard: CardCollectionViewCell = {
        let view = CardCollectionViewCell()
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 60
        view.backgroundColor = .white
        return view
    }()
    
    private let progressBar: CircularProgressView = {
        let view = CircularProgressView()
        view.makeCircularPath()
        view.trackClr = UIColor(named: "DividerColor")!
        view.progressClr = UIColor.systemBlue
        return view
    }()
    
    public func config(data: SubContent) {
        addSubview(bgCard)
        addSubview(labelTitle)
        addSubview(labelDescription)
        addSubview(progressBar)
        
        let progress = Float(data.progressLO) / Float(data.totalLO)
        progressBar.setProgressWithAnimation(value: progress)
        progressBar.snp.makeConstraints { comp in
            comp.centerY.equalTo(bgCard)
            comp.trailing.equalTo(bgCard).offset(-20)
            comp.size.equalTo(20)
        }
        
        bgCard.snp.makeConstraints { comp in
            comp.top.equalToSuperview()
            comp.leading.equalToSuperview().offset(50)
            comp.trailing.equalToSuperview().offset(-20)
            comp.bottom.equalTo(labelDescription).offset(16)
        }
        
        labelTitle.text = data.name
        labelTitle.snp.makeConstraints { comp in
            comp.top.equalToSuperview().offset(16)
            comp.leading.equalTo(bgCard).offset(20)
            comp.trailing.equalTo(progressBar.snp.leading).offset(-8)
        }
        
        labelDescription.text = "\(data.progressLO) of \(data.totalLO) learning objective to go"
        labelDescription.snp.makeConstraints { comp in
            comp.leading.equalTo(labelTitle)
            comp.trailing.equalTo(labelTitle)
            comp.top.equalTo(labelTitle.snp.bottom)
        }
    }
}
