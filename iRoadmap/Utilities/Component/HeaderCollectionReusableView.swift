//
//  HeaderCollectionReusableView.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DividerColor")
        return view
    }()
    
    let titleSection = titleLabel(title: "Section Name", font: .title1)
    let buttonSection = textButton(title: "Add Link")
    
    public func config() {
        addSubview(buttonSection)
        addSubview(titleSection)
        addSubview(divider)
        
        divider.snp.makeConstraints { comp in
            comp.height.equalTo(1)
            comp.top.equalToSuperview().offset(20)
            comp.width.equalToSuperview()
        }
        
        titleSection.snp.makeConstraints { comp in
            comp.top.equalTo(divider).offset(16)
            comp.leading.equalToSuperview().offset(16)
        }
        
        buttonSection.isHidden = true
        buttonSection.snp.makeConstraints { comp in
            comp.top.equalTo(divider).offset(16)
            comp.trailing.equalToSuperview().offset(-16)
        }
    }
}
