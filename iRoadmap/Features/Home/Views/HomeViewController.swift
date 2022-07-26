//
//  HomeViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var btnProfile: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        return button
    }()
    
    private var btnDetail: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .systemGreen
        
        view.addSubview(btnDetail)
        view.addSubview(btnProfile)
        
        btnDetail.addTarget(self, action: #selector(goDetail), for: .touchUpInside)
        btnDetail.snp.makeConstraints { comp in
            comp.center.equalToSuperview()
        }
        
        btnProfile.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
        btnProfile.snp.makeConstraints { comp in
            comp.centerX.equalToSuperview()
            comp.top.equalTo(btnDetail.snp.bottom).offset(20)
        }
    }
    
    @objc func goProfile() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func goDetail() {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
