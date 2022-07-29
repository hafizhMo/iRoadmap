//
//  FooterDetailCollectionReusableView.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class FooterDetailCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "FooterDetailCollectionReusableView"
    private let button: UIButton = defaultButton(title: "Mark As Done")
    public var vc: DetailViewController?
    
    
    public func config() {
        addSubview(button)
        
        button.addTarget(self, action: #selector(tapDone), for: .touchUpInside)
        button.snp.makeConstraints { comp in
            comp.bottom.equalToSuperview().offset(-16)
            comp.leading.equalToSuperview().offset(20)
            comp.trailing.equalToSuperview().offset(-20)
        }
    }
    
    @objc func tapDone() {
        vc!.markAsDone()
        vc!.navigationController?.popViewController(animated: true)
    }
}
