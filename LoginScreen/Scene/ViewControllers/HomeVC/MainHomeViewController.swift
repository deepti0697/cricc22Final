//
//  MainHomeViewController.swift
//  DreamTeam
//
//  Created by Test on 31/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import FirebaseCrashlytics
class MainHomeViewController: BaseClass {
    
    @IBOutlet weak var atableView: UITableView!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var footballOutlt: UIButton!
    @IBOutlet weak var kabaddiOutlt: UIButton!
    @IBOutlet weak var cricketOutlt: UIButton!
    @IBOutlet weak var homeCollectionView: UICollectionView!
     var userDetail:UserDetailsResponse? {
           didSet {
               configureUserFullData()
           }
       }
      
    var updateTeam = false
    var bannerTimer = Timer()
    var myBalanceDataArray = [BalanceModel]() {
           didSet {
               amountLbl.text = "\(kRupeeIcon) \(myBalanceDataArray[0].totalamount ?? "0")"
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
    private var bannerDataArray = [BannerResponses]() {
        didSet {
            atableView.reloadDataInMainQueue()
        }
    }
    
    var selectedContest: ((GetMatchDetails, String, HomeType) -> Void) = { _, _, _  in }
    var getCricketData = [GetMatchDetails]() {
        didSet{
            homeCollectionView.reloadDataInMainQueue()
        }
    }
//    var getCriceketData = [GetMatchDetails]()
    var getKabaddiData = [GetMatchDetails]() {
        didSet{
                  homeCollectionView.reloadDataInMainQueue()
              }
    }
    var getFootbaalData = [GetMatchDetails]()
    {
        didSet{
                  homeCollectionView.reloadDataInMainQueue()
              }
    }
    
    
    
    var getMatch:JSON!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    var matchKey:String?
    
    
  
    func configureBankData() {
        
        UserDefaults.standard.set(bankDetailsArray?.accno, forKey: kBankAccountNo)
        
        
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
       
       
    func configureUserFullData() {

        UserDefaults.standard.set(userDetail?.email, forKey: kEmailId)
              UserDefaults.standard.set(userDetail?.mobile, forKey: kMobileNumber)
        UserDefaults.standard.set(userDetail?.refercode, forKey: kReferCode)
       
        if let teamName = userDetail?.team {
                   if teamName == "" {
                       openViewController(controller: UpdateTeamNameViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                        vc.deleegate = self
                           vc.teamNameClouser = {[weak self] name in
                               if let _ = self {
                                   UserDefaults.standard.set(name, forKey: kTeamName)
                               }
                           }
                       }
                   } else {
                  
                       UserDefaults.standard.set(teamName, forKey: kTeamName)
                   }
               } else {
                   openViewController(controller: UpdateTeamNameViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                       
                   }
               }
    }
    
    var panDetailsArray: PanDetailResponse? {
        didSet {
            configurePanData()
        }
    }
    var bankDetailsArray:BankDetailResponses? {
        didSet {
            configureBankData()
        }
    }
    func configurePanData() {
        
        UserDefaults.standard.set(panDetailsArray?.pannumber, forKey: kPanCardNo)
        
    }
    
    

     override func viewDidLoad() {
           super.viewDidLoad()

           getCricketDaata()
           getUserProfileData()
           getBankDetails()
           getPanDetails()
                       
           self.navigationController?.navigationBar.isTranslucent = false
           navigationController?.navigationBar.barTintColor = UIColor.FlatColor.Black.balckcolor
//           navigationUI.backgroundColor =  UIColor.FlatColor.Black.balckcolor
           navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
       }
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.statusBarStyle = .lightContent
        registerCell()
          fetchAccountData()
      getBannerData()
        if getCricketData.count == 0 {
            getCricketDaata()
        }
           
           setNeedsStatusBarAppearanceUpdate()
       }
    
    @IBAction func cricketBtnAction(_ sender: Any) {
//        getCricketDaata()
        cricketOutlt.provideVisualFeedback(cricketOutlt)
        homeCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionViewbase(index: 0)
        
        
        
    }
    @IBAction func kabaddiBtnAction(_ sender: Any) {
//        kabaddiOutlt.flash()
        getKabaddiResponse()
        kabaddiOutlt.provideVisualFeedback(kabaddiOutlt)
        homeCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionViewbase(index: 1)
    }
    
    @IBAction func footballBottonACtion(_ sender: Any) {
//        footballOutlt.flash()
       
        footballOutlt.provideVisualFeedback(footballOutlt)
        homeCollectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionViewbase(index: 2)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        openViewController(controller: NotificationViewController.self, storyBoard: .homeStoryBoard) { (vc) in
          
        }

    }
    fileprivate func setContestData() {
        
        
    }
    
    var visibleCellIndex = 0 {
        didSet {
            moveSelectionViewbase(index: visibleCellIndex)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
       func getCricketDaata() {
           
           self.showActivityIndicator(sMessage: "..Loading")
//           cricketOutlt.setTitleColor(UIColor.black, for: .normal)
                let headers = [
                         "Content-Type": "application/json",
                         "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYuZmFudGFzeXBvd2VyMTEuY29tXC9uZXdfYXBpXC9mcDExXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg3NTU5Nzg2LCJleHAiOjE1ODc2NDYxODYsIm5iZiI6MTU4NzU1OTc4NiwianRpIjoibGVCRm1jV1FjQ3B5TGJBaSIsInN1YiI6OTkxMTcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.mRtYmTgwyZDJApSar19QXI1x1EAiPiww-vSr3QBrh-U",
                         "Accept": "application/json",
                         "cache-control": "no-cache"
                     ]
           
           
           if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
               
               let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
               let params = ["user_id":UserDic.value(forKey: "user_id"),
                             "sport_key":"CRICKET"]
            NetworkManager.post_Request2(urlService: kgetMatchList, param: params as [String : Any], head: headers)  { (response) in
                           self.hideActivityIndicator()
            
                   guard let data = response else { return }
                   do{
                       let json = try JSON(data:data as! Data)
                       let results = json["result"]
                       self.getCricketData.removeAll()
                       for arr in results.arrayValue{
                           
                           self.getCricketData.append(GetMatchDetails(json: arr))
                           
                       }
                    self.homeCollectionView.reloadDataInMainQueue()
                   }catch{
                    Loader.showAlert(message: "Internal Error")
                   }
               }
           }
       }
             
       
    
    func getKabaddiResponse() {
       
        self.showActivityIndicator(sMessage: "..Loading")
//        cricketOutlt.setTitleColor(UIColor.black, for: .normal)
        let headers = [
                      "Content-Type": "application/json",
                      "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYuZmFudGFzeXBvd2VyMTEuY29tXC9uZXdfYXBpXC9mcDExXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg3NTU5Nzg2LCJleHAiOjE1ODc2NDYxODYsIm5iZiI6MTU4NzU1OTc4NiwianRpIjoibGVCRm1jV1FjQ3B5TGJBaSIsInN1YiI6OTkxMTcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.mRtYmTgwyZDJApSar19QXI1x1EAiPiww-vSr3QBrh-U",
                      "Accept": "application/json",
                      "cache-control": "no-cache"
                  ]
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameter = ["user_id":UserDic.value(forKey: "user_id") ,
                         "sport_key":"KABADDI"]
              NetworkManager.post_Request2(urlService: kgetMatchList, param: parameter, head: headers)  { (response) in
                self.hideActivityIndicator()
                guard let data = response else { return }
                do{
                    let json = try JSON(data:data as! Data)
                    let results = json["result"]
                    self.getKabaddiData.removeAll()
                    for arr in results.arrayValue{
                        self.getKabaddiData.append(GetMatchDetails(json: arr))
                    }
                    self.homeCollectionView.reloadDataInMainQueue()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    
          
    }
    func getFootbaalResponse() {
        
        self.showActivityIndicator(sMessage: "..Loading")
//        cricketOutlt.setTitleColor(UIColor.black, for: .normal)
        let headers =
                     [ "Content-Type": "application/json",
                      "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYuZmFudGFzeXBvd2VyMTEuY29tXC9uZXdfYXBpXC9mcDExXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg3NTU5Nzg2LCJleHAiOjE1ODc2NDYxODYsIm5iZiI6MTU4NzU1OTc4NiwianRpIjoibGVCRm1jV1FjQ3B5TGJBaSIsInN1YiI6OTkxMTcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.mRtYmTgwyZDJApSar19QXI1x1EAiPiww-vSr3QBrh-U",
                      "cache-control": "no-cache"
                  ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["user_id":UserDic.value(forKey: "user_id"),
                          "sport_key":"FOOTBALL"]
            NetworkManager.post_Request2(urlService: kgetMatchList, param: param as [String : Any], head: headers) { response in
                self.hideActivityIndicator()
                do {
                if response !=  nil {
                    let json = try JSON(data: response as! Data)
                    let result = json["result"]
                    self.getFootbaalData.removeAll()
                    for arr in result.arrayValue{
                        
                        self.getFootbaalData.append(GetMatchDetails(json: arr))
                        
                    }
                    self.homeCollectionView.reloadDataInMainQueue()
                }
                }catch {
                    Loader.showAlert(message: "InternalError")
                }
            }
    }
    }
       func getUserProfileData() {
               if Connectivity.isConnectedToInternet {
                   showActivityIndicator(sMessage: "Loading...")
                   let headers = [
                       "content-type": "application/x-www-form-urlencoded",
                       "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYuZmFudGFzeXBvd2VyMTEuY29tXC9uZXdfYXBpXC9mcDExXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg3NDY4MzcyLCJleHAiOjE1ODc0NzE5NzIsIm5iZiI6MTU4NzQ2ODM3MiwianRpIjoiVm9yNVhMOHZXd3hUSzFvdCIsInN1YiI6OTkxMTcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.Ceh0HxBV_DIRFa_ePcw1YQlSkFfcjC8IXox0xR9gAwo",
                       "Accept": "application/json",
                       "cache-control": "no-cache"
                   ]
                   if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                       
                       let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                       let parameters = ["user_id": UserDic.value(forKey: "user_id")]
                       guard let urlString = URL(string: kBASE_URL + kUserDetailsURL) else {
                           
                           return
                       }
                       Alamofire.request(urlString, method: .post, parameters: parameters as Parameters, encoding: URLEncoding.default, headers: headers).responseJSON{ response in
                           self.hideActivityIndicator()
                           let json = response.result.value as? NSDictionary
                           let dataResponse = response.data 
                           if json != nil{
                               let json : NSDictionary = response.result.value as? NSDictionary ?? [:]
                               do {
                                   let jsonResponse = try JSON(data:dataResponse!)
       //                            let status = jsonResponse["status"]
                                   let jsonResult = jsonResponse["result"]
                                   let jsonValue = jsonResult["value"]
                                   self.userDetail = UserDetailsResponse(userJson: jsonValue)
                                   
                               }
                               catch {
                                   
                               }
                                print(json)
                               let status = json.value(forKey: "status") as? Int ?? 0
                               let message = json.value(forKey: "message") as? String ?? ""
                               let result = json.value(forKey: "result") as?  NSDictionary ?? [:]
                               if status == 1 { // for Success
                                   
                                   
                                   
                                   // Saved Registered User Data
                                   let UserDataDic = result.value(forKey: "value") as? NSDictionary ?? [:]
                                   UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: UserDataDic), forKey: "UserDetail")
                                   
                                   // Get Login User Data
                                   
                               }
                               else {
                                   Loader.showAlert(message: message)
                               }
                           }
                       }
                   }
               }
               else {
                   Loader.showAlert(message: "No Internet Connection")
               }
           }
           
               func getBankDetails() {
                   showActivityIndicator(sMessage: "Loading...")
                   let headers = [
                       "content-type": "application/x-www-form-urlencoded",
                       "cache-control": "no-cache"
                   ]
                   if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                       
                       let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                       let parameters = ["user_id": UserDic.value(forKey: "user_id")]
                       
                       NetworkManager.post_Request(urlService: kBankDetailsURL, param: parameters as [String : Any], head: headers) { (response) in
                           self.hideActivityIndicator()
                           do {
                               if response != nil {
                                  let jsonResponse = try JSON(data: response as! Data)
                                let status = jsonResponse["status"].intValue
                                if status == 1 {
                                let result = jsonResponse["result"]
                                self.bankDetailsArray = BankDetailResponses(json: result)
//                                   self.bankDetailsArray = responseModel
                               }
                            }
                           } catch {
                               Loader.showAlert(message: "Status code 500: server internal error")
                           }
                       }
                   }
                   
               }
               
               func getPanDetails() {
                   showActivityIndicator(sMessage: "Loading...")
                   let headers = [
                       "content-type": "application/x-www-form-urlencoded",
                       "cache-control": "no-cache"
                   ]
                   if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                       
                       let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                       let parameters = ["user_id": UserDic.value(forKey: "user_id")]
                       
                       NetworkManager.post_Request3(urlService: kPanDetailsURL, param: parameters as [String : Any], head: headers) { (response) in
                           self.hideActivityIndicator()
                           do {
                               if response != nil {
                                   let responseData = try JSONSerialization.data(withJSONObject: response!, options: [])
                                   let responseModel = try JSONDecoder().decode(PanDetailResponse.self, from: responseData)
                                   self.panDetailsArray = responseModel
                               }
                           } catch {
                               Loader.showAlert(message: "Status code 500: server internal error")
                           }
                       }
                   }
               }
               
    
    
    fileprivate func getBannerData() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache"
            ]
        NetworkManager.post_Request2(urlService: kBanner_URL, param: nil, head: headers) { (response) in
            self.hideActivityIndicator()
            do {
                if response != nil {
                    let jsonResponse = try JSON(data:response as! Data)
                    let result = jsonResponse["result"]
                    self.bannerDataArray.removeAll()
                    for arr in result.arrayValue {
                        self.bannerDataArray.append(BannerResponses(json:arr))
                    }
                }
                    else {
                        Loader.showAlert(message: "Unable to get Banner data")
                    }
                }
            catch {
                Loader.showAlert(message: "Status code 500: server internal error")
            }
        }
    }
    
    fileprivate func moveSelectionViewbase(index: Int) {
        let selectionViewWidth = Int(ScreenSize.SCREEN_WIDTH / 3)
        switch index {
        //Live
        case 0:
            getCricketDaata()
            kabaddiOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            footballOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
                self.selectionView.frame = CGRect(x: 28, y: 35, width: 70, height: 5)
                self.cricketOutlt.setTitleColor(.black, for: .normal)
            }
        //upcoming
        case 1:
            getKabaddiResponse()
            cricketOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            footballOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
                self.selectionView.frame = CGRect(x:  (28 + (selectionViewWidth * index)) , y: 35, width: 70, height: 5)
                self.kabaddiOutlt.setTitleColor(.black, for: .normal)
            }
        //Result
        case 2:
             getFootbaalResponse()
            cricketOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            kabaddiOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
                self.selectionView.frame = CGRect(x:(28 + (selectionViewWidth * index))  , y: 35, width: 70, height: 5)
                self.footballOutlt.setTitleColor(.black, for: .normal)
            }
        default:
            break
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        visibleCellIndex = Utility.findCenterCellIndex(collectionView: homeCollectionView)
        
    }
    /*// MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func registerCell() {
            atableView.register(UINib(nibName: BannerTVCell.identifier(), bundle: nil), forCellReuseIdentifier: BannerTVCell.identifier())
        homeCollectionView.register(UINib(nibName: HomeVCCollectionCEll.identifier(), bundle: nil), forCellWithReuseIdentifier: HomeVCCollectionCEll.identifier())
    }
    
    
     
        
        
        func openReferViewController(url:String){
          
           let myUrl = url
            if let url = URL(string:myUrl) {

//           if let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }

        
    }
    
}
    

extension MainHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
      
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCollectionCEll.identifier(), for: indexPath) as! HomeVCCollectionCEll
      
      
        
        cell.contestData.removeAll()
        cell.delegate = self
        switch indexPath.item {
       
         case 0:
            cell.matchType = .cricket
              cell.contestData.removeAll()
                  if getCricketData.count > 0 {
                      cell.contestData = getCricketData
                      cell.showNoDataLabel(show: false, text: "")
                  } else {
                      cell.showNoDataLabel(show: true, text: "No Upcomming Match Found")
                  }
              
          //live
          case 1:
            cell.matchType = .kabaddi
                cell.contestKabaddiData.removeAll()
              
                  if getKabaddiData.count > 0 {
                      cell.contestKabaddiData = getKabaddiData
                      cell.showNoDataLabel(show: false, text: "")
                  } else {
                      cell.showNoDataLabel(show: true, text: "No Live Match Found")
                  }
              
          //result
          case 2:
              cell.matchType = .football
                cell.contestFootballData.removeAll()
                  if getFootbaalData.count > 0 {
                      cell.contestFootballData = getFootbaalData
                      cell.showNoDataLabel(show: false, text: "")
                  } else {
                      cell.showNoDataLabel(show: true, text: "No Finished Match Found")
                  
              }
          default:
              break
          }
        cell.itematIndex = indexPath.item
        return cell
        
    }
    public func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: homeCollectionView.frame.width, height: homeCollectionView.frame.height)
        
        
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
extension MainHomeViewController :typeOfMatch {
    func sendgetMatchDetail(contstData: GetMatchDetails, matchType: String) {
        openChallengeViewController(contest: contstData, match: matchType)
    }
    func openChallengeViewController(contest: GetMatchDetails,match:String) {
                   openViewController(controller: LeagueCollectionViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                       vc.getContestDetail = contest 
                    vc.matchTYPES = match
                       // vc.homeType = homeType
                   }
               }
    func openReferViewController(){
         openViewController(controller: ReferAndEarnViewController.self, storyBoard: .moreStoryBoard) { (vc) in
            
    }
    
}
}
extension MainHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTVCell.identifier(), for: indexPath) as! BannerTVCell
            cell.bannerArr = bannerDataArray
           
        
       cell.bannerSelection =  {[weak self] val in
                  if let strongSelf = self {
                      strongSelf.openReferViewController(url: val)
                      
                  }
    }
         return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
            return kBannerTVCellIHeight
       
        
    }

}
extension MainHomeViewController:hitBannerData {
    func check(check: Bool) {
        updateTeam = check
    }
    
    
}
