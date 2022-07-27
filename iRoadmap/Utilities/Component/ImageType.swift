//
//  ImageType.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 27/07/22.
//

import Foundation
import UIKit

func profileImage(image: String, size: CGFloat) -> UIImageView {
    let img = UIImage(named: image)
    let imgView = UIImageView(image: img)
    imgView.layer.cornerRadius = size / 2
    imgView.layer.masksToBounds = false
    imgView.clipsToBounds = true
    
    imgView.layer.borderColor = UIColor.black.cgColor
    imgView.layer.borderWidth = size <= 48 ? 1 : 4
    
    imgView.snp.makeConstraints { comp in
        comp.size.equalTo(size)
    }
    
    return imgView
}

extension UIImageView {
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.image = anyImage
    }
}
