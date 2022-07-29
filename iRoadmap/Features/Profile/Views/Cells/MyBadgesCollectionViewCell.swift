//
//  MyBadgesCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class MyBadgesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyBadgesCollectionViewCell"
    
    private let nameBadge: UILabel = titleLabel(title: "")
    private let imageBadge: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        return image
    }()
    let bgCard: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.backgroundColor = .white
        return view
    }()
    private let bgImage: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    private let imageIcon = UIImageView()
    
    public func config(name: String, image: UIImage, color: UIColor) {
        addSubview(bgCard)
        addSubview(nameBadge)
        addSubview(bgImage)
        addSubview(imageIcon)
        
        bgCard.snp.makeConstraints { comp in
            comp.top.equalToSuperview()
            comp.trailing.equalToSuperview()
            comp.bottom.equalTo(nameBadge).offset(20)
            comp.leading.equalToSuperview().offset(16)
        }
        
        nameBadge.text = name
        nameBadge.textAlignment = .center
        nameBadge.snp.makeConstraints { comp in
            comp.top.equalTo(bgImage.snp.bottom).offset(12)
            comp.trailing.equalTo(bgCard).offset(-10)
            comp.leading.equalTo(bgCard).offset(10)
        }
        
        bgImage.backgroundColor = .systemTeal
        bgImage.snp.makeConstraints { comp in
            comp.size.equalTo(70)
            comp.top.equalTo(bgCard).offset(20)
            comp.centerX.equalTo(bgCard)
        }
        
        imageIcon.image = UIImage(named: "badges1")
        imageIcon.snp.makeConstraints { comp in
            comp.top.equalTo(bgImage).offset(12)
            comp.bottom.equalTo(bgImage).offset(-12)
            comp.leading.equalTo(bgImage).offset(12)
            comp.trailing.equalTo(bgImage).offset(-12)
        }
    }
}
