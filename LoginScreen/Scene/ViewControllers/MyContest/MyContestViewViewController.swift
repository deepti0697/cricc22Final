//
//  MyContestViewController.swift
//  DreamTeam
//
//  Created by Test on 13/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class MyContestViewViewController: BaseClass {
    
    @IBOutlet weak var walletButtonOutlt: UIButton!
    //    @IBOutlet weak var seelctionView1: UIView!
//    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var liveBtnOutlet: UIButton!
    @IBOutlet weak var upcomingMatchbtnOutlt: UIButton!
    @IBOutlet weak var finishedMatchBtnOutlet: UIButton!
    @IBOutlet weak var colctnView: UICollectionView!
    @IBOutlet weak var football: UIButton!
    @IBOutlet weak var kabbadi: UIButton!
    @IBOutlet weak var cricket: UIButton!
    var matchType = "CRICKET"
    var getTeamResponse = [MyTeamResponses]()
    var getContestDetail:GetMatchDetails?
    var matchKey:String?
    var fromBack = false
    var myjoinedContestdata = [myjoinedContest]()
    var fixtureData =  [MyContestLiveLeagues]()
    var liveData =  [MyContestLiveLeagues]()
    var resultData = [MyContestLiveLeagues]()
    var cricketData = [MyContestLiveLeagues]() 
    var kabaddiData  = [MyContestLiveLeagues]()
    var footballData = [MyContestLiveLeagues]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        walletButtonOutlt.imageView?.tintColor = .white
       
    }
    override func viewWillAppear(_ animated: Bool) {
//        self.addNavigationBar(navigationTitle: "My Contest", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: false, isWalletButtonShow: true, isBinButtonShow: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if !fromBack {
            getCricketdata()
            setContestData()
        }
        //       moveSelectionViewbase(index: 0)
        //        moveSelectionView(index:0)
        
        
        registerCell()
        //                colctnView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        //                moveSelectionView(index:0)
        //
    }
    override func handleBackButtonAction() {
        //        self.prepare(for: "Home", sender: nil)
        self.performSegue(withIdentifier: "Home", sender: nil)
    }
    
    @IBAction func walletButtonAction(_ sender: Any) {
   openViewController(controller: AccountCollectinViewController.self, storyBoard: .accountStoryBoard) { (vc) in
         }
    }
    override func handleWalletButtonAction() {
        openViewController(controller: AccountCollectinViewController.self, storyBoard: .accountStoryBoard) { (vc) in
        }
    }
    fileprivate func setContestData() {
        if let contest = getContestDetail{
            matchKey = contest.matchkey ?? ""
            getMyTeamResponse()
        }
        
    }
    
    var visibleCellIndex = 0 {
        didSet {
            moveSelectionView(index: visibleCellIndex)
        }
    }
    @IBAction func liveBtnData(_ sender: Any) {
        colctnView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index:1)
    }
    
    
    
    @IBAction func finishedMatch(_ sender: Any) {
        colctnView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index: 2)
        
    }
    
    @IBAction func mywallet(_ sender: Any) {
    }
    @IBAction func backtoHome(_ sender: Any) {
    }
    
    @IBAction func upcomingMatch(_ sender: Any) {
        colctnView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index: 0)
    }
    func setup(cricket:[MyContestLiveLeagues]){
        fixtureData.removeAll()
        liveData.removeAll()
        resultData.removeAll()
        for model in cricket {
            if model.match_status_key == "2" {
                fixtureData.append(model)
                
            }
            else if model.match_status_key == "1" {
                liveData.append(model)
                
            }
            else if model.match_status_key == "3" {
                resultData.append(model)
                
                
            }
        }
        colctnView.reloadDataInMainQueue()
    }
    func setup3(football:[MyContestLiveLeagues]){
        fixtureData.removeAll()
        liveData.removeAll()
        resultData.removeAll()
        for model in football {
            if model.match_status_key == "1" {
                fixtureData.append(model)
                
            }
            else if model.match_status_key == "2" {
                liveData.append(model)
                
            }
            else if model.match_status_key == "3" {
                resultData.append(model)
                
                
            }
            
        }
        colctnView.reloadDataInMainQueue()
    }
    func setup2(kabaddi:[MyContestLiveLeagues]){
        fixtureData.removeAll()
        liveData.removeAll()
        resultData.removeAll()
        for model in kabaddi {
            if model.match_status_key == "1" {
                fixtureData.append(model)
                
            }
            else if model.match_status_key == "2" {
                liveData.append(model)
                
            }
            else if model.match_status_key == "3" {
                resultData.append(model)
                
                
            }
        }
        colctnView.reloadDataInMainQueue()
    }
    fileprivate func moveSelectionView(index: Int) {
//        let selectionViewWidth = Int(ScreenSize.SCREEN_WIDTH / 3)
        switch index {
        //Live
        case 0:
            liveBtnOutlet.borderColor = UIColor(red: 219, green: 223, blue: 234)
            finishedMatchBtnOutlet.borderColor = UIColor(red: 219, green: 223, blue: 234)
            liveBtnOutlet.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            liveBtnOutlet.backgroundColor = .clear
            finishedMatchBtnOutlet.backgroundColor = .clear
            finishedMatchBtnOutlet.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.selectionView.frame = CGRect(x: 0, y: 35, width: selectionViewWidth, height: 5)
                self.upcomingMatchbtnOutlt.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                self.upcomingMatchbtnOutlt.borderColor = .clear
                self.upcomingMatchbtnOutlt.setTitleColor(.black, for: .normal)
            }
        //upcoming
        case 1:
            finishedMatchBtnOutlet.borderColor = UIColor(red: 219, green: 223, blue: 234)
                       upcomingMatchbtnOutlt.borderColor = UIColor(red: 219, green: 223, blue: 234)
            upcomingMatchbtnOutlt.backgroundColor = .clear
            finishedMatchBtnOutlet.backgroundColor = .clear
            upcomingMatchbtnOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            finishedMatchBtnOutlet.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.selectionView.frame = CGRect(x: selectionViewWidth, y: 35, width: selectionViewWidth, height: 5)
                self.liveBtnOutlet.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    self.liveBtnOutlet.borderColor = .clear
                self.liveBtnOutlet.setTitleColor(.black, for: .normal)
            }
        //Result
        case 2:
            liveBtnOutlet.borderColor = UIColor(red: 219, green: 223, blue: 234)
                                  upcomingMatchbtnOutlt.borderColor = UIColor(red: 219, green: 223, blue: 234)
            upcomingMatchbtnOutlt.backgroundColor = .clear
                      liveBtnOutlet.backgroundColor = .clear
            liveBtnOutlet.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            upcomingMatchbtnOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.selectionView.frame = CGRect(x: selectionViewWidth * index, y: 35, width: selectionViewWidth, height: 5)
                self.finishedMatchBtnOutlet.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                                   self.finishedMatchBtnOutlet.borderColor = .clear
                self.finishedMatchBtnOutlet.setTitleColor(.black, for: .normal)
            }
        default:
            break
        }
    }
    
    fileprivate func moveSelectionViewbase(index: Int) {
        let selectionViewWidth = Int(ScreenSize.SCREEN_WIDTH / 3)
        switch index {
        //Live
        case 0:
            kabbadi.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            football.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.seelctionView1.frame = CGRect(x: 30, y: 40, width: 65, height: 5)
                self.cricket.setTitleColor(UIColor(red: 251, green: 199, blue: 29), for: .normal)
            }
        //upcoming
        case 1:
            cricket.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            football.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.seelctionView1.frame = CGRect(x: selectionViewWidth + 30, y: 40, width: 65, height: 5)
                self.kabbadi.setTitleColor(UIColor(red: 251, green: 199, blue: 29), for: .normal)
            }
        //Result
        case 2:
            cricket.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            kabbadi.setTitleColor(UIColor(red: 130, green: 130, blue: 130), for: .normal)
            UIView.animate(withDuration: 0.2) {
//                self.seelctionView1.frame = CGRect(x: (selectionViewWidth + 15)  * index, y: 40, width: 65, height: 5)
                self.football.setTitleColor(UIColor(red: 251, green: 199, blue: 29), for: .normal)
            }
        default:
            break
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        visibleCellIndex = Utility.findCenterCellIndex(collectionView: colctnView)
        
    }
    /*// MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func registerCell() {
        colctnView.register(UINib(nibName: MyContestCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: MyContestCollectionViewCell.identifier())
    }
    func getCricketdata() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NjU1MjM1OSwiZXhwIjoxNTY2NTU1OTU5LCJuYmYiOjE1NjY1NTIzNTksImp0aSI6IlhxUUNYOGIwM0RBaFdnRnMiLCJzdWIiOjEzMywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.zZdFnC5_ntXsk_VUXrCoLe_Wj9y1-xlRRwHP0i_wkP4",
            "Accept": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? "1",
                              "sport_key":"CRICKET"] as [String : Any]
            
            NetworkManager.post_Request(urlService: getAllMatches, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let convertJson = try JSON(data:response as! Data)
                        self.cricketData.removeAll()
                        self.kabaddiData.removeAll()
                        self.footballData.removeAll()
                        let result = convertJson["result"]
                        for arr in result.arrayValue{
                            self.cricketData.append(MyContestLiveLeagues(joinLeagueJSON:arr))
                        }
                        
                        self.setup(cricket: self.cricketData)
                        
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
        
    }
    
    func getKabbaddiData() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NjU1MjM1OSwiZXhwIjoxNTY2NTU1OTU5LCJuYmYiOjE1NjY1NTIzNTksImp0aSI6IlhxUUNYOGIwM0RBaFdnRnMiLCJzdWIiOjEzMywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.zZdFnC5_ntXsk_VUXrCoLe_Wj9y1-xlRRwHP0i_wkP4",
            "Accept": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? "",
                              "sport_key":"KABADDI"] as [String : Any]
            
            NetworkManager.post_Request(urlService: getAllMatches, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let convertJson = try JSON(data:response as! Data)
                        let result = convertJson["result"]
                        self.kabaddiData.removeAll()
                        self.cricketData.removeAll()
                        self.footballData.removeAll()
                        for arr in result.arrayValue{
                            self.kabaddiData.append(MyContestLiveLeagues(joinLeagueJSON:arr))
                        }
                        self.setup(cricket: self.kabaddiData)
                        DispatchQueue.main.async {
                            self.colctnView.reloadDataInMainQueue()
                        }
                        
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
        
    }
    func getFotballData() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NjU1MjM1OSwiZXhwIjoxNTY2NTU1OTU5LCJuYmYiOjE1NjY1NTIzNTksImp0aSI6IlhxUUNYOGIwM0RBaFdnRnMiLCJzdWIiOjEzMywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.zZdFnC5_ntXsk_VUXrCoLe_Wj9y1-xlRRwHP0i_wkP4",
            "Accept": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? -1,
                              "sport_key":"FOOTBALL"] as [String : Any]
            
            NetworkManager.post_Request(urlService: getAllMatches, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let convertJson = try JSON(data:response as! Data)
                        let result = convertJson["result"]
                        self.footballData.removeAll()
                        self.kabaddiData.removeAll()
                        self.cricketData.removeAll()
                        self.footballData.removeAll()
                        for arr in result.arrayValue{
                            self.footballData.append(MyContestLiveLeagues(joinLeagueJSON:arr))
                        }
                        
                        self.setup(cricket: self.footballData)
                        DispatchQueue.main.async {
                            self.colctnView.reloadDataInMainQueue()
                        }
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
    }
    
    @IBAction func cricketAction(_ sender: Any) {
        getCricketdata()
        matchType = "CRICKET"
        moveSelectionViewbase(index: 0)
        moveSelectionView(index: 0)
        colctnView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func KabaddiAction(_ sender: Any) {
        getKabbaddiData()
        matchType = "KABADDI"
        moveSelectionViewbase(index: 1)
        moveSelectionView(index: 0)
        colctnView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func footballaction(_ sender: Any) {
        getFotballData()
        matchType = "FOOTBALL"
        moveSelectionViewbase(index: 2)
        moveSelectionView(index: 0)
        colctnView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func selectedContestAction(contest: MyContestLiveLeagues, homeType: HomeType) {
        switch homeType {
        case .upcomming:
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
                self.openContestViewController(contest: contest, TypeofMatch: self.matchType)
            }
        default:
            openChallengeViewController(contest: contest, homeType: homeType,typeofMatch:self.matchType)
        }
    }
    
    func openChallengeViewController(contest: MyContestLiveLeagues, homeType: HomeType,typeofMatch:String) {
        openViewController(controller: MyChallengeViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            vc.contestData = contest
            vc.homeType = homeType
            vc.delegat = self
            vc.MatchType = typeofMatch
        }
    }
    fileprivate func getMyContest() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = ["Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NzE1NTIyMiwiZXhwIjoxNTY3MTU4ODIyLCJuYmYiOjE1NjcxNTUyMjIsImp0aSI6Ilg2NDhIR2dOYmZhZ3Mwa0wiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.-uUAhweU3nTAiUVByqC_fEq7XOnaPkQecF3VVDbNdYQ",
                       "Content-Type":"application/json",
                       "Accept":"application/json",
                       "cache-control": "no-cache"]
        
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["user_id":UserDic.value(forKey: "user_id"),
                         "matchkey":matchKey,
                         "showLeaderBoard":"false"
                ,"sport_key":"CRICKET"]
            NetworkManager.post_Request2(urlService: kMyJoinedLeagueURL, param: param as [String : Any], head: headers) {
                (response) in
                
                
                
                self.hideActivityIndicator()
                
                do{
                    let json = try JSON(data:response as! Data)
                    //                 let list = MyCatagries(json: json)
                    
                    let results = json["result"]
                    let cat = results["contest"]
                    //
                    
                    for arr in cat.arrayValue{
                        self.myjoinedContestdata.append(myjoinedContest(json:arr))
                        
                        
                    }
                    
                    
                }
                    
                    
                    
                catch{
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
    fileprivate func getMyTeamResponse() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = ["Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTQzODcxMCwiZXhwIjoxNTY1NDQyMzEwLCJuYmYiOjE1NjU0Mzg3MTAsImp0aSI6IkZEVGZKdTVIVW5PY0N0ZnIiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.MTioWiGu5-5Itkw8Y-1lh08iAcYAvQhsUcpbFoLLmMg",
                       "Content-Type": "application/json",
                       "Accept":"application/json"]
        
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["user_id":UserDic.value(forKey: "user_id"),
                         "matchkey":matchKey,
                         "sport_key":matchType]
            NetworkManager.post_Request2(urlService: kMyTeamURL, param: param as [String : Any], head: headers) {
                (response) in
                
                
                
                self.hideActivityIndicator()
                
                do{
                    let json = try JSON(data:response as! Data)
                    //                 let list = MyCatagries(json: json)
                    
                    let results = json["result"]
                    let cat = results["teams"]
                    //
                    self.getTeamResponse.removeAll()
                    for arr in cat.arrayValue{
                        self.getTeamResponse.append(MyTeamResponses(json:arr))
                        
                        
                    }
                }
                    
                    
                    
                catch{
                    self.view.makeToast(message: "Internal Error")
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
    
    
    func openContestViewController(contest: MyContestLiveLeagues,TypeofMatch:String) {
        openViewController(controller: JoinedContestViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            vc.myJoinedLeagueData = self.myjoinedContestdata
            vc.contestData = contest
            vc.matchKey = contest.matchkey ?? ""
            vc.mactchType = TypeofMatch
            vc.getTeamResponse = self.getTeamResponse
            vc.hometype = .upcomming
            vc.delegate = self
            
        }
    }
    
}
extension MyContestViewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyContestCollectionViewCell.identifier(), for: indexPath) as! MyContestCollectionViewCell
        cell.contestData.removeAll()
        switch indexPath.item {
            //upcoming
            
        case 0:
            cell.homeType = .upcomming
            cell.contestData.removeAll()
            if fixtureData.count > 0 {
                cell.contestData = fixtureData
                cell.showNoDataLabel(show: false, text: "", image: UIImage())
            } else {
                cell.showNoDataLabel(show: true, text: "There are no Matches as of now", image: #imageLiteral(resourceName: "no-match"))
            }
            
        //live
        case 1:
            cell.contestData.removeAll()
            cell.homeType = .live
            if liveData.count > 0 {
                cell.contestData = liveData
                cell.showNoDataLabel(show: false, text: "", image: UIImage())
            } else {
                cell.showNoDataLabel(show: true, text: "There are no Matches as of now", image: #imageLiteral(resourceName: "no-match"))
            }
            
        //result
        case 2:
            cell.homeType = .result
            cell.contestData.removeAll()
            if resultData.count > 0 {
                cell.contestData = resultData
                cell.showNoDataLabel(show: false, text: "", image: UIImage())
            } else {
                cell.showNoDataLabel(show: true, text: "There are no Matches as of now", image: #imageLiteral(resourceName: "no-match"))
                
            }
        default:
            break
        }
        cell.selectedContest = { [weak self] contest,homeType  in
            if let strongSelf = self {
                
                strongSelf.matchKey = contest.matchkey ?? ""
                strongSelf.selectedContestAction(contest: contest, homeType: homeType)
            }
        }
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
extension MyContestViewViewController:gotBacktoMyContest,goBackToMyContestFromChallenge {
    func checkBoolType(check: Bool) {
        fromBack = check
    }
    
    func checkCondition(check: Bool) {
        fromBack = check
    }
    
    
}
