//
//  ButtonType.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

func defaultButton(title: String, isActive: Bool = true) -> UIButton {
    let button = UIButton()
    button.titleLabel?.font = customizedFont(forTextStyle: .title2)
    button.setTitleColor(.white, for: .normal)
    button.setTitle(title, for: .normal)
    button.layer.cornerRadius = 8.0

    switch isActive {
    case true:
        button.backgroundColor = .systemBlue
    case false:
        button.backgroundColor = .systemGray
    }
    
    button.snp.makeConstraints { btn in
        btn.height.equalTo(45)
    }
    
    return button
}


func textButton(title: String) -> UIButton {
    let button = UIButton()
    button.titleLabel?.font = customizedFont(forTextStyle: .footnote)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle(title, for: .normal)
    
    return button
}

func backButton() -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
    button.backgroundColor = .systemBackground
    button.layer.cornerRadius = 8.0
    button.tintColor = .black
    
    button.snp.makeConstraints { btn in
        btn.size.equalTo(32)
    }
    
    return button
}

func checkBoxButton() -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
    button.setImage(UIImage(systemName: "square"), for: .normal)
    button.tintColor = .systemBlue
    
//    button.snp.makeConstraints { btn in
//        btn.size.equalTo(32)
//    }
    
    return button
}
