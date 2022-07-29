//
//  DetailViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

protocol DetailChanges {
    func markAsDone()
    func updateProgress(isDone: Bool)
}

class DetailViewController: UIViewController, DetailChanges {
    
    private var btnBack: UIButton = backButton()
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(HeaderDetailCollectionReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HeaderDetailCollectionReusableView.identifier)
        collection.register(HeaderCollectionReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collection.register(FooterDetailCollectionReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: FooterDetailCollectionReusableView.identifier)
        collection.register(LearningObjCollectionViewCell.self,
                            forCellWithReuseIdentifier: LearningObjCollectionViewCell.identifier)
        collection.register(LinksCollectionViewCell.self,
                            forCellWithReuseIdentifier: LinksCollectionViewCell.identifier)
        return collection
    }()
    
    var data: SubContent?
    var contentTitle: String?
    var parentVC: HomeViewController?
    var mainLink = [Link]()
    var additionalLink = [Link]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        
        for link in data!.link {
            switch link.type {
            case .main:
                mainLink.insert(link, at: mainLink.count)
            case .additional:
                additionalLink.insert(link, at: additionalLink.count)
            }
        }
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func initUI() {
        view.addSubview(collectionView)
        view.addSubview(btnBack)
        
        btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnBack.snp.makeConstraints { comp in
            comp.leading.equalToSuperview().offset(20)
            comp.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        collectionView.snp.makeConstraints { comp in
            comp.top.equalTo(view.safeAreaLayoutGuide)
            comp.bottom.equalTo(view.safeAreaLayoutGuide)
            comp.leading.equalTo(view.safeAreaLayoutGuide)
            comp.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func markAsDone() {
        for lo in data!.learningObj {
            lo.update(isDone: true)
        }
        data?.markAsDone()
        parentVC!.updateList()
    }
    
    func updateProgress(isDone: Bool) {
        let value = isDone ? 1 : -1
        data?.update(value: value)
        parentVC!.updateList()
    }
}
