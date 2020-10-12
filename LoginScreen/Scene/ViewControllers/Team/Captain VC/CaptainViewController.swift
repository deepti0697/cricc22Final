//
//  CaptainViewController.swift
//  Club11
//
//  Created by Developer on 28/05/19.
//

import UIKit
import SwiftyJSON
protocol  checkFromCaptain {
    func comingFromCaptain(check:Bool)
}
class CaptainViewController: BaseClass {
    
    @IBOutlet weak var cCircularView: UIView!
    @IBOutlet weak var vcCircularView: UIView!
    var fromSignleSelection = false
    @IBOutlet weak var aVCLabel: UILabel!
    @IBOutlet weak var aClabel: UILabel!
    @IBOutlet weak var aTableView: UITableView!
    
    @IBOutlet weak var team1DisplayName: UILabel!
    @IBOutlet weak var team2DisplayName: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    var teamNumber = ""
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var contestData: GetMatchDetails?
    var teamArray = [PlayerListResponses]()
    var matchKey = ""
    var captainID = ""
    var viceCaptainID = ""
    var teamIds = ""
    var teamidforupdate :String?
    var teamMeassae : MessageResponses?
    var c = 0
    var v = 0
    var comingfromEditVc = false
    var delegate:checkFromCaptain?
    var isFromCloneVC = false
    var powerPlayDict = [String: [[[String: Int]]]]()
    var matchType = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        aTableView.register(UINib(nibName: CaptainTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: CaptainTableViewCell.identifier())
        setContestData()
        setCornerRadius()
        getTeamIDs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cCircularView.layer.cornerRadius = cCircularView.frame.size.width/2
        cCircularView.clipsToBounds = true

        cCircularView.layer.borderColor = UIColor.clear.cgColor
        cCircularView.layer.borderWidth = 5.0
        vcCircularView.layer.cornerRadius = vcCircularView.frame.size.width/2
              
        vcCircularView.clipsToBounds = true

               vcCircularView.layer.borderColor = UIColor.clear.cgColor
               vcCircularView.layer.borderWidth = 5.0
//        addNavigationBar(navigationTitle: "Chosse Captain & Vice Captain", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: true, isBinButtonShow: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
          vc.fromPreview = true
          self.delegate?.comingFromCaptain(check: true)
          navigationController?.popViewController(animated: true)
    }
    
    @IBAction func teamPreview(_ sender: Any) {
        previewAction()
    }
    func previewAction() {
        if matchType == "CRICKET" {
            openViewController(controller: PreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                //            vc.teamId = teamID
                vc.contestData = self.contestData
                vc.isFromCreateTEam = true
                vc.captainID = "\(self.c)"
                vc.viceCaptianID = "\(self.v)"
                vc.isFromEditClone = self.isFromCloneVC
                // vc.selectedIndex = index
            }
            
        }
        else if matchType == "KABADDI" {
            openViewController(controller: KabaddiPreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                //            vc.teamId = teamID
                vc.contestData = self.contestData
                //                      vc.isFromCreateTEam = true
                vc.captainID = "\(self.c)"
                vc.viceCaptianID = "\(self.v)"
                vc.isFromEditClone = self.isFromCloneVC
                // vc.selectedIndex = index
            }
        }
        else {
            openViewController(controller: FootballPreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                //            vc.teamId = teamID
                vc.contestData = self.contestData
                vc.isFromCreateTEam = true
                vc.captainID = "\(self.c)"
                vc.viceCaptianID = "\(self.v)"
                vc.isFromEditClone = self.isFromCloneVC
                // vc.selectedIndex = index
            }
        }
    }
    fileprivate func setCornerRadius() {
        //   aTimerContainerView.setCornerRadius(value: 5)
        aClabel.setCornerRadius(value: 15)
        aVCLabel.setCornerRadius(value: 15)
    }
    
    @IBOutlet weak var pointImageView: UIImageView!
    @IBAction func saveTeam(_ sender: Any) {
    }
    override func handleWalletButtonAction() {
        openViewController(controller: AccountCollectinViewController.self, storyBoard: .accountStoryBoard) { (vc) in
        }
    }
    fileprivate func setContestData() {
        if let contest = contestData {
            matchKey = contest.matchkey ?? ""
            team1DisplayName.text = contest.team1display
            team2DisplayName.text = contest.team2display
            setReleaseTime(releaseDateString: contest.time_start ?? "0")
        }
        //        if let contest = contestData as? MyContestReponse {
        //            matchKey = contest.matchkey ?? ""
        //            aVSLabel.text = "\(contest.team1display ?? "") vs \(contest.team2display ?? "")"
        //            setReleaseTime(releaseDateString: contest.start_date ?? "0")
        //        }
    }
    
    fileprivate func setReleaseTime(releaseDateString: String) {
        let releaseDateFormatter = DateFormatter()
        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let currentDate = Date()
        let calendar = Calendar.current
        let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: releaseDate! as Date)
        var day = diffDateComponents.day ?? 00
        var hour = diffDateComponents.hour ?? 00
        var minute = diffDateComponents.minute ?? 00
        var second = diffDateComponents.second ?? 00
        if day < 0 {
            day = 0
        }
        if hour < 0 {
            hour = 0
        }
        if minute < 0 {
            minute = 0
        }
        if second < 0 {
            second = 0
        }
        let countdown = "\(Utility.getStringFrom(seconds: day))D \(Utility.getStringFrom(seconds: hour))H \(Utility.getStringFrom(seconds: minute))M \(Utility.getStringFrom(seconds: second))S"
        timeLbl.text = countdown
        //  aTimeLabel.text = countdown
        if day == 0 && hour == 0 && minute == 0 && second == 0 {
            countdownTimer.invalidate()
        }
    }
    
    override func handleBackButtonAction() -> Void {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
        vc.fromPreview = true
        self.delegate?.comingFromCaptain(check: true)
        navigationController?.popViewController(animated: true)
    }
    
    func getTeamIDs() {
        var tempTeamIds = [String]()
        for player in teamArray {
            if let playerID = player.id {
                let pID = "\(playerID)"
                tempTeamIds.append(pID)
            }
        }
        teamIds = tempTeamIds.joined(separator: ",")
    }
    fileprivate func resetAllData() {
        APP_DEL.allMansArray.removeAll()
        APP_DEL.wkMansArray.removeAll()
        APP_DEL.bowlMansArray.removeAll()
        APP_DEL.batMansArray.removeAll()
        APP_DEL.choosedTeamArray.removeAll()
        APP_DEL.i1p1os = 0
        APP_DEL.i1p1oe = 0
        APP_DEL.i1p2os = 0
        APP_DEL.i1p2oe = 0
        APP_DEL.i1p3os = 0
        APP_DEL.i1p3oe = 0
        APP_DEL.i2p1os = 0
        APP_DEL.i2p1oe = 0
        APP_DEL.i2p2os = 0
        APP_DEL.i2p2oe = 0
        APP_DEL.i2p3os = 0
        APP_DEL.i2p3oe = 0
        APP_DEL.editBatMansArray.removeAll()
        APP_DEL.editBowlMansArray.removeAll()
        APP_DEL.editAllMansArray.removeAll()
        APP_DEL.editWkMansArray.removeAll()
        APP_DEL.choosedTeamArray.removeAll()
        APP_DEL.editChoosedTeamArray.removeAll()
        APP_DEL.choosedBatMansArray.removeAll()
        APP_DEL.choosedBowlMansArray.removeAll()
        APP_DEL.chossedAllMansArray.removeAll()
        APP_DEL.choosedWkMansArray.removeAll()
    }
    
    @IBAction func filterPoint(_ sender: UIButton) {
        
        if sender.isSelected {
            if pointImageView.image == #imageLiteral(resourceName: "Path 22322") {
                pointImageView.image = #imageLiteral(resourceName: "Path 22322 copy")
                teamArray =    teamArray.sorted(by: { ($0.series_points ?? 0.0) < ($1.series_points ?? 0.0) })
                
            }
        }
        else {
            pointImageView.image = #imageLiteral(resourceName: "Path 22322")
            teamArray =    teamArray.sorted(by: { ($0.series_points ?? 0.0) > ($1.series_points ?? 0.0) })
        }
        sender.isSelected = !sender.isSelected
        aTableView.reloadDataInMainQueue()
    }
    
    @IBAction func saveTeamButtonAction(_ sender: UIButton) {
        if v == 0 || c == 0 {
            Loader.showToast(message: "Please choose captain and vice-captain both", onView: self.view, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))
            if DeviceType.IS_IPHONE_X_OR_GREATER {
                Loader.showToast(message:"Please choose captain and vice-captain both" , onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            }
            else {
                Loader.showToast(message: "Please choose captain and vice-captain both", onView: self.view, bottomMargin: 0 , color: UIColor(red: 240, green: 75, blue: 80))
            }
        }
        else if comingfromEditVc {
            updateTeam()
            comingfromEditVc = false
        }
            
        else {
            
            saveTeam()
            
        }
    }
    func updateTeam() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTQzMjc4NywiZXhwIjoxNTY1NDM2Mzg3LCJuYmYiOjE1NjU0MzI3ODcsImp0aSI6IjA1Z3pXbHNWM3lqcDd1R3UiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.VwTeRImTENNqeKOeIW2K_1f3deFeJiR9bhkhN-Jz6VM",
            "Content-Type": "aapplication/json",
            "Accept":"application/json"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = [
                "matchkey": matchKey, "userid": UserDic.value(forKey: "user_id"), "players": teamIds,  "captain": "\(c)", "vicecaptain": "\(v)","sport_key":matchType,"teamid":teamidforupdate]
            NetworkManager.post_Request2(urlService: kCreateTeamURL, param: param as [String : Any], head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let json =  try JSON(data: response as! Data)
                        print(json)
                        self.resetAllData()
                        
                        Loader.showToast(message:"Team Updated SuccessFully"  , onView: self.view, bottomMargin: 30 , color: UIColor(red: 49, green: 139, blue: 22))
                        
                        
                        
                        for controller in self.navigationController!.viewControllers as Array {
                            if self.fromSignleSelection {
                                if controller.isKind(of: MyTeamViewController.self) {
                                    
                                    
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                            }
                            else {
                                if controller.isKind(of: LeagueCollectionViewController.self) {
                                    
                                    
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                                if controller.isKind(of: TeamViewController.self) {
                                    
                                    
                                    let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
                                    vc.fromPreview = true
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                            }
                        }
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
    }
    func saveTeam() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTQzMjc4NywiZXhwIjoxNTY1NDM2Mzg3LCJuYmYiOjE1NjU0MzI3ODcsImp0aSI6IjA1Z3pXbHNWM3lqcDd1R3UiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.VwTeRImTENNqeKOeIW2K_1f3deFeJiR9bhkhN-Jz6VM",
            "Content-Type": "aapplication/json",
            "Accept":"application/json"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = [
                "matchkey": matchKey, "userid": UserDic.value(forKey: "user_id"), "players": teamIds, "teamnumber": teamNumber, "captain": "\(c)", "vicecaptain": "\(v)","sport_key":matchType]
            NetworkManager.post_Request2(urlService: kCreateTeamURL, param: param as [String : Any], head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let json =  try JSON(data: response as! Data)
                        print(json)
                        let message = json["message"].string
                        let status = json["status"].intValue
                        if status == 1 {
                            Loader.showToast(message:message ?? "", onView: self.view, bottomMargin: 30 , color: UIColor(red: 49, green: 139, blue: 22))
                            
                        }
                        else {
                            Loader.showToast(message: message ?? "", onView: self.view, bottomMargin: 0 , color: UIColor(red: 240, green: 75, blue: 80))
                        }
                        
                        
                        for controller in self.navigationController!.viewControllers as Array {
                            if self.fromSignleSelection {
                                if controller.isKind(of: MyTeamViewController.self) {
                                    
                                    
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                            }
                            else {
                                if controller.isKind(of: LeagueCollectionViewController.self) {
                                    
                                    
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                                if controller.isKind(of: TeamViewController.self) {
                                    
                                    
                                    let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
                                    vc.fromPreview = true
                                    self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                            }
                        }
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
    }
    func openPowerPlay(numberOfPowerPlay: Int) {
        //        openViewController(controller: PowerPlayViewController.self, storyBoard: .teamStoryBoard) { (vc) in
        //            vc.contestData = self.contestData
        //            vc.teamIds = self.teamIds
        //            vc.captainID = self.captainID
        //            vc.viceCaptainID = self.viceCaptainID
        //            vc.numberOfPowerPlay = numberOfPowerPlay
        //            vc.teamNumber = self.teamNumber
        //        }
    }
}

extension CaptainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CaptainTableViewCell.identifier(), for: indexPath) as! CaptainTableViewCell
        cell.configureCell(player: teamArray[indexPath.row])
        let player = teamArray[indexPath.row]
        cell.delegate = self
        cell.selectCaptain(select:  player.id == c ? true : false)
        cell.selectVCaptain(select: player.id == v ? true : false)
        cell.captainClooseClouser = {[weak self] in
            if let strongSelf = self {
                if player.id == strongSelf.v {
                    strongSelf.v = 0
                    strongSelf.c = player.id ?? 0
                    
                }
                else {
                    strongSelf.c = player.id ?? 0
                }
                tableView.reloadDataInMainQueue()
            }
            
        }
        cell.vCaptainClooseClouser = {[weak self] in
            if let strongSelf = self {
                if player.id == strongSelf.c {
                    strongSelf.c = 0
                    strongSelf.v = player.id ?? 0
                }
                else {
                    strongSelf.v = player.id ?? 0
                }
                
                
                tableView.reloadDataInMainQueue()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension CaptainViewController:openCaptainProfile {
    func openProfile(playerResp: PlayerListResponses) {
        openPlayerInfoVC(id: playerResp)
    }
    
    
    
    func openPlayerInfoVC(id: PlayerListResponses) {
        openViewController(controller: PlayerStaticsViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            //            vc.teamId = self.teamId
            vc.matchKey = self.matchKey
            vc.playerData = id
            vc.checkFromCaptain = true
            //           vc.delegate = self
            
        }
    }
}
