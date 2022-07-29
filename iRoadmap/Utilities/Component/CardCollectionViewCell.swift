//
//  CardCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import UIKit

class CardCollectionViewCell: UIView {
    var index: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
