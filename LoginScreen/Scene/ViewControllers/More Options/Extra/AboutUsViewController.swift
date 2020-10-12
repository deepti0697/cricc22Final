//
//  AboutUsViewController.swift
//  FantasyCricket
//
//  Created by Developer on 25/05/19.
//

import UIKit
import WebKit
class AboutUsViewController: BaseClass {

   
    
    @IBOutlet weak var webivew: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebView()
    }
    
    private func openWebView() {
        let url = URL(string: webBaseURL + kAboutUsURl)
        if let urlLink = url {
            let request = URLRequest(url: urlLink)
            webivew.load(request)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNavigationBar(navigationTitle: "About Us", titleContentMode: .left, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
    }

    override func handleBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
