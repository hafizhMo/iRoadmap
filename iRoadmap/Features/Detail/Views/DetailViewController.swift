//
//  DetailViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 26/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var btnBack: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail"
        view.backgroundColor = .systemCyan
        view.addSubview(btnBack)
        
        btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnBack.snp.makeConstraints { comp in
            comp.center.equalToSuperview()
        }
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
