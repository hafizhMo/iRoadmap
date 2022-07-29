//
//  ProfileViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var btnBack: UIButton = backButton()
    private var lblBadges: UILabel = titleLabel(title: "My Badges", font: .title1)
    private var btnBadges: UIButton = textButton(title: "See All")
    private var imgProfile: UIImageView = profileImage(image: "profilePictureDummy", size: 100)
    private var profileName: UILabel = titleLabel(title: "", font: .largeTitle)
    private var profileTitle: UILabel = descLabel(title: "", font: .title3)
    private var backgroundBadges: UIView = {
        let bg = UIView()
        bg.backgroundColor = .systemGray6
        return bg
    }()
    
    let collectionStats: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.register(StatsCollectionViewCell.self, forCellWithReuseIdentifier: StatsCollectionViewCell.identifier)
        return cv
    }()
    
    let collectionBadges: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.register(MyBadgesCollectionViewCell.self, forCellWithReuseIdentifier: MyBadgesCollectionViewCell.identifier)
        cv.backgroundColor = .systemGray6
        return cv
    }()
    
    let stats = [
        Stats(value: 1, name: "Total Badges"),
        Stats(value: 5, name: "LO. Earned"),
        Stats(value: 150, name: "Total Points")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        initUI()
        
        collectionStats.delegate = self
        collectionBadges.delegate = self
        collectionStats.dataSource = self
        collectionBadges.dataSource = self
    }
    
    @objc func goBadges() {
        self.navigationController?.pushViewController(BadgesViewController(), animated: true)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func initUI() {
        view.addSubview(backgroundBadges)
        view.addSubview(btnBack)
        view.addSubview(btnBadges)
        view.addSubview(lblBadges)
        view.addSubview(imgProfile)
        view.addSubview(profileName)
        view.addSubview(profileTitle)
        view.addSubview(collectionStats)
        view.addSubview(collectionBadges)
        
        btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnBack.snp.makeConstraints { comp in
            comp.leading.equalToSuperview().offset(20)
            comp.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        btnBadges.addTarget(self, action: #selector(goBadges), for: .touchUpInside)
        btnBadges.snp.makeConstraints { comp in
            comp.top.equalTo(backgroundBadges).offset(20)
            comp.trailing.equalToSuperview().offset(-16)
        }
        
        lblBadges.snp.makeConstraints { comp in
            comp.top.equalTo(btnBadges)
            comp.leading.equalToSuperview().offset(16)
        }
        
        imgProfile.snp.makeConstraints { comp in
            comp.top.equalTo(btnBack.snp.bottom).offset(8)
            comp.centerX.equalToSuperview()
        }
        
        profileName.text = UIDevice.current.name
        profileName.textAlignment = .center
        profileName.snp.makeConstraints { comp in
            comp.top.equalTo(imgProfile.snp.bottom).offset(12)
            comp.leading.equalToSuperview().offset(20)
            comp.trailing.equalToSuperview().offset(-20)
        }
        
        profileTitle.text = "The Beginner"
        profileTitle.textColor = .darkGray
        profileTitle.textAlignment = .center
        profileTitle.snp.makeConstraints { comp in
            comp.top.equalTo(profileName.snp.bottom)
            comp.leading.equalTo(profileName)
            comp.trailing.equalTo(profileName)
        }
        
        backgroundBadges.snp.makeConstraints { comp in
            comp.top.equalTo(collectionStats.snp.bottom).offset(20)
            comp.bottom.equalToSuperview()
            comp.leading.equalToSuperview()
            comp.trailing.equalToSuperview()
        }
        
        collectionStats.snp.makeConstraints { comp in
            comp.top.equalTo(profileTitle.snp.bottom).offset(24)
            comp.trailing.equalToSuperview().offset(-20)
            comp.leading.equalToSuperview().offset(20)
            comp.height.equalTo(80)
        }
        
        collectionBadges.snp.makeConstraints { comp in
            comp.top.equalTo(btnBadges.snp.bottom).offset(4)
            comp.leading.equalToSuperview()
            comp.trailing.equalToSuperview()
            comp.height.equalTo(175)
        }
    }
}
