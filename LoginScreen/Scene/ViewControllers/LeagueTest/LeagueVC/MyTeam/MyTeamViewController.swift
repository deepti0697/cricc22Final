//
//  MyTeamViewController.swift
//  Club11
//
//  Created by Developer on 28/05/19.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftToast
class MyTeamViewController: BaseClass {
  
     var msgResp = [TeamUpdateMessageResponses]()
    @IBOutlet weak var aContainerView: UIView!
//    @IBOutlet weak var aCreateTeamButton: UIButton!
    @IBOutlet weak var joinedTeam: UIButton!
    var confirmationView: ConfirmationView?
      var joinID :Int?
    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet weak var createTeamVC: UIButton!
    @IBOutlet weak var aCreateTeamButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var createNewTeam: UIButton!
     var swtichTeam = false
    var teamSelectionClousure: ((Int, Int) -> Void) = { _, _ in }
    var assignteamId = 0
    var teamNmbr = 0
    var fromEditButn = false
    var fromCloneButton = false
    var myBalanceDataArray = [BalanceModel]()
    var usableBlc = [userUsableBlc]()
    var refreshControl = UIRefreshControl()
    var challengeid:Int?
    var enteryFees:Double?
    var matchType = ""
    var storeJoinedLEague = [JoinLeagueResp]()
    var contestLiveDatas:MyContestLiveLeagues?
    var contestData: GetMatchDetails?
    var matchKey = ""
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var myTeamsData = [MyTeamResponses]() {
        didSet {
            if aTableView != nil {
                if myTeamsData.count >= 16 {
                                   createTeamVC.isHidden = true
                               }
                               else {
                                   createTeamVC.isHidden = false
                               }
                aTableView.reloadDataInMainQueue()
            }
        }
    }
    
   
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        aTableView.register(UINib(nibName: SelectMultipleTeamTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: SelectMultipleTeamTableViewCell.identifier())
        setCornerRadius()
        fetchAccountData()
        fetchAccountUsableData()
        addPullToRefresh()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
                       if controller.isKind(of: LeagueCollectionViewController.self) {
                           
                           self.navigationController!.popToViewController(controller, animated: true)
                            break
                       }
                           if controller.isKind(of: ContestDetailVCViewController.self) {
                                self.navigationController!.popToViewController(controller, animated: true)
                                break
                           }
                    
                   }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        addNavigationBar(navigationTitle: "Contest", titleContentMode: .left, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setContestData()
        aTableView.allowsMultipleSelection = false
        myTeamsData.removeAll()
        getTeam()
        
        joinedTeam.isEnabled = false
        showHideCreateButton()
       
    }
    
    @IBAction func openJoinedConfirmationView(_ sender: Any) {
        if swtichTeam {
            updateTeam()
        }
        else {
        openConfirmationView(entryFee: self.enteryFees ?? 0.0, challengeID: self.challengeid ?? 0)
    }
    }
    fileprivate func updateTeam() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = ["Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDIyMTE0NiwiZXhwIjoxNTY0MjI0NzQ2LCJuYmYiOjE1NjQyMjExNDYsImp0aSI6IkFKYm5tdVpkb0VaVko3U2IiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.KSMUhnvzM2OmfgvhY_rOrt-cut2yW1IksR0PAZ3rgcY",
                       "Content-Type": "application/json",
                       "Accept":"application/json"]
        
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["userid":UserDic.value(forKey: "user_id"),
                         "matchkey":matchKey,
                         "sport_key":matchType,
                         "challenge_id":challengeid,"teamid":assignteamId,"joinid":joinID ]
            NetworkManager.post_Request2(urlService: kupdateTeam, param: param as [String : Any], head: headers) {
                (response) in
                self.hideActivityIndicator()
               
                do{
                    let json = try JSON(data:response as! Data)
                    //                 let list = MyCatagries(json: json)
                    
                    let results = json["result"]
                   
                    for i in results.arrayValue {
                        self.msgResp.append(TeamUpdateMessageResponses(json:i))
                    }
                    
                    if self.msgResp[0].status == 1 {
                        
                        Loader.showToast(message:self.msgResp[0].msg ?? "Team Updated SuccessFully"  , onView: self.view, bottomMargin: 30 , color: UIColor(red: 49, green: 139, blue: 22))
                    }
                    else {
                       Loader.showToast(message:self.msgResp[0].msg ?? "Error"  , onView: self.view, bottomMargin: 30 , color: UIColor(red: 49, green: 139, blue: 22))
                    }
                      self.navigationController?.popViewController(animated: true)
                    //
                    

                }
                    
                catch{
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
    fileprivate func setCornerRadius() {
        //aTimerContainerView.setCornerRadius(value: 5)
    }
    
    func checkjoinBtnSelection() {
        if assignteamId != 0 {
            joinedTeam.isEnabled = true
            joinedTeam.backgroundColor = UIColor(red: 253, green: 185, blue: 50)
            joinedTeam.setTitleColor(.black, for: .normal)
        }
    }
    
    func addPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshData(sender:)), for: .valueChanged)
        aTableView.refreshControl = refreshControl
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
    func fetchAccountUsableData() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            
            "Content-Type": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id"),"challengeid":challengeid]
            NetworkManager.post_Request2(urlService: kUsableBalance, param: parameters as [String : Any], head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let json = try JSON(data:response as! Data)
                        let result = json["result"]
                        for arr in result.arrayValue {
                            self.usableBlc.append(userUsableBlc(json:arr))
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
    @objc func refreshData(sender:AnyObject) {
        //  getMyTeams()
        myTeamsData.removeAll()
        getTeam()
        
        showHideCreateButton()
        // aContainerView.isHidden = myTeamsData.count == 0 ? false : true
        aTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    fileprivate func setContestData() {
        if let data = contestData {
            self.matchKey = data.matchkey ?? ""
        }
    }
    
    fileprivate func setReleaseTime(releaseDateString: String) {
        
    }
    
    @objc func updateTime() {
        
    }
    fileprivate func getTeam() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = ["Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTQzODcxMCwiZXhwIjoxNTY1NDQyMzEwLCJuYmYiOjE1NjU0Mzg3MTAsImp0aSI6IkZEVGZKdTVIVW5PY0N0ZnIiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.MTioWiGu5-5Itkw8Y-1lh08iAcYAvQhsUcpbFoLLmMg",
                       "Content-Type": "application/json",
                       "Accept":"application/json"]
        
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["user_id":UserDic.value(forKey: "user_id"),
                         "matchkey":matchKey,
                         "sport_key":matchType,"challenge_id":challengeid]
            NetworkManager.post_Request2(urlService: kMyTeamURL, param: param as [String : Any], head: headers) {
                (response) in
                self.hideActivityIndicator()
               
                do{
                    let json = try JSON(data:response as! Data)
                    let results = json["result"]
                    let cat = results["teams"]
                    //
                    self.myTeamsData.removeAll()
                    for arr in cat.arrayValue{
                        self.myTeamsData.append(MyTeamResponses(json:arr))
                    }
                    DispatchQueue.main.async {
                        self.createTeamVC.setTitle("Create Team (\(self.myTeamsData.count + 1))", for: .normal)
                        self.aTableView.reloadData()
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
    fileprivate func viewCloseAction() {
        
        confirmationView?.removeFromSuperview()
        confirmationView = nil
    }
    
    func openConfirmationView(entryFee: Double, challengeID: Int) {
        if confirmationView == nil {
            confirmationView = Bundle.main.loadNibNamed("ConfirmationView", owner: self, options: nil)?.first as? ConfirmationView
            confirmationView?.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: ScreenSize.SCREEN_HEIGHT)
            APP_DEL.window?.addSubview(confirmationView!)
            //        confirmationView?.myTeamsData = teams
            confirmationView?.availableBalance = "\(myBalanceDataArray[0].winning ?? "0")"
            confirmationView?.usableBalance = "\(usableBlc[0].usablebalance ?? "0")"
            confirmationView?.entryFees = entryFee
            confirmationView?.closeButtonClouser = { [weak self] in
                if let strongSelf = self {
                    strongSelf.viewCloseAction()
                }
            }
            confirmationView?.joinButtonClouser = { [weak self] teamID in
                if let strongSelf = self {
                    strongSelf.joinedContesst()
                }
            }
            confirmationView?.termsConditionButtonClouser = { [weak self] in
                if let strongSelf = self {
                    strongSelf.viewCloseAction()
                    strongSelf.openTermsAndCondition()
                }
            }
        }
    }
    func openTermsAndCondition(){
        openViewController(controller: TermAndConditionViewController.self, storyBoard: .moreStoryBoard, handler: { (vc) in
            
        })
    }
    @IBAction func createTeamButtonAction(_ sender: UIButton) {
        if matchType == "CRICKET" {
               openCreateTeamVC()
        }
        else if matchType == "FOOTBALL" {
           openFootballTeamVC()
        }
        else {
            openKabaddiTeamVC()
        }
     
    }
    
    func joinedContesst(){
        let headers = ["Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDQ3OTkyMSwiZXhwIjoxNTY0NDgzNTIxLCJuYmYiOjE1NjQ0Nzk5MjEsImp0aSI6Im5rVWYzWTdxbEN4cXJxblUiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.NeYkRhFjw2_V63iL0nui_h-ytCtHaZch3y6iAmcLwmA",
                       "Content-Type":"application/json",
                       "Accept":"application/json"]
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = ["challengeid":challengeid,"teamid":assignteamId,"user_id":UserDic.value(forKey: "user_id"),"sport_key":matchType]
            NetworkManager.post_Request2(urlService: kContestJoined, param: param as [String : Any], head: headers) { (response) in
                do {
                   
                    let jsonData = try  JSON(data:response as! Data)
                    let status = jsonData["status"]
                    let message = jsonData["message"].stringValue
                    let result = jsonData["result"]
                    if status == 1 {
                        for arr in result.arrayValue {
                            self.storeJoinedLEague.append(JoinLeagueResp(json: arr))
                        }
                      
                                self.viewCloseAction()
                                for controller in self.navigationController!.viewControllers as Array {
                                    if controller.isKind(of: LeagueCollectionViewController.self) {
                                        
                                        
                                        self.navigationController!.popToViewController(controller, animated: true)
                                        break
                                    }
                                    Loader.showToast(message: self.storeJoinedLEague[0].message ?? "League Joined", onView: self.view, bottomMargin: 200, color: UIColor(red: 49, green: 139, blue: 29))
                                
                            }
                        
                    }
                    else {
                        if kInsufficientBalance.caseInsensitiveCompare(message) == .orderedSame {
                                                       self.viewCloseAction()
                                                       self.openAddMoneyVC()
                                                   } else if kPleaseSelectTeam.caseInsensitiveCompare(message) == .orderedSame {
                                                       Loader.showToast(message: message, onView: self.view, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))
                                                   }
                        else {
                        for controller in self.navigationController!.viewControllers as Array {
                                                          if controller.isKind(of: LeagueCollectionViewController.self) {
                                                              
                                                              
                                                              self.navigationController!.popToViewController(controller, animated: true)
                                                              break
                                                          }
                         Loader.showToast(message: message, onView: self.view, bottomMargin: 200, color:  UIColor(red: 240, green: 75, blue: 80))
                    }
                        }
                    }
                }
                    catch {
                        Loader.showAlert(message: "Internal Error")
                    }
                }
            }
        }
        func openAddMoneyVC() {
            openViewController(controller: AddMoneyViewController.self, storyBoard: .accountStoryBoard, handler: { (vc) in
                vc.isFromVC = self
                vc.challengeID = self.challengeid ?? 0
                vc.bonusCash = "\(self.myBalanceDataArray[0].bonus ?? "")"
                vc.winnings = "\(self.myBalanceDataArray[0].winning ?? "" )"
                vc.depositAmount = "\(self.myBalanceDataArray[0].totalamount ?? "" )"
            })
        }
        
        func showHideCreateButton() {
//            if myTeamsData.count >= 11 {
//                createTeamVC.setTitle("", for: .normal)
//                aCreateTeamButton.isEnabled = false
//                // aCreateTeamButtonHeightConstraint.constant = 0
//            } else {
//                aCreateTeamButton.setTitle("CREATE NEW TEAM", for: .normal)
//                aCreateTeamButton.isEnabled = true
//                // aCreateTeamButtonHeightConstraint.constant = 30
//            }
        }
        
        override func handleBackButtonAction() {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: LeagueCollectionViewController.self) {
                    
                    self.navigationController!.popToViewController(controller, animated: true)
                     break
                }
                    if controller.isKind(of: ContestDetailVCViewController.self) {
                         self.navigationController!.popToViewController(controller, animated: true)
                         break
                    }
                   
                
                
            }
        }
        
        func openCreateTeamVC() {
            openViewController(controller: TeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                // vc.contestData = self.contestData
                vc.teamNumber = "\(self.myTeamsData.count + 1)"
                vc.fromPreview = false
                vc.contestData = self.contestData
            vc.contestLiveData = self.contestLiveDatas
            }
        }
    
    func openKabaddiTeamVC() {
        openViewController(controller: KABADDITeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
            // vc.contestData = self.contestData
            vc.teamNumber = "\(self.myTeamsData.count + 1)"
            vc.fromPreview = false
            vc.contestData = self.contestData
               vc.contestLiveData = self.contestLiveDatas
        }
        
    }
    
        func openFootballTeamVC() {
               openViewController(controller: FootballTeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                   // vc.contestData = self.contestData
                   vc.teamNumber = "\(self.myTeamsData.count + 1)"
                   vc.fromPreview = false
                   vc.contestData = self.contestData
                  vc.contestLiveData = self.contestLiveDatas
               }
               
           }
        func previewAction(teamID: Int, index: Int) {
            //        openViewController(controller: PreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            //            vc.teamId = teamID
            //            vc.contestData = self.contestData
            //            vc.selectedIndex = index
            //        }
        }
        
        func editAction(teams: MyTeamViewController, teamID: Int) {
            //        openViewController(controller: EditCloneTeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
            //            vc.contestData = self.contestData
            //            let teamNum = teams.teamnumber
            //            vc.teamNumber = "\(teamNum ?? 999)"
            //            vc.teamId = teamID
            //        }
        }
        
        func cloneAction(teams: MyTeamViewController, teamID: Int) {
            //        openViewController(controller: EditCloneTeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
            //            vc.contestData = self.contestData
            //            vc.teamNumber = "\(self.myTeamsData.count + 1)"  // for new and clone
            //            vc.teamId = teamID
            //        }
        }
        var selectedIndex = -1
        @IBAction func unwindToMyTeamsFromPowerPlay(segue: UIStoryboardSegue) {
            getTeam()
            showHideCreateButton()
            // aContainerView.isHidden = myTeamsData.count == 0 ? false : true
        }
    }
    
    extension MyTeamViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myTeamsData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectMultipleTeamTableViewCell.identifier(), for: indexPath) as! SelectMultipleTeamTableViewCell
          let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = bgColorView
//            cell.delegate = self
            if myTeamsData.count > 0 {
//                              if matchType == "CRICKET" {
                                   cell.configureCell(data: myTeamsData[indexPath.row])
//                              }
//                              else if matchType == "FOOTBALL"{
//                                  cell.configureCellFootball(data: myTeamsData[indexPath.row])
//                              }
//
//                              else {
//                                  cell.configureCellKabbaddi(data: myTeamsData[indexPath.row])
//                              }
                          }
            if selectedIndex == indexPath.row {
//                           cell.aContainerView.borderWidth = 1
                cell.radioImageView.image = #imageLiteral(resourceName: "radio_select")
                            cell.aContainerView.borderColor = .black
                            let team = myTeamsData[indexPath.row]
                                       if let teamID = team.teamid, let teamNum = team.teamnumber {
                                           self.assignteamId = teamID
                                           self.teamNmbr = teamNum
                                           checkjoinBtnSelection()
                                       }
                            }
                      
                      else {
                      cell.radioImageView.image = #imageLiteral(resourceName: "radio")
                          cell.aContainerView.borderWidth = 0
                          cell.aContainerView.borderColor = .clear
                      }
           
            
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 220 //113 when powerplay invisible
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if myTeamsData[indexPath.row].is_joined == 1 {
                return
                       
//                           cell.containerView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
                       }

                       else {
                selectedIndex = indexPath.row

                aTableView.reloadData()
//                            cell.containerView.backgroundColor = UIColor(red: 255, green: 255, blue: 255)
//                           cell.isUserInteractionEnabled = true
                       }
            
            //
        }

        
    }
    
    
    extension MyTeamViewController :openEditVc {
        
        func openEditViewController(arrayOfPlayerID: [Int], vcID: Int, captainId: Int, teamID: Int, check: Bool) {
            if matchType == "CRICKET" {
                  openEditVc(arryOfPlayer :arrayOfPlayerID,viceCaptainID : vcID,captainID :captainId, teamIDs: teamID,check:check)
            }
                
            else if matchType == "KABADDI" {
                openKabbadiEditVc(arryOfPlayer :arrayOfPlayerID,viceCaptainID : vcID,captainID :captainId, teamIDs: teamID,check:check)
            }
            else {
                openFootballEditVc(arryOfPlayer :arrayOfPlayerID,viceCaptainID : vcID,captainID :captainId, teamIDs: teamID,check:check)

            }
          
        }
        
        func openPreviewData(teamResponse: MyTeamResponses, teamName: String, teamID: Int) {
               if matchType == "CRICKET" {
           openpreview(getTeamRespons: teamResponse,teamString :teamName, teamID: teamID)
            }
               else if matchType == "KABADDI" {
                openKabbadiPreview(getTeamRespons: teamResponse,teamString :teamName, teamID: teamID)
                
            }

               else {
                openFootballPreview(getTeamRespons: teamResponse,teamString :teamName, teamID: teamID)
            }
        }
        
        func openEditVc(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int,check: Bool){
            openViewController(controller: TeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
                vc.arrayOfPlayer  = arryOfPlayer
                vc.contestData = self.contestData
                vc.viceCaptainID = viceCaptainID
                vc.captainID = captainID
                vc.teamID = teamIDs
                vc.isFromEdit =  check
                vc.fromTeamSelection = true
                vc.contestLiveData = self.contestLiveDatas
            })
        }
        func openKabbadiEditVc(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int,check: Bool){
                   openViewController(controller: KABADDITeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
                       vc.arrayOFPlayer  = arryOfPlayer
                       vc.contestData = self.contestData
                       vc.viceCaptian = viceCaptainID
                       vc.Captain = captainID
                       vc.teamId = teamIDs
                       vc.fromEditVC =  check
                    vc.fromTeamSelection = true
                    vc.contestLiveData = self.contestLiveDatas
                   })
               }
        
        func openFootballEditVc(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int,check: Bool){
                          openViewController(controller: FootballTeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
                              vc.arrayOFPlayer  = arryOfPlayer
                              vc.contestData = self.contestData
                              vc.viceCaptian = viceCaptainID
                              vc.Captain = captainID
                              vc.teamId = teamIDs
                              vc.fromEditVC =  check
                            vc.fromTeamSelection = true
                            vc.contestLiveData = self.contestLiveDatas
                          })
                      }
        
        func openpreview(getTeamRespons: MyTeamResponses,teamString:String,teamID:Int) {
            openViewController(controller: PreviewViewController.self, storyBoard: .homeStoryBoard, handler: { (vc) in
                vc.teamName = teamString
                vc.getTeamResponse = getTeamRespons
                vc.isComingFromMyteam = true
                vc.getContestDetail = self.contestData
                vc.contestLiveData = self.contestLiveDatas
                
            })
        }
        
        func openKabbadiPreview(getTeamRespons: MyTeamResponses,teamString:String,teamID:Int) {
                   openViewController(controller: KabaddiPreviewViewController.self, storyBoard: .homeStoryBoard, handler: { (vc) in
                       vc.teamName = teamString
                       vc.getTeamResponse = getTeamRespons
                       vc.isComingFromMyteam = true
                    vc.contestData = self.contestData
                    vc.contestLive = self.contestLiveDatas
                   })
               }
        
        func openFootballPreview(getTeamRespons: MyTeamResponses,teamString:String,teamID:Int) {
            openViewController(controller: FootballPreviewViewController.self, storyBoard: .homeStoryBoard, handler: { (vc) in
                vc.teamName = teamString
                vc.getTeamResponse = getTeamRespons
                vc.isComingFromMyteam = true
                vc.contestData = self.contestData
                vc.contestLiveData = self.contestLiveDatas
            })
        }
        
}
