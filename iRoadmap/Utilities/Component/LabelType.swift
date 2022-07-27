//
//  LabelType.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 27/07/22.
//

import Foundation
import UIKit

func titleLabel(title: String, font: UIFont.TextStyle = .title2) -> UILabel {
    let label = UILabel()
    label.text = title
    label.textColor = .label
    label.font = customizedFont(forTextStyle: font)
    
    return label
}

func descLabel(title: String, font: UIFont.TextStyle = .caption1) -> UILabel {
    let label = UILabel()
    label.text = title
    label.textColor = .systemGray
    label.font = customizedFont(forTextStyle: font)
    
    return label
}

func customizedFont(forTextStyle: UIFont.TextStyle) -> UIFont {
    let fontName = "Inter"
    let fontMedium = UIFont(name: "\(fontName)-Medium", size: 12)!
    let fontSemiBold = UIFont(name: "\(fontName)-SemiBold", size: 12)!
    let fontExtraBold = UIFont(name: "\(fontName)-ExtraBold", size: 12)!
    
    switch forTextStyle {
    case .largeTitle:
        return fontExtraBold.with(style: forTextStyle, basePointSize: 32)
    case .title1:
        return fontSemiBold.with(style: forTextStyle, basePointSize: 20)
    case .title2:
        return fontSemiBold.with(style: forTextStyle, basePointSize: 16)
    case .title3:
        return fontSemiBold.with(style: forTextStyle, basePointSize: 14)
    case .headline:
        return fontExtraBold.with(style: forTextStyle, basePointSize: 20)
    case .body:
        return fontSemiBold.with(style: forTextStyle, basePointSize: 14)
    case .subheadline:
        return fontSemiBold.with(style: forTextStyle, basePointSize: 12)
    case .footnote:
        return fontMedium.with(style: forTextStyle, basePointSize: 16)
    case .caption1:
        return fontMedium.with(style: forTextStyle, basePointSize: 14)
    case .caption2:
        return fontMedium.with(style: forTextStyle, basePointSize: 12)
    default:
        return fontMedium
    }
}

extension UIFont {
    func with(style: UIFont.TextStyle, basePointSize: CGFloat, maxPointSize: CGFloat? = nil) -> UIFont {
        if let maxPointSize = maxPointSize {
            return UIFontMetrics(forTextStyle: style).scaledFont(for: self.withSize(basePointSize + 2), maximumPointSize: maxPointSize)
        }
        return UIFontMetrics(forTextStyle: style).scaledFont(for: self.withSize(basePointSize + 2))
    }
}
