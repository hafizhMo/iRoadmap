//
//  HomeViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit
import SnapKit

protocol HomeChanges {
    func updateList()
}

class HomeViewController: UIViewController, HomeChanges {
    
    private var imgProfile: UIImageView = profileImage(image: "profilePictureDummy", size: 48)
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search content or link"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    private let collection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(HeaderCollectionReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collection.register(ContentCollectionViewCell.self,
                            forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
        collection.register(SubContentCollectionViewCell.self,
                            forCellWithReuseIdentifier: SubContentCollectionViewCell.identifier)
        return collection
    }()
    
    var contents: [Content] = ContentStaticDataSource().allContent()

    var delegate: ExpandableItemDelegate?
    
    var selectedSection: Int = 0
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        initUI()
        
        collection.delegate = self
        collection.dataSource = self
    }
    
    @objc func goProfile() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func goDetail(_ sender: CardCollectionViewCell) {
        let target = DetailViewController()
        target.parentVC = self
        target.contentTitle = contents[selectedSection].name
        target.data = contents[selectedSection].subContent[selectedIndex]
        self.navigationController?.pushViewController(target, animated: true)
    }
    
    private func initUI() {view.addSubview(imgProfile)
        view.addSubview(collection)
        view.addSubview(imgProfile)
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { comp in
            comp.centerY.equalTo(imgProfile)
            comp.leading.equalToSuperview().offset(12)
            comp.trailing.equalTo(imgProfile.snp.leading).offset(-12)
        }
        
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goProfile)))
        imgProfile.snp.makeConstraints { comp in
            comp.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            comp.trailing.equalToSuperview().offset(-20)
        }
        
        collection.snp.makeConstraints { comp in
            comp.bottom.equalToSuperview()
            comp.leading.equalToSuperview()
            comp.trailing.equalToSuperview()
            comp.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    func updateList() {
        collection.reloadData()
    }
}
