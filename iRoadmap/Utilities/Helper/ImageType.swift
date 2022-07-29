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

extension UIImage {
    func convertToGrayScale() -> UIImage {

        // Create image rectangle with current image width/height
        let imageRect:CGRect = CGRect(x:0, y:0, width:self.size.width, height: self.size.height)

        // Grayscale color space
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = self.size.width
        let height = self.size.height

        // Create bitmap content with current image size and grayscale colorspace
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)

        // Draw image into current context, with specified rectangle
        // using previously defined context (with grayscale colorspace)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(self.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()

        // Create a new UIImage object
        let newImage = UIImage(cgImage: imageRef!)

        return newImage
    }
}
