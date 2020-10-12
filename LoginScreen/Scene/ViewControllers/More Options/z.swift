//
//  MoreViewController.swift
//  FantasyCricket
//
//  Created by Developer on 15/05/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import SwiftyJSON
class MoreViewController: BaseClass {
    
   
    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet weak var amountLbl: UILabel!
    
    var myBalanceDataArray = [BalanceModel]() {
           didSet {
               amountLbl.text = "\(kRupeeIcon) \(myBalanceDataArray[0].totalamount ?? "0")"
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        aTableView.delegate = self
        aTableView.dataSource = self
        aTableView.tableFooterView = UIView()
        fetchAccountData()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        addNavigationBar(navigationTitle: "More", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: false, isWalletButtonShow: false, isBinButtonShow: false)
    }
    func fetchAccountData() {
           showActivityIndicator(sMessage: "Loading...")
           let headers = [
               "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NzA3MjE0NywiZXhwIjoxNTY3MDc1NzQ3LCJuYmYiOjE1NjcwNzIxNDcsImp0aSI6InVIZWIyNmhSZG5sWWZheU0iLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.-Saz_1BZR3kqfNWHU4-gN5ccmM3_gvOO6G14jjY_ho0",
               "Content-Type": "application/x-www-form-urlencoded",
               "cache-control": "no-cache"
           ]
           if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
               
               let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
               let parameters = ["user_id": UserDic.value(forKey: "user_id")]
               NetworkManager.post_Request(urlService: kMyBalance, param: parameters as [String : Any], head: headers) { (response) in
                   self.hideActivityIndicator()
                   do {
                       if response != nil {
                           let json = try JSON(data:response as! Data)
                           let result = json["result"]
                           for arr in result.arrayValue {
                               self.myBalanceDataArray.append(BalanceModel(json:arr))
                           }
                       } else {
                           Loader.showAlert(message: "Unable to get Account Data")
                       }
                       
                   } catch {
                       Loader.showAlert(message: "Status code 500: server internal error")
                   }
               }
           }
       }
       
       
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    func registerCell() {
        aTableView.register(UINib(nibName: MoreTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: MoreTableViewCell.identifier())
//        aTableView.register(UINib(nibName: VersionTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: VersionTableViewCell.identifier())
    }
    
    func openProfile() {
        openViewController(controller: ProfileViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
        
    }
    @IBAction func walletAction(_ sender: Any) {
        openViewController(controller: AccountCollectinViewController.self, storyBoard: .accountStoryBoard) { (vc) in
                   
               }
    }
    
    @IBAction func notificationViewController(_ sender: Any) {
        openViewController(controller: NotificationViewController.self, storyBoard: .homeStoryBoard) { (vc) in
               
             }
    }
    
    func openReferEarn() {
        openViewController(controller: ReferAndEarnViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openVerifyAccount() {
        openViewController(controller: VerifyAccountViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openFantasyPointSystem() {
        openViewController(controller: FantasyPointSystemViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openMyWallet() {
//        openViewController(controller: AccountViewController.self, storyBoard: .accountStoryBoard) { (vc) in
//            vc.isFromMore = true
//        }
    }
    
    func openReferList() {
        openViewController(controller: ReferListViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openLeaderBoard() {
//        openViewController(controller: LeaderBoardViewController.self, storyBoard: .moreStoryBoard) { (vc) in
//
//        }
    }
    
    func openPrivacyPolicy() {
        openViewController(controller: PrivacyPolicyViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openTermAndCondition() {
        openViewController(controller: TermAndConditionViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openAboutUs() {
        openViewController(controller: AboutUsViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openHowToPlay() {
        openViewController(controller: HowToPlayViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openContactUs() {
        openViewController(controller: ContactUsViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openTestimonial() {
        openViewController(controller: TestimonialViewController.self, storyBoard: .moreStoryBoard) { (vc) in

        }
    }
    
    func openFqs() {
        openViewController(controller: FQsViewController.self, storyBoard: .moreStoryBoard) { (vc) in
        }
    }
    
    func openFairplay() {
//        openViewController(controller: FairPlayViewController.self, storyBoard: .moreStoryBoard) { (vc) in
//        }
    }
    
    func openChangePassword() {
        
    }
    
    func logoutAction() {

            ShowimportantAlert(title: "Alert!", message: "Do you want to logout?", handlerOK: { action in
               
                UserDefaults.standard.removeObject(forKey: kUserId)
                       UserDefaults.standard.removeObject(forKey: kOTP)
                       UserDefaults.standard.removeObject(forKey: kEmailId)
                       UserDefaults.standard.removeObject(forKey: kMobileNumber)
                       UserDefaults.standard.removeObject(forKey: kReferCode)
                       UserDefaults.standard.removeObject(forKey: kTeamName)
                       UserDefaults.standard.removeObject(forKey: kPanCardNo)
                       UserDefaults.standard.removeObject(forKey: kBankAccountNo)
                       UserDefaults.standard.removeObject(forKey: kInviteReferCode)
                       UserDefaults.standard.set(false, forKey: kLoggedIn)
                  
                                                                 
                                                                 
                                                                 // Get Login User Data
                       if (UserDefaults.standard.value(forKey: "loginData") as? NSData) != nil {
                                                                     
                                     
                               UserDefaults.standard.removeObject(forKey: "loginData")
                               for key in UserDefaults.standard.dictionaryRepresentation().keys {
                                   UserDefaults.standard.removeObject(forKey: key)
                               }
                               
                       }
                if (UserDefaults.standard.value(forKey: "loginDataTemp") as? NSData) != nil {
                                                                                    
                                                    
                                              UserDefaults.standard.removeObject(forKey: "loginDataTemp")
                                              for key in UserDefaults.standard.dictionaryRepresentation().keys {
                                                  UserDefaults.standard.removeObject(forKey: key)
                                              }
                                              
                                      }
                       if (UserDefaults.standard.value(forKey: "loginData") as? NSData) != nil {
                                                             
                             
                       UserDefaults.standard.removeObject(forKey: "loginData")
                       }
                       if (UserDefaults.standard.value(forKey: "UserDetail") as? NSData) != nil {
                                                                     
                                      for key in UserDefaults.standard.dictionaryRepresentation().keys {
                                          UserDefaults.standard.removeObject(forKey: key)
                                      }
                           UserDefaults.standard.removeObject(forKey: "UserDetail")
                           
                       }
                               if let googleSignIn = GIDSignIn.sharedInstance() {
                           googleSignIn.signOut()
                       }
                       LoginManager().logOut()
                       APP_DEL.openInitialViewController()
            }, handlerCancle: {actionCanel in
                print("Action cancel called")
            })
        
       
       
    }
    func footerMethod() {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: aTableView.frame.size.width, height: 1)
        footerView.backgroundColor = aTableView.separatorColor
        aTableView.tableFooterView = footerView
    }
}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier(), for: indexPath) as! MoreTableViewCell
           
                cell.configCell(imageName: moreImagesArray[indexPath.row], title: moreTitlesArray[indexPath.row], showTitle: false)
                return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
         openProfile()
        case 1:
             openReferEarn()
        case 2:
            openVerifyAccount()
        case 3:
           openFantasyPointSystem()
        case 4:
      openReferList()
        case 5:
                openPrivacyPolicy()
        break // Personel Info
        case 6:
           openTermAndCondition()
        case 7:
            openAboutUs()
        break // Help
        case 8:
            openHowToPlay()
        case 9:
            openContactUs()
        case 10:
            logoutAction()
        break  // General Info
        
            
        default:
            break
        }
    }
}
