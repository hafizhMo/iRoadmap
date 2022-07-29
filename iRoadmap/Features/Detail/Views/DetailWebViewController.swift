//
//  DetailWebViewController.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 29/07/22.
//

import UIKit
import WebKit

class DetailWebViewController: UIViewController {
    
    private let webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    public var link: Link?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: link!.url) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.snp.makeConstraints { comp in
            comp.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            comp.size.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
