//
//  FantasyPointSystemViewController.swift
//  FantasyCricket
//
//  Created by Developer on 25/05/19.
//

import UIKit
import WebKit
class FantasyPointSystemViewController: BaseClass {

    @IBOutlet weak var aWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebView()
    }
    
    private func openWebView() {
        let url = URL(string: webBaseURL + kFantasyPointURl)
        if let urlLink = url {
            let request = URLRequest(url: urlLink)
            aWebView.load(request)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNavigationBar(navigationTitle: "Fantasy Point Sysytem", titleContentMode: .left, isNavImageShow: true, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
    }

    override func handleBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
