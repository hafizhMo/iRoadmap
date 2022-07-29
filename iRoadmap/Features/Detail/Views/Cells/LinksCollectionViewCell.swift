//
//  LinksCollectionViewCell.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

class LinksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LinksCollectionViewCell"
    private let linkTitle = titleLabel(title: "")
    private let linkUrl = descLabel(title: "")
    private let imageIcon: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.up.forward.app"))
        image.tintColor = .systemBlue
        return image
    }()
    private let bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    var vc: DetailViewController?
    var data: Link?
    
    public func config(data: Link) {
        self.data = data
        
        addSubview(bgView)
        addSubview(linkUrl)
        addSubview(linkTitle)
        addSubview(imageIcon)
        
        bgView.isUserInteractionEnabled = true
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWebView)))
        bgView.snp.makeConstraints { comp in
            comp.leading.equalToSuperview().offset(20)
            comp.trailing.equalToSuperview().offset(-20)
            comp.top.equalToSuperview().offset(8)
            comp.bottom.equalToSuperview()
        }
        
        imageIcon.snp.makeConstraints { comp in
            comp.bottom.equalTo(bgView).offset(-20)
            comp.trailing.equalTo(bgView).offset(-20)
            comp.size.equalTo(20)
        }
        
        linkUrl.text = data.url
        linkUrl.textColor = .systemBlue
        linkUrl.snp.makeConstraints { comp in
            comp.bottom.equalTo(imageIcon)
            comp.leading.equalTo(bgView).offset(20)
            comp.trailing.equalTo(imageIcon.snp.leading)
        }
        
        linkTitle.text = data.title
        linkTitle.snp.makeConstraints { comp in
            comp.top.equalTo(bgView).offset(20)
            comp.leading.equalTo(bgView).offset(20)
            comp.trailing.equalTo(bgView).offset(-20)
        }
    }
    
    @objc func openWebView() {
        let target = DetailWebViewController()
        target.link = data
        vc!.present(target, animated: true)
    }
}
