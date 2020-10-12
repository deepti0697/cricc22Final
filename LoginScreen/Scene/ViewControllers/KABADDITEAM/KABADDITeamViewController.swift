//
//  KABADDITeamViewController.swift
//  DreamTeam
//
//  Created by Test on 05/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class KABADDITeamViewController: BaseClass {
    
    var fromTeamSelection = false
    @IBOutlet weak var raiderrOutlt: UIButton!
    @IBOutlet weak var defenderOutlt: UIButton!
    @IBOutlet weak var arOutlt: UIButton!
    var remainingCr = 0.0
    @IBOutlet weak var timeLbl: UILabel!
    var createTeam: (() -> Void) = { }
    @IBOutlet weak var aPlayerCountContainerView: UIView!
    @IBOutlet weak var totalPlayer: UILabel!
    @IBOutlet weak var aMatchDetailContainerView: UIView!
    @IBOutlet weak var aCountContainerView: UIView!
    @IBOutlet weak var aWKLabel: UILabel!
    @IBOutlet weak var aBatLabel: UILabel!
    @IBOutlet weak var aARLabel: UILabel!
    @IBOutlet weak var aPlayerCollectionView: UICollectionView!
    @IBOutlet weak var aCountCollectionView: UICollectionView!
    @IBOutlet weak var aFirstTeamImageView: UIImageView!
    @IBOutlet weak var aSecondTeamImageView: UIImageView!
    @IBOutlet weak var aFirstTeamNameLabel: UILabel!
    @IBOutlet weak var aSecondTeamNameLabel: UILabel!
    @IBOutlet weak var aFirstTeamValueLabel: UILabel!
    @IBOutlet weak var aSecondTeamValueLabel: UILabel!
    @IBOutlet weak var aSelectionView: UIView!
    @IBOutlet weak var aCreditValue: UILabel!
    
    @IBOutlet weak var aAllValue: UILabel!
    @IBOutlet weak var aBatValue: UILabel!
    @IBOutlet weak var aWkValue: UILabel!
    @IBOutlet weak var aNextButton: UIButton!
    @IBOutlet weak var aCreditImageView: UIImageView!
    @IBOutlet weak var aPointsImageView: UIImageView!
    var delegate:deleteAllDaata?
    @IBOutlet weak var choosePlayerLbl: UILabel!
    var fromEditVC = false
    var playerId:Int?
    var fromPreview = false
    var sortingIndex:Int?
    var firstTeamName = ""
    var secondTeamName = ""
    var allRounderCount = 0
    var batsManCount = 0
    var teamId = 0
    var arrayOFPlayer = [Int]()
    var viceCaptian = 0
    var Captain = 0
    var contestLiveData:MyContestLiveLeagues?
    var ruleView:SelectionRuleForKabaddi?
    
    var tempRaiderArray = [PlayerListResponses]()
    var tempDefenderArray = [PlayerListResponses]()
    var tempAllrounderArray = [PlayerListResponses]()
    var wKeeperCount = 0
    var totalcredit = 100.0
    var teamNumber = ""
    var playerCountArray = ["1", "2", "3", "4", "5", "6", "7"]
    var totalSelectedArray:String?
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var contestData: GetMatchDetails?
    var matchKey = "" {
        didSet {
            //    getPlayerList(matchKey: matchKey)
        }
    }
    var playerDetail = [PlayerListResponses]()
    var visibleCellIndex = 0 {
        didSet {
            moveSelectionView(index: visibleCellIndex)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllData()
        
    }
    @IBOutlet weak var playingBlank: UIImageView!
    @IBOutlet weak var notPlayingBlank: UIImageView!
    @IBOutlet weak var playerStatusView: UIView!
    @IBAction func playingAction(_ sender: UIButton) {
        //            aCreditValue.text = "\(0)"
        //            aWkValue.text = "\(0) "
        //            aBatValue.text = "\(0)"
        //            aAllValue.text = "\(0)"
        //            pgValue.text = "\(0)"
        //            centerLbl.text = "0"
        //            self.setFilteredArray(model: self.playerDetail)
        playingBlank.image = #imageLiteral(resourceName: "TeamBlue")
        notPlayingBlank.image = #imageLiteral(resourceName: "path Circle")
        
        APP_DEL.KabaddiRaiders = APP_DEL.KabaddiRaiders.filter { $0.is_playing == 1 }
        APP_DEL.kabaddiAllrounder = APP_DEL.kabaddiAllrounder.filter { $0.is_playing == 1 }
        
        APP_DEL.KabaddiDefender = APP_DEL.KabaddiDefender.filter { $0.is_playing == 1 }
        self.aPlayerCollectionView.reloadDataInMainQueue()
        for recognizer in view.gestureRecognizers ?? [] {
                   view.removeGestureRecognizer(recognizer)
               }
        playerStatusView.isHidden = true
    }
    
    @IBAction func closeView(_ sender: Any) {
        playerStatusView.isHidden = true
        for recognizer in view.gestureRecognizers ?? [] {
            view.removeGestureRecognizer(recognizer)
        }
    }
    
    @IBAction func notPlaying(_ sender: Any) {
        //                 self.setPlayerListData(model: self.playerDetail)
        //                self.setFilteredArray(model: self.playerDetail)
        notPlayingBlank.image = #imageLiteral(resourceName: "TeamBlue")
        playingBlank.image = #imageLiteral(resourceName: "path Circle")
        
        APP_DEL.KabaddiRaiders = APP_DEL.KabaddiRaiders.filter { $0.is_playing == 0 }
        APP_DEL.kabaddiAllrounder = APP_DEL.kabaddiAllrounder.filter { $0.is_playing == 0 }
        
        APP_DEL.KabaddiDefender = APP_DEL.KabaddiDefender.filter { $0.is_playing == 0 }
        self.aPlayerCollectionView.reloadDataInMainQueue()
       for recognizer in view.gestureRecognizers ?? [] {
                  view.removeGestureRecognizer(recognizer)
              }
        playerStatusView.isHidden = true
       
    }
    
    
    
    @IBAction func playerStatus(_ sender: Any) {
        APP_DEL.KabaddiDefender = self.tempDefenderArray
        APP_DEL.KabaddiRaiders = self.tempRaiderArray
        APP_DEL.kabaddiAllrounder = self.tempAllrounderArray
        
        playerStatusView.isHidden = false
        
        let mytapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(mytapGestureRecognizer)
        
    }
    
    @objc func handleTap(_ sender:UITapGestureRecognizer){
        
        self.playerStatusView.isHidden = true
        for recognizer in view.gestureRecognizers ?? [] {
            view.removeGestureRecognizer(recognizer)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.playerStatusView
        {
            self.playerStatusView.isHidden = true
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    //
    func registerCell() {
        aCountCollectionView.register(UINib(nibName: KabaddiTeamCountCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: KabaddiTeamCountCollectionViewCell.identifier())
        aPlayerCollectionView.register(UINib(nibName: KabaddiCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: KabaddiCollectionViewCell.identifier())
    }
    
    func setupUI() {
        choosePlayerLbl.text   =  "Pick 1 - 3 ALL-Rounders"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        registerCell()
        setContestData()
        self.playerStatusView.isHidden = true
        
        if !fromPreview {
            APP_DEL.KabaddiExtraPlayer = 4
            getPlayerList(matchKey: matchKey)
        }
        
        //getPlayerLists(matchKey: matchKey)
        addNavigationBar(navigationTitle: "Contest", titleContentMode: .left, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: true)
    }
    
    
    override func handleBackButtonAction() -> Void {
        self.removeChangePassView()
        
        for controller in self.navigationController!.viewControllers as Array {
            if fromTeamSelection {
            if controller.isKind(of: MyTeamViewController.self) {
                           
                           
                           
                           
                           self.navigationController!.popToViewController(controller, animated: true)
                           break
                       }
            }
            else {
                if controller.isKind(of: MyTeamViewController.self) {
                    
                    
                    
                    
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            if controller.isKind(of: LeagueCollectionViewController.self) {
                
                
                
                
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
            }
            
        }
    }
    override func handleBinButtonAction() -> Void {
        self.removeChangePassView()
        guard let totlpayr = Int(totalPlayer.text ?? "12") else { return}
        if totlpayr > 0 {
            ShowimportantAlert(title: "Alert!", message: "Are you sure you want to clear Selected team??", handlerOK: { action in
                print("Action Called")
                self.totalPlayer.text = "0"
                self.aCreditValue.text = "100.0"
                self.resetAllData()
                self.arrayOFPlayer.removeAll()
                self.Captain = 0
                self.viceCaptian = 0
                self.totalcredit = 100.0
                self.wKeeperCount = 0
                self.allRounderCount = 0
                self.batsManCount = 0
                self.wKeeperCount = 0
                APP_DEL.KabaddiExtraPlayer = 4
                self.getPlayerList(matchKey: self.matchKey)
                self.aFirstTeamValueLabel.text = "0"
                self.aSecondTeamValueLabel.text = "0"
                self.aWkValue.text = "0"
                self.aBatValue.text = "0"
                self.aAllValue.text = "0"
                self.Captain = 0
                self.viceCaptian = 0
                
                self.playerDetail.removeAll()
                self.aPlayerCollectionView.reloadDataInMainQueue()
                self.aCountCollectionView.reloadDataInMainQueue()
                
            }, handlerCancle: {actionCanel in
                print("Action cancel called")
            })
        }
        else {
            
            Loader.showToast(message: "No player Selected to clear", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
        }
    }
    fileprivate func resetAllData() {
        APP_DEL.kabbaddiChoosedTeamArray.removeAll()
        APP_DEL.kabaddichoosedAllrounderArray.removeAll()
        APP_DEL.kabaddichossedRaiderArray.removeAll()
        APP_DEL.kabaddichoosedDefenderArray.removeAll()
        APP_DEL.KabaddiRaiders.removeAll()
        APP_DEL.KabaddiDefender.removeAll()
        APP_DEL.kabaddiAllrounder.removeAll()
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
        APP_DEL.editChoosedTeamArray.removeAll()
        APP_DEL.choosedBatMansArray.removeAll()
        APP_DEL.choosedBowlMansArray.removeAll()
        APP_DEL.chossedAllMansArray.removeAll()
        APP_DEL.choosedWkMansArray.removeAll()
        tempRaiderArray.removeAll()
         tempDefenderArray.removeAll()
        tempAllrounderArray.removeAll()
    }
    
    fileprivate func setContestData() {
        if let contest = contestData  {
            setReleaseTime(releaseDateString: contest.time_start ?? "0")
            matchKey = contest.matchkey ?? ""
            aFirstTeamNameLabel.text = "\(contest.team1display)"
            aSecondTeamNameLabel.text = "\(contest.team2display ?? "")"
            firstTeamName = "\(contest.team1display )"
            secondTeamName = "\(contest.team2display ?? "")"
            if let imagePath1 = contest.team1logo {
                let urlString1 = imagePath1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString1 ?? "")
                aFirstTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
            if let imagePath2 = contest.team2logo {
                let urlString2 = imagePath2.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString2 ?? "")
                aSecondTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
            
        }
        if let contest = contestLiveData  {
            setReleaseTime(releaseDateString: contest.time_start ?? "0")
            matchKey = contest.matchkey ?? ""
            aFirstTeamNameLabel.text = "\(contest.team1display ?? "")"
            aSecondTeamNameLabel.text = "\(contest.team2display ?? "")"
            firstTeamName = "\(contest.team1display ?? "" )"
            secondTeamName = "\(contest.team2display ?? "")"
            if let imagePath1 = contest.team1logo {
                let urlString1 = imagePath1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString1 ?? "")
                aFirstTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
            if let imagePath2 = contest.team2logo {
                let urlString2 = imagePath2.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString2 ?? "")
                aSecondTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
            
        }
        
    }
    
    fileprivate func setReleaseTime(releaseDateString: String) {
        let releaseDateFormatter = DateFormatter()
        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func teamPreviewVC(_ sender: Any) {
        print(APP_DEL.choosedTeamArray)
        previewAction()
        
    }
    func previewAction() {
        openViewController(controller: KabaddiPreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            //            vc.teamId = teamID
            vc.contestData = self.contestData
            //                vc.isFromCreateTEam = true
            vc.delegate = self
            vc.captainID = "\(self.Captain)"
            vc.cId = self.Captain
            vc.vcID = self.viceCaptian
            vc.viceCaptianID = "\(self.viceCaptian)"
            //                 vc.selectedIndex = index
        }
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
        if day == 0 && hour == 0 && minute == 0 && second == 0 {
            countdownTimer.invalidate()
        }
    }
    
    
    func getPlayerList(matchKey: String) {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTU5NjM2NSwiZXhwIjoxNTY1NTk5OTY1LCJuYmYiOjE1NjU1OTYzNjUsImp0aSI6IjI0VjdpQnAyZkhtTUR3MnkiLCJzdWIiOjExOCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.lhe4Fkzq1m0PMwebcf_BEsKKuRncIGBKn1QbuKEdF8I",
            "content-type": "application/x-www-form-urlencoded",
            "Accept" : "application/json"
        ]
        
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let param = [
                "matchkey": matchKey,
                "sport_key":"KABADDI"
            ]
            NetworkManager.post_Request(urlService: kPlayerListURL, param: param, head: headers) {
                (response) in
                
                self.hideActivityIndicator()
                
                guard let data = response else { return }
                do{
                    let json = try JSON(data:data as! Data)
                    //                 let list = MyCatagries(json: json)
                    
                    let results = json["result"]
                    //let cat = results["categories"]
                    //
                    self.playerDetail.removeAll()
                    for arr in results.arrayValue{
                        self.playerDetail.append(PlayerListResponses(json:arr))
                        
                        
                    }
                    self.setPlayerListData(model: self.playerDetail)
                    
                }
                catch{
                    self.view.makeToast(message: "Internal Error")
                    print(error.localizedDescription)
                }
            }
            
            
        }
        
    }
    
    
    
    fileprivate func setPlayerListData(model: [PlayerListResponses]) {
        
        
        
        for data in model {
            if data.role == "raider" {
                tempRaiderArray.append(data)
            }
            if data.role == "defender" {
                tempDefenderArray.append(data)
            }
            if data.role == "allrounder" {
                tempAllrounderArray.append(data)
            }
            if arrayOFPlayer.count > 0 {
                APP_DEL.KabaddiExtraPlayer = 0
                for selectedPlayer in arrayOFPlayer {
                    if data.id == selectedPlayer {
                        APP_DEL.kabbaddiChoosedTeamArray.append(data)
                        if data.role == "defender" {
                            batsManCount += 1
                            APP_DEL.kabaddichoosedDefenderArray.append(data)
                        }
                        if data.role == "raider" {
                            allRounderCount += 1
                            APP_DEL.kabaddichossedRaiderArray.append(data)
                        }
                        if data.role == "allrounder" {
                            wKeeperCount += 1
                            APP_DEL.kabaddichoosedAllrounderArray.append(data)
                        }
                        if let playerCredit = data.credit {
                            if let pCr = Double(playerCredit) {
                                totalcredit -= pCr
                            }
                        }
                        
                    }
                }
                totalPlayer.text = "7"
                aCreditValue.text = "\(totalcredit)"
                aWkValue.text = "\(wKeeperCount) "
                aBatValue.text = "\(batsManCount)"
                aAllValue.text = "\(allRounderCount) "
                playerTeamCountSetup()
            }
        }
        
        APP_DEL.KabaddiDefender = tempDefenderArray
        APP_DEL.KabaddiRaiders = tempRaiderArray
        APP_DEL.kabaddiAllrounder = tempAllrounderArray
        
        aPlayerCollectionView.reloadDataInMainQueue()
        
    }
    @IBAction func wkButtonAction(_ sender: Any) {
        arOutlt.provideVisualFeedback(arOutlt)
        aPlayerCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index: 0)
        sortingIndex = 0
    }
    
    @IBAction func batButtonAction(_ sender: Any) {
        defenderOutlt.provideVisualFeedback(defenderOutlt)
        aPlayerCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index: 1)
        sortingIndex = 1
    }
    
    @IBAction func allButtonAction(_ sender: Any) {
        raiderrOutlt.provideVisualFeedback(raiderrOutlt)
        aPlayerCollectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .centeredHorizontally, animated: true)
        moveSelectionView(index: 2)
        sortingIndex = 2
    }
    
    
    
    fileprivate func moveSelectionView(index: Int) {
        let selectionViewWidth = Int((ScreenSize.SCREEN_WIDTH) / 3)
        switch index {
        case 0:
            self.aBatLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aBatValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aARLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aAllValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            sortingIndex = 0
            self.choosePlayerLbl.text =  "Pick 1-3 ALL ROUNDER"
            //            aCategoryInfoLabel.text = "PICK 1 WICKET-KEEPER"
            UIView.animate(withDuration: 0.2) {
                self.aSelectionView.frame = CGRect(x: 0, y: 28, width: selectionViewWidth, height: 3)
                self.aWKLabel.textColor = .black
                self.aWkValue.textColor = .black
            }
        case 1:
            self.aWKLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aWkValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aARLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aAllValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            sortingIndex = 1
            self.choosePlayerLbl.text =  "Pick 1-3 DEFENDER"
            
            //            aCategoryInfoLabel.text = "PICK 3-5 BATSMAN"
            UIView.animate(withDuration: 0.2) {
                self.aSelectionView.frame = CGRect(x:  (5 + (selectionViewWidth * index)), y: 28, width: selectionViewWidth, height: 3)
                self.aBatLabel.textColor = .black
                self.aBatValue.textColor = .black
            }
        case 2:
            self.aWKLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aWkValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aBatLabel.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.aBatValue.textColor = UIColor(red: 142, green: 145, blue: 147)
            self.choosePlayerLbl.text =  "Pick 1-3 RAIDERS"//
            //            aCategoryInfoLabel.text = "PICK 1-3 ALL ROUNDER"
            sortingIndex = 2
            UIView.animate(withDuration: 0.2) {
                self.aSelectionView.frame = CGRect(x: (0 + (selectionViewWidth * index))  , y: 28, width: selectionViewWidth, height: 3)
                self.aARLabel.textColor = .black
                self.aAllValue.textColor = .black
            }
            
            
        default:
            break
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        visibleCellIndex = Utility.findCenterCellIndex(collectionView: aPlayerCollectionView)
    }
    
    @IBAction func creditButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            
            aCreditImageView.image = #imageLiteral(resourceName: "Path 22322 copy")
            sortingArray(index: sortingIndex ?? 0)
        } else {
            aCreditImageView.image = #imageLiteral(resourceName: "Path 22322")
            sortingArray(index: sortingIndex ?? 0)
            
        }
        sender.isSelected = !sender.isSelected
        
    }
    fileprivate func sortingArray(index: Int) {
        
        switch index {
            
        case 0:
            if aCreditImageView.image == #imageLiteral(resourceName: "Path 22322") {
                APP_DEL.kabaddiAllrounder =  APP_DEL.kabaddiAllrounder.sorted {
                    Double($0.credit ?? "0") ?? 0 > Double($1.credit ?? "0") ?? 0
                    
                }
                
            }
            else {
                
                APP_DEL.kabaddiAllrounder =  APP_DEL.kabaddiAllrounder.sorted {
                    Double($0.credit ?? "0") ?? 0.0 < Double($1.credit ?? "0") ?? 0
                    
                }
                
                
                
            }
            
        case 1:
            if aCreditImageView.image == #imageLiteral(resourceName: "Path 22322") {
                APP_DEL.KabaddiDefender =  APP_DEL.KabaddiDefender.sorted {
                    Double($0.credit ?? "0") ?? 0 < Double($1.credit ?? "0") ?? 0
                    
                }
                
                
                
            }
            else {
                
                
                APP_DEL.KabaddiDefender =  APP_DEL.KabaddiDefender.sorted {
                    Double($0.credit ?? "0") ?? 0 > Double($1.credit ?? "0") ?? 0
                    
                }
                
                
            }
            
        case 2:
            if aCreditImageView.image == #imageLiteral(resourceName: "Path 22322 copy") {
                APP_DEL.KabaddiRaiders =  APP_DEL.KabaddiRaiders.sorted {
                    Double($0.credit ?? "0") ?? 0 > Double($1.credit ?? "0") ?? 0
                    
                }
                
                
            }
            else {
                
                APP_DEL.KabaddiRaiders =  APP_DEL.KabaddiRaiders.sorted {
                    Double($0.credit ?? "0") ?? 0 < Double($1.credit ?? "0") ?? 0
                    
                }
                
                
            }
            
        default:
            break
        }
        aPlayerCollectionView.reloadDataInMainQueue()
    }
    
    
    @IBAction func pointButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            
            sortingPointArray(index: sortingIndex ?? 0)
            
            aPointsImageView.image = #imageLiteral(resourceName: "Path 22322 copy")
        } else {
            sortingPointArray(index: sortingIndex ?? 0)
            aPointsImageView.image = #imageLiteral(resourceName: "Path 22322")
        }
        sender.isSelected = !sender.isSelected
        
    }
    
    fileprivate func sortingPointArray(index: Int) {
        
        switch index {
            
        case 0:
            if aPointsImageView.image == #imageLiteral(resourceName: "Path 22322") {
                APP_DEL.kabaddiAllrounder =    APP_DEL.kabaddiAllrounder.sorted(by: { ($0.series_points ?? 0.0) < ($1.series_points ?? 0.0) })
                
            }
            else {
                
                APP_DEL.kabaddiAllrounder =    APP_DEL.kabaddiAllrounder.sorted(by: { ($0.series_points ?? 0.0) > ($1.series_points ?? 0.0) })
                
            }
            
        case 1:
            if aPointsImageView.image == #imageLiteral(resourceName: "Path 22322") {
                APP_DEL.KabaddiDefender =    APP_DEL.KabaddiDefender.sorted(by: { ($0.series_points ?? 0.0) < ($1.series_points ?? 0.0) })
                
                
            }
            else {
                
                
                APP_DEL.KabaddiDefender =    APP_DEL.KabaddiDefender.sorted(by: { ($0.series_points ?? 0.0) > ($1.series_points ?? 0.0) })
                
                
            }
            
        case 2:
            if aPointsImageView.image == #imageLiteral(resourceName: "Path 22322 copy") {
                APP_DEL.KabaddiRaiders =    APP_DEL.KabaddiRaiders.sorted(by: { ($0.series_points ?? 0.0) < ($1.series_points ?? 0.0) })
                
            }
            else {
                
                APP_DEL.KabaddiRaiders =    APP_DEL.KabaddiRaiders.sorted(by: { ($0.series_points ?? 0.0) > ($1.series_points ?? 0.0) })
                
            }
            
            
        default:
            break
        }
        aPlayerCollectionView.reloadDataInMainQueue()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if aWkValue.text == "0" {
            
            Loader.showToast(message: "Please choose minimum 1 All-Rounder", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            return
        }
        if aBatValue.text == "0" {
            Loader.showToast(message: "Please choose minimum 1 DEFENDER", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
            
            return
        }
        if aAllValue.text == "0" {
            Loader.showToast(message: "Please choose minimum 1 RAIDER", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
            return
        }
        
        if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
            openViewController(controller: CaptainViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                vc.teamArray = APP_DEL.kabbaddiChoosedTeamArray
                vc.contestData = self.contestData
                vc.teamNumber = self.teamNumber
                vc.delegate = self
                vc.matchType = "KABADDI"
                vc.comingfromEditVc = self.fromEditVC
                vc.delegate = self
                vc.c = self.Captain
                vc.teamidforupdate = "\(self.teamId)"
                vc.v = self.viceCaptian
                vc.fromSignleSelection = self.fromTeamSelection
                
                
            }
        }
        else {
            
            Loader.showToast(message: "Please select 7 Player", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        }
        
        
    }
    
    
    
    func playerTeamCountSetup() {
        var tempFirstTotalPlayerCount = 0
        var tempSecondTotalPlayerCount = 0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        if players.count == 0 {
            tempFirstTotalPlayerCount = 0
            tempSecondTotalPlayerCount = 0
        }
        for player in players {
            guard let platerTeam = player.team else {
                return
            }
            if (platerTeam == "team1") {
                tempFirstTotalPlayerCount += 1
            } else if (platerTeam == "team2") {
                tempSecondTotalPlayerCount += 1
            }
        }
        
        aFirstTeamValueLabel.text = "(\(tempFirstTotalPlayerCount))"
        aSecondTeamValueLabel.text = "(\(tempSecondTotalPlayerCount))"
        //    totalPlayer.text = "\(tempSecondTotalPlayerCount + tempSecondTotalPlayerCount)"
        
    }
    func playerTeamCountSeven(player: PlayerListResponses) -> Bool {
        var tempFirstTotalPlayerCount = 0
        var tempSecondTotalPlayerCount = 0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        for player in players {
            guard let platerTeam = player.team else {
                return false
            }
            if (platerTeam == "team1") {
                tempFirstTotalPlayerCount += 1
            } else if (platerTeam == "team2") {
                tempSecondTotalPlayerCount += 1
            }
        }
        guard let platerTeam = player.team else {
            return false
        }
        if (platerTeam == "team1") {
            if tempFirstTotalPlayerCount  == 4 {
                return true
            } else {
                return false
            }
        } else {
            if tempSecondTotalPlayerCount  == 4 {
                return true
            } else {
                return false
            }
        }
    }
    
    @IBAction func openSelectionView(_ sender: Any) {
        openChangePasswordView()
    }
    fileprivate func openChangePasswordView() {
        if ruleView == nil {
            ruleView = Bundle.main.loadNibNamed("SelectionRuleForKabaddi", owner: self, options: nil)?.first as? SelectionRuleForKabaddi
            ruleView?.center = self.view.center
            ruleView?.closeButtonClouser = { [weak self] in
                if let strongSelf = self {
                    strongSelf.removeChangePassView()
                }
            }
            APP_DEL.window?.addSubview(ruleView!)
        }
    }
    fileprivate func removeChangePassView() {
        ruleView?.removeFromSuperview()
        ruleView = nil
    }
    
    
}

extension KABADDITeamViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == aPlayerCollectionView {
            return 3
        } else {
            return playerCountArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == aPlayerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KabaddiCollectionViewCell.identifier(), for: indexPath) as! KabaddiCollectionViewCell
            cell.delgate = self
            cell.firstTeamName = firstTeamName
            cell.secondTeamName = secondTeamName
            cell.playerDataIndex = indexPath.row
            cell.firstTeamName = firstTeamName
            cell.secondTeamName = secondTeamName
            cell.allSelectionTotal = allRounderCount
            cell.batSelectionTotal = batsManCount
            cell.wkSelectionTotal = wKeeperCount
            
            cell.playerDataIndex = indexPath.item
            cell.wkSelectionClouser = {[weak self] val in
                if let strongSelf = self {
                    let wkVal =  String(val)
                    strongSelf.aWkValue.text = "\(wkVal)"
                    self?.wKeeperCount = Int(wkVal) ?? 0
                    strongSelf.aCountCollectionView.reloadDataInMainQueue()
                }
            }
            cell.batSelectionClouser = {[weak self] val in
                if let strongSelf = self {
                    let batVal =  String(val)
                    strongSelf.aBatValue.text = "\(batVal)"
                    self?.batsManCount = Int(batVal) ?? 0
                    strongSelf.aCountCollectionView.reloadDataInMainQueue()
                }
            }
            cell.allSelectionClouser = {[weak self] val in
                if let strongSelf = self {
                    let arVal =  String(val)
                    strongSelf.aAllValue.text = "\(arVal)"
                    self?.allRounderCount = Int(arVal) ?? 0
                    strongSelf.aCountCollectionView.reloadDataInMainQueue()
                }
            }
            cell.playerCountClouser = {[weak self] val in
                if let strongSElf = self {
                    let totalcount = val
                    strongSElf.totalPlayer.text = String(totalcount)
                }
                
            }
            cell.playerCreditClouser = {[weak self] val in
                if let strongSelf = self {
                    let remainingCredit = 100.0 - val
                    strongSelf.totalcredit = Double(remainingCredit)
                    strongSelf.aCreditValue.text = String(remainingCredit)
                }
            }
            cell.playerChoosedClouser = {[weak self]  in
                if let strongSelf = self {
                    strongSelf.playerTeamCountSetup()
                }
            }
            return cell
        }
            
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KabaddiTeamCountCollectionViewCell.identifier(), for: indexPath) as! KabaddiTeamCountCollectionViewCell
            cell.configureCell(index: indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == aPlayerCollectionView {
            return CGSize(width: aPlayerCollectionView.frame.width, height: aPlayerCollectionView.frame.height)
        } else {
            if DeviceType.IS_IPHONE_5 {
                return CGSize(width: ScreenSize.SCREEN_WIDTH / 15.5, height: ScreenSize.SCREEN_WIDTH / 16)
            } else if DeviceType.IS_IPHONE_X_OR_GREATER {
                return CGSize(width: ScreenSize.SCREEN_WIDTH / 14.5, height: ScreenSize.SCREEN_WIDTH / 14)
            } else {
                return CGSize(width: ScreenSize.SCREEN_WIDTH / 13.5, height: ScreenSize.SCREEN_WIDTH / 14.5)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        //Where elements_count is the count of all your items in that
        //Collection view...
        if collectionView == aCountCollectionView {
            let cellCount = CGFloat(playerCountArray.count)
            
            //If the cell count is zero, there is no point in calculating anything.
            if cellCount > 0 {
                let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
                let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
                
                //20.00 was just extra spacing I wanted to add to my cell.
                let totalCellWidth = cellWidth*cellCount + 20.00 * (cellCount-1)
                let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right
                
                if (totalCellWidth < contentWidth) {
                    //If the number of cells that exists take up less room than the
                    //collection view width... then there is an actual point to centering them.
                    
                    //Calculate the right amount of padding to center the cells.
                    let padding = (contentWidth - totalCellWidth) / 2.0
                    return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
                } else {
                    //Pretty much if the number of cells that exist take up
                    //more room than the actual collectionView width, there is no
                    // point in trying to center them. So we leave the default behavior.
                    return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
                }
            }
            return UIEdgeInsets.zero
        }
        return .zero
    }
}

extension KABADDITeamViewController:openPlayerStatisticProfileKabaddi {
    func sendDatatoMainVc(player: PlayerListResponses) {
        openPlayerInfoVC(id: player)
    }
    
    
    
    //    func sendDatatoMainVc(player: ) {
    //
    //    }
    func minimumPlayerWarning() {
        if (APP_DEL.kabaddichoosedAllrounderArray.count < 1) {
            Loader.showToast(message:"You must select at least 1 All-Rounder.", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        } else if (APP_DEL.kabaddichoosedDefenderArray.count < 1) {
            Loader.showToast(message: "You must select at least 1 Defender.", onView:  self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        } else if (APP_DEL.kabaddichossedRaiderArray.count < 1) {
            Loader.showToast(message: "You must select at least 1 Raider.", onView:  self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        }
    }
    func sendPlayerInfotoRemove(playerid: PlayerListResponses) {
        APP_DEL.kabbaddiChoosedTeamArray = APP_DEL.kabbaddiChoosedTeamArray.filter({ $0.id != playerid.id})
        if playerid.role == "defender" {
            if  (APP_DEL.kabaddichoosedDefenderArray.count > APP_DEL.minKabaddiDef) {
                APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
            }
            
            self.batsManCount -= 1
            aBatValue.text = "\(batsManCount)"
            APP_DEL.kabaddichoosedDefenderArray = APP_DEL.kabaddichoosedDefenderArray.filter({ $0.id != playerid.id})
            if let playerCredit = playerid.credit {
                if let pCr = Double(playerCredit) {
                    totalcredit += pCr
                }
            }
            let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
            guard let convert = Int(trimmedString ?? "0") else { return  }
            let playerData = convert - 1
            self.totalPlayer.text = "\(playerData)"
            self.aCreditValue.text = "\(totalcredit)"
            playerTeamCountSetup()
            aCountCollectionView.reloadDataInMainQueue()
            aPlayerCollectionView.reloadDataInMainQueue()
            
            
            
        }
        
        if playerid.role == "raider" {
            if  (APP_DEL.kabaddichossedRaiderArray.count > APP_DEL.minRaid) {
                APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
            }
            self.allRounderCount -= 1
            aAllValue.text = "\(allRounderCount) "
            //  APP_DEL.chossedAllMansArray.append(playerid)
            APP_DEL.kabaddichossedRaiderArray = APP_DEL.kabaddichossedRaiderArray.filter({ $0.id != playerid.id})
            if let playerCredit = playerid.credit {
                if let pCr = Double(playerCredit) {
                    totalcredit += pCr
                }
            }
            let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
            guard let convert = Int(trimmedString ?? "0") else { return  }
            let playerData = convert - 1
            self.totalPlayer.text = "\(playerData)"
            self.aCreditValue.text = "\(totalcredit)"
            playerTeamCountSetup()
            aCountCollectionView.reloadDataInMainQueue()
            aPlayerCollectionView.reloadDataInMainQueue()
            
            
            
        }
        
        if playerid.role == "allrounder" {
            if  (APP_DEL.kabaddichoosedAllrounderArray.count > APP_DEL.minAR) {
                APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
            }
            aWkValue.text = "\(wKeeperCount) "
            self.wKeeperCount -= 1
            APP_DEL.kabaddichoosedAllrounderArray = APP_DEL.kabaddichoosedAllrounderArray.filter({ $0.name != playerid.name})
            if let playerCredit = playerid.credit {
                if let pCr = Double(playerCredit) {
                    totalcredit += pCr
                }
            }
            let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
            guard let convert = Int(trimmedString ?? "0") else { return  }
            let playerData = convert - 1
            self.totalPlayer.text = "\(playerData)"
            self.aCreditValue.text = "\(totalcredit)"
            playerTeamCountSetup()
            aCountCollectionView.reloadDataInMainQueue()
            aPlayerCollectionView.reloadDataInMainQueue()
            
            
        }
        
        
        
    }
    func checkCreaditLimitExceed(sPlayer: PlayerListResponses) -> Bool {
        var currentCredit = 0.0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        for player in players {
            if let playerCredit = player.credit {
                let pCr = Double(playerCredit) ?? 0.0
                currentCredit += pCr
            }
        }
        remainingCr = 100.0 - currentCredit
        if let selectedPlayerCreadit = sPlayer.credit {
            if let sPCr = Double(selectedPlayerCreadit) {
                if remainingCr >= sPCr {
                    return false
                } else {
                    return true
                }
            }
        }
        return false
    }
    
    
    func sendPlayaerInfo(playerid: PlayerListResponses) {
        if playerid.role == "defender" {
            
            if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                
                Loader.showToast(message: "You can choose Maximum 7 Players", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                
            } else {
                if playerTeamCountSeven(player: playerid) {
                    
                    Loader.showToast(message: "You can select only 4 from  each team", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                    
                } else {
                    if checkCreaditLimitExceed(sPlayer: playerid) {
                        
                        Loader.showToast(message: "Only \(remainingCr) credit left", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        
                        
                    }
                    else {
                        if APP_DEL.kabaddichoosedDefenderArray.count != 3 {
                            if APP_DEL.kabaddichoosedDefenderArray.count < APP_DEL.minKabaddiDef || APP_DEL.KabaddiExtraPlayer > 0 {
                                if APP_DEL.kabaddichoosedDefenderArray.count >= APP_DEL.minKabaddiDef {
                                    APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                }
                                self.batsManCount += 1
                                APP_DEL.kabbaddiChoosedTeamArray.append(playerid)
                                aBatValue.text = "\(batsManCount)"
                                
                                APP_DEL.kabaddichoosedDefenderArray.append(playerid)
                                if let playerCredit = playerid.credit {
                                    if let pCr = Double(playerCredit) {
                                        totalcredit -= pCr
                                    }
                                }
                                let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
                                guard let convert = Int(trimmedString ?? "0") else { return  }
                                let playerData = convert + 1
                                self.totalPlayer.text = "\(playerData)"
                                self.aCreditValue.text = "\(totalcredit)"
                                playerTeamCountSetup()
                                aCountCollectionView.reloadDataInMainQueue()
                                aPlayerCollectionView.reloadDataInMainQueue()
                            }
                            else {
                                minimumPlayerWarning()
                            }
                        }
                        else {
                            
                            Loader.showToast(message: "You can select only 3 Defenders", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            
                        }
                    }
                }
                
            }
        }
        
        
        if playerid.role == "raider" {
            
            if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                
                Loader.showToast(message: "You can select maximum 7 Player", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                
            }
            else {
                if playerTeamCountSeven(player: playerid) {
                    
                    Loader.showToast(message: "You can select only 4 from a each team", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                } else {
                    if checkCreaditLimitExceed(sPlayer: playerid) {
                        if DeviceType.IS_IPHONE_X_OR_GREATER {
                            Loader.showToast(message: "Only \(remainingCr) credit left", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        }
                        else {
                            Loader.showToast(message: "Only \(remainingCr) credit left", onView: self.view, bottomMargin: 0 , color: UIColor(red: 240, green: 75, blue: 80))
                        }
                        
                    }
                    else {
                        if APP_DEL.kabaddichossedRaiderArray.count != 3 {
                            if APP_DEL.kabaddichossedRaiderArray.count < APP_DEL.minRaid || APP_DEL.KabaddiExtraPlayer > 0 {
                                if APP_DEL.kabaddichossedRaiderArray.count >= APP_DEL.minRaid {
                                    APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                }
                                APP_DEL.kabbaddiChoosedTeamArray.append(playerid)
                                self.allRounderCount += 1
                                aAllValue.text = "\(allRounderCount) "
                                APP_DEL.chossedAllMansArray.append(playerid)
                                if let playerCredit = playerid.credit {
                                    if let pCr = Double(playerCredit) {
                                        totalcredit -= pCr
                                    }
                                }
                                let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
                                guard let convert = Int(trimmedString ?? "0") else { return  }
                                let playerData = convert + 1
                                self.totalPlayer.text = "\(playerData)"
                                self.aCreditValue.text = "\(totalcredit)"
                                playerTeamCountSetup()
                                aCountCollectionView.reloadDataInMainQueue()
                                aPlayerCollectionView.reloadDataInMainQueue()
                            }
                            else {
                                minimumPlayerWarning()
                            }
                        }
                        else {
                            
                            Loader.showToast(message: "You can Select only 3 Rider", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            
                        }
                    }
                }
            }
        }
        
        if playerid.role == "allrounder" {
            
            if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                
                Loader.showToast(message: "You can select maximum 7 Player", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                
            }
            else {
                if playerTeamCountSeven(player: playerid) {
                    
                    Loader.showToast(message: "You can Select only 4 players from each team", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                    
                } else {
                    if checkCreaditLimitExceed(sPlayer: playerid) {
                        
                        Loader.showToast(message: "Only \(remainingCr) credit left", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        
                        
                    }
                        
                    else {
                        if APP_DEL.kabaddichoosedAllrounderArray.count != 3 {
                            if APP_DEL.kabaddichoosedAllrounderArray.count < APP_DEL.minAR || APP_DEL.KabaddiExtraPlayer > 0 {
                                if APP_DEL.kabaddichoosedAllrounderArray.count >= APP_DEL.minAR {
                                    APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                }
                                APP_DEL.kabbaddiChoosedTeamArray.append(playerid)
                                aWkValue.text = "\(wKeeperCount) "
                                self.wKeeperCount += 1
                                APP_DEL.kabaddichoosedAllrounderArray.append(playerid)
                                
                                if let playerCredit = playerid.credit {
                                    if let pCr = Double(playerCredit) {
                                        totalcredit -= pCr
                                    }
                                }
                                let trimmedString = totalPlayer.text?.trimmingCharacters(in: .whitespaces)
                                guard let convert = Int(trimmedString ?? "0") else { return  }
                                let playerData = convert + 1
                                self.totalPlayer.text = "\(playerData)"
                                self.aCreditValue.text = "\(totalcredit)"
                                playerTeamCountSetup()
                                aCountCollectionView.reloadDataInMainQueue()
                                aPlayerCollectionView.reloadDataInMainQueue()
                            }
                            else {
                                minimumPlayerWarning()
                            }
                        }
                        else {
                            
                            Loader.showToast(message: "You can Select only 3 All Rounder", onView: self.view, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            
                        }
                    }
                }
            }
        }
        
    }
    func openPlayerInfoVC(id: PlayerListResponses) {
        openViewController(controller: PlayerStaticsViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            //            vc.teamId = self.teamId
            vc.matchKey = self.matchKey
            vc.playerData = id
            vc.delegate = self
            for i in APP_DEL.kabbaddiChoosedTeamArray {
                if i.id == id.id {
                    vc.isPlayerAdeed = false
                    return
                }
                
            }
            vc.isPlayerAdeed = true
        }
    }
}


extension KABADDITeamViewController:fromPlayerProfile,checkFromCaptain,KabaddiPreview {
    func checkFrom(check: Bool) {
        fromPreview = check
    }
    
    
    
    func comingFromCaptain(check: Bool) {
        self.fromPreview = check
    }
    
    func backToTeam(check: Bool) {
        self.fromPreview = check
    }
}
