//
//  ProfileViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var btnBack: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    private var btnBadges: UIButton = {
        let button = UIButton()
        button.setTitle("Badges", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .systemBlue
        view.addSubview(btnBack)
        view.addSubview(btnBadges)
        
        btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnBack.snp.makeConstraints { comp in
            comp.center.equalToSuperview()
        }
        
        btnBadges.addTarget(self, action: #selector(goBadges), for: .touchUpInside)
        btnBadges.snp.makeConstraints { comp in
            comp.centerX.equalToSuperview()
            comp.top.equalTo(btnBack.snp.bottom).offset(20)
        }
    }
    
    @objc func goBadges() {
        self.navigationController?.pushViewController(BadgesViewController(), animated: true)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
