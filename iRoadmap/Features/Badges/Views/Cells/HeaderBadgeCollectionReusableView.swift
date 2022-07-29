//
//  HeaderBadgeCollectionReusableView.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class HeaderBadgeCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderBadgeCollectionReusableView"
    
    private let bgBadge: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.backgroundColor = .darkGray
        return view
    }()
    private let valueLabel = titleLabel(title: "1", font: .largeTitle)
    private let nameLabel = descLabel(title: "Badges", font: .title3)
    private let descriptionLabel = descLabel(title: "Collect all badges by completing each mission. Great job!", font: .title3)
    
    func config() {
        addSubview(bgBadge)
        addSubview(nameLabel)
        addSubview(valueLabel)
        addSubview(descriptionLabel)
        
        bgBadge.snp.makeConstraints { comp in
            comp.centerX.equalToSuperview()
            comp.top.equalToSuperview().offset(75)
            comp.size.equalTo(100)
        }
        
        valueLabel.textColor = .white
        valueLabel.textAlignment = .center
        valueLabel.snp.makeConstraints { comp in
            comp.top.equalTo(bgBadge).offset(20)
            comp.leading.equalTo(bgBadge)
            comp.trailing.equalTo(bgBadge)
        }
        
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.snp.makeConstraints { comp in
            comp.bottom.equalTo(bgBadge).offset(-20)
            comp.leading.equalTo(bgBadge)
            comp.trailing.equalTo(bgBadge)
        }
        
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.snp.makeConstraints { comp in
            comp.leading.equalToSuperview().offset(30)
            comp.trailing.equalToSuperview().offset(-30)
            comp.top.equalTo(bgBadge.snp.bottom).offset(18)
        }
    }
}
