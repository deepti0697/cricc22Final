//
//  HomeTabBarController.swift
//  DreamTeam
//
//  Created by Test on 12/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController,UITabBarControllerDelegate {

    
       
            override func viewDidLoad() {
                super.viewDidLoad()
                self.delegate = self
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                customizeTabBarView()
                configureTabItems()
            }
         
            fileprivate func configureTabItems() {
                let selectedColor = UIColor(red: 0, green: 64, blue: 161)
                let unselectedColor = UIColor.gray
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
                if let arrayOfTabBarItems = self.tabBar.items as NSArray? {
                    for (index, item) in arrayOfTabBarItems.enumerated() {
                        if let tabItem = item as? UITabBarItem {
                            tabItem.tag = index
                            tabItem.title = homeTabOptions[index]
                          tabItem.image = UIImage(named: homeTabDefaultImage[index])
                      //      tabItem.selectedImage = UIImage(named: homeTabSelectedImage[index])
                            tabItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
                        }
                    }
                }
            }
            
            fileprivate func customizeTabBarView() {
                UITabBar.appearance().barTintColor = UIColor.white
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0 / 255, green: 64 / 255, blue: 161 / 255, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)], for: .selected)
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)], for: .normal)
            }
        }

