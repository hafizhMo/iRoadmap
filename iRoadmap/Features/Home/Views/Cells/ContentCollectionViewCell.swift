//
//  ContentCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

protocol ExpandableItemDelegate {
    func expandableItemChanges(isExpanded: Bool)
}

class ContentCollectionViewCell: UICollectionViewCell, ExpandableItemDelegate {
    
    static let identifier = "ContentCollectionViewCell"
    
    private let labelTitle: UILabel = titleLabel(title: "Content")
    private let labelDescription: UILabel = descLabel(title: "Subcontent")
    private let imageIcon: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrowtriangle.right.fill"))
        image.tintColor = .black
        return image
    }()
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DividerColor")
        return view
    }()
    
    public func config(data: Content) {
        
        addSubview(divider)
        addSubview(imageIcon)
        addSubview(labelTitle)
        addSubview(labelDescription)
        
        imageIcon.snp.makeConstraints { comp in
            comp.centerY.equalToSuperview().offset(-4)
            comp.leading.equalToSuperview().offset(24)
            comp.width.equalTo(18)
        }
        
        labelTitle.text = data.name
        labelTitle.snp.makeConstraints { comp in
            comp.top.equalToSuperview().offset(12)
            comp.leading.equalTo(imageIcon.snp.trailing).offset(12)
            comp.trailing.equalToSuperview().offset(-20)
        }
        
        labelDescription.text = "\(data.totalSub) Chapter"
        labelDescription.snp.makeConstraints { comp in
            comp.leading.equalTo(labelTitle)
            comp.trailing.equalTo(labelTitle)
            comp.top.equalTo(labelTitle.snp.bottom)
        }
        
        divider.snp.makeConstraints { comp in
            comp.height.equalTo(1)
            comp.top.equalTo(labelDescription.snp.bottom).offset(12)
            comp.leading.equalTo(labelTitle)
            comp.trailing.equalToSuperview()
        }
    }
    
    func expandableItemChanges(isExpanded: Bool = false) {
        if isExpanded {
            imageIcon.image = UIImage(systemName: "arrowtriangle.down.fill")
            divider.isHidden = true
        } else {
            imageIcon.image = UIImage(systemName: "arrowtriangle.right.fill")
            divider.isHidden = false
        }
    }
}
