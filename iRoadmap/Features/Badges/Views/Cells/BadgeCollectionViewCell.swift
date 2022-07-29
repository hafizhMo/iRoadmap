//
//  BadgeCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class BadgeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BadgeCollectionViewCell"
    
    private let bgImage: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let imageIcon = UIImageView()
    private let labelTitle: UILabel = titleLabel(title: "")
    private let labelDescription: UILabel = descLabel(title: "")
    private let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = UIColor(named: "DividerColor")
        progress.layer.cornerRadius = 2
        progress.clipsToBounds = true
        return progress
    }()
    
    public func config(data: Badge) {
        addSubview(bgImage)
        addSubview(imageIcon)
        addSubview(labelTitle)
        addSubview(labelDescription)
        addSubview(progressBar)
        
        bgImage.backgroundColor = data.color
        bgImage.snp.makeConstraints { comp in
            comp.size.equalTo(70)
            comp.leading.equalToSuperview().offset(20)
            comp.centerY.equalToSuperview()
        }
        
        imageIcon.image = data.image
        imageIcon.snp.makeConstraints { comp in
            comp.top.equalTo(bgImage).offset(12)
            comp.bottom.equalTo(bgImage).offset(-12)
            comp.leading.equalTo(bgImage).offset(12)
            comp.trailing.equalTo(bgImage).offset(-12)
        }
        
        labelTitle.text = data.name
        labelTitle.snp.makeConstraints { comp in
            comp.top.equalTo(bgImage)
            comp.bottom.equalTo(progressBar.snp.top).offset(-8)
            comp.leading.equalTo(bgImage.snp.trailing).offset(12)
            comp.trailing.equalToSuperview().offset(-20)
        }
        
        labelDescription.text = data.desc
        labelDescription.snp.makeConstraints { comp in
            comp.bottom.equalTo(bgImage)
            comp.top.equalTo(progressBar.snp.bottom).offset(8)
            comp.leading.equalTo(labelTitle)
            comp.trailing.equalTo(labelTitle)
        }
        
        progressBar.tintColor = data.color
        progressBar.progress = data.progress / data.total
        progressBar.snp.makeConstraints { comp in
            comp.centerY.equalTo(bgImage)
            comp.leading.equalTo(labelTitle)
            comp.trailing.equalTo(labelTitle)
            comp.height.equalTo(4)
        }
        
        if data.progress == 0 {
            progressBar.isHidden = true
            
            labelTitle.snp.updateConstraints { comp in
                comp.bottom.equalTo(progressBar.snp.top).offset(8)
            }
            
            labelDescription.snp.updateConstraints { comp in
                comp.top.equalTo(progressBar.snp.bottom).offset(-8)
            }
        }
        
        if data.progress < data.total {
            bgImage.backgroundColor = UIColor(named: "DividerColor")!
            imageIcon.image = data.image.convertToGrayScale()
        }
    }
}
