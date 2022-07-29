//
//  ProgressType.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class CircularProgressView: UIView {
   
    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()
    
//    required init?(coder aDecoder: NSCoder) {
//      super.init(coder: aDecoder)
//      makeCircularPath()
//    }

    var progressClr = UIColor.white {
      didSet {
         progressLyr.strokeColor = progressClr.cgColor
      }
    }

    var trackClr = UIColor.white {
      didSet {
         trackLyr.strokeColor = trackClr.cgColor
      }
    }

    func makeCircularPath() {
      self.backgroundColor = UIColor.clear
      self.layer.cornerRadius = 10
      let circlePath = UIBezierPath(arcCenter: CGPoint(x: 10, y: 10), radius: (20 - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
      trackLyr.path = circlePath.cgPath
      trackLyr.fillColor = UIColor.clear.cgColor
      trackLyr.strokeColor = trackClr.cgColor
      trackLyr.lineWidth = 6.0
      trackLyr.strokeEnd = 1.0
      layer.addSublayer(trackLyr)
      progressLyr.path = circlePath.cgPath
      progressLyr.fillColor = UIColor.clear.cgColor
      progressLyr.strokeColor = progressClr.cgColor
      progressLyr.lineWidth = 6.0
      progressLyr.strokeEnd = 0.0
        progressLyr.lineCap = .round
      layer.addSublayer(progressLyr)
    }

    func setProgressWithAnimation(value: Float) {
      progressLyr.strokeEnd = CGFloat(value)
    }
}
