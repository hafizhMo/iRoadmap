//
//  BadgesViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

class BadgesViewController: UIViewController {
    
    private var btnBack: UIButton = backButton()
    private let collection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(HeaderBadgeCollectionReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HeaderBadgeCollectionReusableView.identifier)
        collection.register(BadgeCollectionViewCell.self,
                            forCellWithReuseIdentifier: BadgeCollectionViewCell.identifier)
        return collection
    }()
    
    let badges = BadgeStaticDataSource().allBadges()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(collection)
        view.addSubview(btnBack)
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.snp.makeConstraints { comp in
            comp.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnBack.snp.makeConstraints { comp in
            comp.leading.equalToSuperview().offset(20)
            comp.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
