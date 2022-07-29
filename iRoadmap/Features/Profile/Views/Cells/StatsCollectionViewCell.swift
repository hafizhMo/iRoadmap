//
//  StatsCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StatsCollectionViewCell"
    private let valueLabel = titleLabel(title: "", font: .headline)
    private let nameLabel = descLabel(title: "", font: .subheadline)
    
    private let bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    public func config(value: Int, name: String) {
        addSubview(valueLabel)
        addSubview(nameLabel)
        addSubview(bgView)
        
        bgView.snp.makeConstraints { comp in
            comp.size.equalToSuperview()
        }
        
        nameLabel.text = name
        nameLabel.textColor = .darkGray
        nameLabel.textAlignment = .center
        nameLabel.snp.makeConstraints { comp in
            comp.bottom.equalToSuperview().offset(-16)
            comp.leading.equalToSuperview().offset(10)
            comp.trailing.equalToSuperview().offset(-10)
        }
        
        valueLabel.text = "\(value)"
        valueLabel.snp.makeConstraints { comp in
            comp.top.equalToSuperview().offset(16)
            comp.centerX.equalToSuperview()
        }
    }
}
