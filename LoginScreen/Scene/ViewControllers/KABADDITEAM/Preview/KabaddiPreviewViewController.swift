//
//  KabaddiPreviewViewController.swift
//  DreamTeam
//
//  Created by Test on 05/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol KabaddiPreview {
    func checkFrom(check:Bool)
}
class KabaddiPreviewViewController: BaseClass {
    var getContestDetail:GetMatchDetails?
    var arrayOFSelectedPlayer = [Int]()
    
    
    @IBOutlet weak var allRounderStackView: UIStackView!
    @IBOutlet weak var wkeeperStackView: UIStackView!
    @IBOutlet weak var batStackView: UIStackView!
    @IBOutlet weak var all1UIView: UIView!
    @IBOutlet weak var all2UIView: UIView!
    @IBOutlet weak var all3UIView: UIView!
    @IBOutlet weak var wk1UIView: UIView!
    @IBOutlet weak var wk2UIView: UIView!
    @IBOutlet weak var wk3UIView: UIView!
    
    @IBOutlet weak var bat1UiView: UIView!
    @IBOutlet weak var bat2UiView: UIView!
    @IBOutlet weak var bat3UiView: UIView!
    
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var croosBtn: UIButton!
    @IBOutlet weak var editLbl: UILabel!
    @IBOutlet weak var editView: UIView!
    
    var teamName = ""
    @IBOutlet weak var aBat1CaptainLabel: UILabel!
    @IBOutlet weak var aBat1ContainerView: UIView!
    @IBOutlet weak var aBat1ImageView: UIImageView!
    @IBOutlet weak var aBat1NameLabel: UILabel!
    @IBOutlet weak var aBat1PointLabel: UILabel!
    @IBOutlet weak var aBat2CaptainLabel: UILabel!
    @IBOutlet weak var aBat2ContainerView: UIView!
    @IBOutlet weak var aBat2ImageView: UIImageView!
    @IBOutlet weak var aBat2NameLabel: UILabel!
    @IBOutlet weak var aBat2PointLabel: UILabel!
    @IBOutlet weak var aBat3CaptainLabel: UILabel!
    @IBOutlet weak var aBat3ContainerView: UIView!
    @IBOutlet weak var aBat3ImageView: UIImageView!
    @IBOutlet weak var aBat3NameLabel: UILabel!
    @IBOutlet weak var aBat3PointLabel: UILabel!
    
    @IBOutlet weak var aAR1CaptainLabel: UILabel!
    @IBOutlet weak var aAR1ContainerView: UIView!
    @IBOutlet weak var aAR1ImageView: UIImageView!
    @IBOutlet weak var aAR1NameLabel: UILabel!
    @IBOutlet weak var aAR1PointLabel: UILabel!
    @IBOutlet weak var aAR2CaptainLabel: UILabel!
    @IBOutlet weak var aAR2ContainerView: UIView!
    @IBOutlet weak var aAR2ImageView: UIImageView!
    @IBOutlet weak var aAR2NameLabel: UILabel!
    @IBOutlet weak var aAR2PointLabel: UILabel!
    @IBOutlet weak var aAR3CaptainLabel: UILabel!
    @IBOutlet weak var aAR3ContainerView: UIView!
    @IBOutlet weak var aAR3ImageView: UIImageView!
    @IBOutlet weak var aAR3NameLabel: UILabel!
    
    @IBOutlet weak var aAR3PointLabel: UILabel!
    @IBOutlet weak var aTeamNameLabel: UILabel!
    
    @IBOutlet weak var aEditButton: UIButton!
    @IBOutlet weak var aWk2ImageView: UIImageView!
    @IBOutlet weak var awk2CaptainLbl: UILabel!
    @IBOutlet weak var awk1ContainerView: UIView!
    
    @IBOutlet weak var awk3CaptianLbl: UILabel!
    @IBOutlet weak var awk3PointLbl: UILabel!
    @IBOutlet weak var awk3NameLbl: UILabel!
    @IBOutlet weak var awk3ImageView: UIImageView!
    @IBOutlet weak var awk3ContainerView: UIView!
    @IBOutlet weak var awkCaptainLbl: UILabel!
    @IBOutlet weak var awk1PointLbl: UILabel!
    @IBOutlet weak var awk1NameLbl: UILabel!
    @IBOutlet weak var awk1ImageView: UIImageView!
    @IBOutlet weak var awk2ContainerView: UIView!
    @IBOutlet weak var awk2PointLabel: UILabel!
    @IBOutlet weak var awk2NameLBl: UILabel!
 
    var getTeamResponse:MyTeamResponses?
    var isComingFromMyteam = false
    var isFromEditClone = false
    var comingromFromPReview = false
    var delegate:KabaddiPreview?
    
    var wk1_Player_ID = 0
    var wk2_Player_ID = 0
    var wk3_Player_ID = 0
    
    
    
    var bat1_Player_ID = 0
    var bat2_Player_ID = 0
    var bat3_Player_ID = 0
    
    
    var ar1_Player_ID = 0
    var ar2_Player_ID = 0
    var ar3_Player_ID = 0
    
    var wkArray = [PlayerDetail]()
    var batArray = [PlayerDetail]()
    var bowlArray = [PlayerDetail]()
    var allArray = [PlayerDetail]()
    var ball1_Player_ID = 0
    var ball2_Player_ID = 0
    var ball3_Player_ID = 0
    
    var teamInfo: MyTeamResponses?
    
    var wkArrayList = [PlayerListResponses]()
    var batArrayList = [PlayerListResponses]()
    var bowlArrayList = [PlayerListResponses]()
    var allArrayList = [PlayerListResponses]()
    var allRounder = [LeaderBoardPlayerDetail]()
    var defender = [LeaderBoardPlayerDetail]()
    var raider = [LeaderBoardPlayerDetail]()
    var contestData: GetMatchDetails?
    var contestLive:MyContestLiveLeagues?
    var teamId = 0
    var teamID = 0
    var challengeID = 0
    var isFromLeaderBoard = false
    var isFromCreateTEam = false
    var matchKey = ""
    var selectedIndex = -1
    var captainID:String?
    var viceCaptianID:String?
    var c = 0
    var v = 0
    var vcID = 0
    var cId = 0
    var myTeamsData = [MyTeamResponses]() {
        didSet {
            getTeamInfo()
        }
    }
    var leaderBoardTeamArray :LeaderBoardKabaddiDetail? {
        didSet {
            getTeamInfo()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? TeamViewController {
            viewControllerB.fromPreview = comingromFromPReview
            //Do what you want in here!
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //   aRefreshButton.isHidden = true
        // aEditButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNavigationBar(navigationTitle: "KK", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
        setupUI()
        setContestData()
        if isFromLeaderBoard {
            getLeaderBoardTeams()
        }
        else if isComingFromMyteam {
            setupPReviewForMyTeam(data: (getTeamResponse!))
        }
        else  {
            setupPreviewTeamFromCreate()
        }
    }
    
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        if isFromLeaderBoard {
            getLeaderBoardTeams()
        } else {
            getMyTeamsData()
        }
    }
    
    fileprivate func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        awk3ContainerView.isHidden = true
        awk2ContainerView.isHidden = true
        awk1ContainerView.isHidden = true
        
        aAR1ContainerView.isHidden = true
        aAR2ContainerView.isHidden = true
        aAR3ContainerView.isHidden = true
        
        aBat1ContainerView.isHidden = true
        aBat2ContainerView.isHidden = true
        aBat3ContainerView.isHidden = true
        
        //    aBat6ContainerView.isHidden = true
        
        
        
        //   aBallContainerView6.isHidden  = true
        
        
        awk3CaptianLbl.isHidden = true
        awk2CaptainLbl.isHidden = true
        awkCaptainLbl.isHidden = true
        
        aAR1CaptainLabel.isHidden = true
        aAR2CaptainLabel.isHidden = true
        aAR3CaptainLabel.isHidden = true
        
        
        aBat1CaptainLabel.isHidden = true
        aBat2CaptainLabel.isHidden = true
        aBat3CaptainLabel.isHidden = true
        
        //  aBat6CaptianLbl.isHidden = true
        
        
        
        
        awk3CaptianLbl.setCornerRadius(value: 10)
        awk2CaptainLbl.setCornerRadius(value: 10)
        awkCaptainLbl.setCornerRadius(value: 10)
        
        aAR1CaptainLabel.setCornerRadius(value: 10)
        aAR2CaptainLabel.setCornerRadius(value: 10)
        aAR3CaptainLabel.setCornerRadius(value: 10)
        aBat1CaptainLabel.setCornerRadius(value: 10)
        aBat2CaptainLabel.setCornerRadius(value: 10)
        aBat3CaptainLabel.setCornerRadius(value: 10)
        
    }
    
    fileprivate func setContestData() {
        aTeamNameLabel.text = teamName
        if let contest = getContestDetail  {
            matchKey = contest.matchkey ?? ""
        }
        if let contest = contestData  {
            matchKey = contest.matchkey ?? ""
        }
    }
    
    fileprivate func getMyTeamsData() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache"
        ]
        let parameters = ["userid": UserDefaults.standard.object(forKey: kUserId) ?? -1,"matchkey": matchKey] as [String : Any]
        
        NetworkManager.post_Request(urlService: kMyTeamURL, param: parameters, head: headers) { (response) in
            self.hideActivityIndicator()
            do {
                if response != nil {
                    let teamRespons =  try JSON(data:response as! Data)
                    
                    //                 let list = MyCatagries(json: json)
                    
                    let results = teamRespons["result"]
                    let cat = results["teams"]
                    //
                    self.myTeamsData.removeAll()
                    for arr in cat.arrayValue{
                        self.myTeamsData.append(MyTeamResponses(json:arr))
                        
                    }
                }
            } catch {
                Loader.showAlert(message: "Status code 500: server internal error")
            }
            
        }
    }
    fileprivate func setupPReviewForMyTeam(data:MyTeamResponses) {
        //        aTeamNameLabel.text = teamName
        croosBtn.isHidden = true
        editLbl.isHidden = false
        aEditButton.isHidden   = false
        editView.isHidden = false
        editImageView.isHidden = false
        if let players = data.players {
            
            for player in players {
                arrayOFSelectedPlayer.append(player.id ?? 0)
                if player.captain == 1 {
                    self.vcID = player.id ?? 0
                }
                if player.vicecaptain == 1 {
                    self.cId = player.id ?? 0
                }
                
                if player.role == "defender" {
                    
                    batArray.append(player)
                }
                if player.role == "raider" {
                    allArray.append(player)
                }
                
                if player.role == "allrounder" {
                    wkArray.append(player)
                }
            }
        }
        setWKData()
        
        setAllData()
        setBatData()
        
        
    }
    fileprivate func setWKData() {
        for (index,player) in wkArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    wk1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk1NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk1UIView.backgroundColor = .black
                    awk1NameLbl.backgroundColor = .black
                }
                wk1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk1NameLbl.text = sortName
                }
                //                            awk1NameLbl.text = player.name ?? ""
                awk1PointLbl.text = "\(player.credit ?? "") cr."
                awk1ContainerView.isHidden = false
               
                if player.captain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "C"
                    awkCaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                    awkCaptainLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
            //                            }
            case 1:
                wkeeperStackView.spacing = 100
                if player.team == "team1" {
                    wk2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk2NameLBl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk2UIView.backgroundColor = .black
                    awk2NameLBl.backgroundColor = .black
                }
                wk2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk2NameLBl.text = sortName
                }
                //                            awk2NameLBl.text = player.name ?? ""
                awk2PointLabel.text = "\(player.credit ?? "") cr."
                awk2ContainerView.isHidden = false
               
                if player.captain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "C"
                    awk2CaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awk2CaptainLbl.backgroundColor = .black
                }
                //                            if let imagePath = player.image {
                //                                let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                //
                //                                let imageUrl = URL(string: urlString1 ?? "")
                //                                aWk2ImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "sample"), options: .continueInBackground) { (img, err, cacheType, url) in
                //                                }
                //                                if aWk2ImageView == nil {
                //                                   aWk2ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                //                                }
            //                            }
            case 2:
                wkeeperStackView.spacing = 80
                if player.team == "team1" {
                    wk3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk3NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk3NameLbl.backgroundColor = .black
                }
                wk3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk3NameLbl.text = sortName
                }
                //                            awk3NameLbl.text = player.name ?? ""
                awk3PointLbl.text = "\(player.credit ?? "") cr."
                awk3ContainerView.isHidden = false
               
                if player.captain == 1 {
                    
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "C"
                    awk3CaptianLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                    awk3CaptianLbl.backgroundColor = .black
                }
                //                            if let imagePath = player.image {
                //                                let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                //
                //                                let imageUrl = URL(string: urlString1 ?? "")
                //                                awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "sample"), options: .continueInBackground) { (img, err, cacheType, url) in
                //                                }
                //                                if awk3ImageView == nil {
                //                                   awk3ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                //                                }
                //                            }
                
            default:break
                
            }
        }
    }
    
    fileprivate func setBatData() {
        for (index,player) in batArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    bat1UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat1UiView.backgroundColor = .black
                    aBat1NameLabel.backgroundColor = .black
                }
                bat1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat1NameLabel.text = sortName
                }
                //                aBat1NameLabel.text = player.name ?? ""
                aBat1PointLabel.text = "\(player.credit ?? "") cr."
                aBat1ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "C"
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    
                }
                if player.vicecaptain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                    aBat1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                 batStackView.spacing = 100
                if player.team == "team1" {
                    bat2UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat2UiView.backgroundColor = .black
                    aBat2NameLabel.backgroundColor = .black
                }
                bat2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat2NameLabel.text = sortName
                }
                //                aBat2NameLabel.text = player.name ?? ""
                aBat2PointLabel.text = "\(player.credit ?? "") cr."
                aBat2ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "C"
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                batStackView.spacing = 80
                if player.team == "team1" {
                    bat3UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat3UiView.backgroundColor = .black
                    aBat3NameLabel.backgroundColor = .black
                }
                bat3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat3NameLabel.text = sortName
                }
                //                aBat3NameLabel.text = player.name ?? ""
                aBat3PointLabel.text = "\(player.credit ?? "") cr."
                aBat3ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "C"
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                    aBat3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    
    fileprivate func setAllData() {
        for (index,player) in allArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    all1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all1UIView.backgroundColor = .black
                    aAR1NameLabel.backgroundColor = .black
                }
                ar1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR1NameLabel.text = sortName
                }
                
                //                aAR1NameLabel.text = player.name ?? ""
                aAR1PointLabel.text = "\(player.credit ?? "") cr."
                aAR1ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "C"
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                    aAR1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                allRounderStackView.spacing = 100
                if player.team == "team1" {
                    all2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all2UIView.backgroundColor = .black
                    aAR2NameLabel.backgroundColor = .black
                }
                ar2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR2NameLabel.text = sortName
                }
                //                aAR2NameLabel.text = player.name ?? ""
                aAR2PointLabel.text = "\(player.credit ?? "") cr."
                aAR2ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "C"
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                allRounderStackView.spacing = 80
                if player.team == "team1" {
                    all3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all3UIView.backgroundColor = .black
                    aAR3NameLabel.backgroundColor = .black
                }
                ar3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR3NameLabel.text = sortName
                }
                //                aAR3NameLabel.text = player.name ?? ""
                aAR3PointLabel.text = "\(player.credit ?? "") cr."
                aAR3ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "C"
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                    aAR3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
                
            default:
                break
            }
        }
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        openEditVc(arryOfPlayer :arrayOFSelectedPlayer,viceCaptainID : vcID,captainID :cId,teamIDs:teamId)
    }
    func openEditVc(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int){
        openViewController(controller: KABADDITeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
            vc.arrayOFPlayer  = arryOfPlayer
            vc.contestData = self.contestData
            vc.viceCaptian = viceCaptainID
            vc.Captain = captainID
            vc.teamId = teamIDs
            vc.fromEditVC = true
            vc.matchKey = self.matchKey
            vc.fromPreview = false
            vc.contestLiveData = self.contestLive
        })
    }
    @IBAction func crossBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "KABADDITeamViewController") as! KABADDITeamViewController
        vc.fromPreview = true
        delegate?.checkFrom(check: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func getLeaderBoardTeams() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "Authorization" : "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDY1ODE4MCwiZXhwIjoxNTY0NjYxNzgwLCJuYmYiOjE1NjQ2NTgxODAsImp0aSI6IkhGMlJqeG91ZzhiUXhwN1IiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.8WU1ibQPqfzrXDprmQP277lRw1LVuGTNdQBf8kdkmCY",
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? -1, "challenge": challengeID,"teamid": teamId,"sport_key":"KABADDI"] as [String : Any]
            
            NetworkManager.post_Request2(urlService: KShowTeamOnGround, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let jsonData = try JSON(data:response as! Data)
                        let status = jsonData["status"].intValue
                        let message = jsonData["message"].stringValue
                        let result = jsonData["result"]
                        
                        if status == 1 {
                            self.leaderBoardTeamArray = LeaderBoardKabaddiDetail(json: result)
                            
                        }
                        else {
                            Loader.showToast(message: message, onView: self.view, bottomMargin: 0, color: UIColor(red: 240, green: 75, blue: 80))
                        }
                    }
                } catch {
                    Loader.showAlert(message: "Status code 500: server internal error")
                }
            }
        }
    }
    fileprivate func setupPreviewTeamFromCreate() {
        croosBtn.isHidden = false
        editLbl.isHidden = true
        aEditButton.isHidden = true
        editView.isHidden = true
        editImageView.isHidden = true
        for player in APP_DEL.kabbaddiChoosedTeamArray {
            
            if player.role == "defender" {
                batArrayList.append(player)
            }
            if player.role == "raider" {
                allArrayList.append(player)
            }
            if player.role == "allrounder" {
                wkArrayList.append(player)
            }
            
        }
        
        
        setWKDataList()
        setBatDataList()
        setAllDataList()
        
        
    }
    func getTeamInfo() {
        if isFromLeaderBoard {
            setupPreviewDataForLeaderBoardTeams()
            //  aEditButton.isHidden = true
            
            // aRefreshButton.isHidden = false
            aEditButton.isHidden = true
            editView.isHidden = true
            editLbl.isHidden = true
            editImageView.isHidden = true
            croosBtn.isHidden = false
        } else {
            if myTeamsData.count != 0 {
                teamInfo = myTeamsData[selectedIndex]
                setupPreviewDataForTeams()
                //  aEditButton.isHidden = false
                
                //aRefreshButton.isHidden = true
            }
        }
    }
    
    
    
    fileprivate func setupPreviewDataForTeams() {
        //              let teamNumber = teamInfo?.teamnumber
        //              aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        //              if let playerData = teamInfo?.players {
        //                  setupPreviewTeam(players: playerData)
        //              }
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        delegate?.checkFrom(check: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    fileprivate func setupPreviewDataForLeaderBoardTeams() {
        let teamNumber = leaderBoardTeamArray?.teamnumber
        aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        if let wkData = leaderBoardTeamArray?.allrounder {
            allRounder = wkData
        }
        if let allData = leaderBoardTeamArray?.raider {
            raider = allData
        }
        
        if let wkData = leaderBoardTeamArray?.defender {
            defender = wkData
        }
        setWKDataLeaderBoard()
        setBatDataLeaderBoard()
        setAllDataLeaderBoard()
        
    }
    fileprivate func setWKDataLeaderBoard() {
        for (index,player) in allRounder.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    wk1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk1NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk1UIView.backgroundColor = .black
                    awk1NameLbl.backgroundColor = .black
                }
                wk1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk1NameLbl.text = sortName
                }
                
                awk1PointLbl.text = "\(player.credit ?? "") cr."
                awk1ContainerView.isHidden = false
                if player.captain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "C"
                    awkCaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                    awkCaptainLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                wkeeperStackView.spacing = 100
                if player.team == "team1" {
                    wk2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk2NameLBl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk2UIView.backgroundColor = .black
                    awk2NameLBl.backgroundColor = .black
                }
                wk2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk2NameLBl.text = sortName
                }
                //                                awk2NameLBl.text = player.name ?? ""
                awk2PointLabel.text = "\(player.credit ?? "") cr."
                awk2ContainerView.isHidden = false
                
                if player.captain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "C"
                    awk2CaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awk2CaptainLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWk2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
            //
            case 2:
                wkeeperStackView.spacing = 80
                if player.team == "team1" {
                    wk3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk3NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk3UIView.backgroundColor = .black
                    awk3NameLbl.backgroundColor = .black
                }
                wk3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk3NameLbl.text = sortName
                }
                //                                awk3NameLbl.text = player.name ?? ""
                awk3PointLbl.text = "\(player.credit ?? "") cr."
                awk3ContainerView.isHidden = false
                
                if player.captain == 1 {
                    
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "C"
                    awk3CaptianLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                    awk3CaptianLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
                
            default:break
                
            }
        }
        
    }
    
    fileprivate func setAllDataLeaderBoard() {
        for (index,player) in raider.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    all1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all1UIView.backgroundColor = .black
                    aAR1NameLabel.backgroundColor = .black
                }
                ar1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR1NameLabel.text = sortName
                }
                //                    aAR1NameLabel.text = player.name ?? ""
                aAR1PointLabel.text = "\(player.credit ?? "") cr."
                aAR1ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "C"
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                    aAR1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                allRounderStackView.spacing = 100
                if player.team == "team1" {
                    all2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all2UIView.backgroundColor = .black
                    aAR2NameLabel.backgroundColor = .black
                }
                ar2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR2NameLabel.text = sortName
                }
                //                    aAR2NameLabel.text = player.name ?? ""
                aAR2PointLabel.text = "\(player.credit ?? "") cr."
                aAR2ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "C"
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 2:
                allRounderStackView.spacing = 80
                if player.team == "team1" {
                    all3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all3UIView.backgroundColor = .black
                    aAR3NameLabel.backgroundColor = .black
                }
                ar3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR3NameLabel.text = sortName
                }
                //                    aAR3NameLabel.text = player.name ?? ""
                aAR3PointLabel.text = "\(player.credit ?? "") cr."
                aAR3ContainerView.isHidden = false
                if player.captain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "C"
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                    aAR3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setBatDataLeaderBoard() {
        for (index,player) in defender.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    bat1UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat1UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat1NameLabel.backgroundColor = .black
                }
                bat1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat1NameLabel.text = sortName
                }
                //                    aBat1NameLabel.text = player.name ?? ""
                aBat1PointLabel.text = "\(player.credit ?? "") cr."
                aBat1ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "C"
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    
                }
                if player.vicecaptain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                    aBat1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 1:
                  batStackView.spacing = 100
                if player.team == "team1" {
                    bat2UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat2UiView.backgroundColor = .black
                    aBat2NameLabel.backgroundColor = .black
                }
                bat2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat2NameLabel.text = sortName
                }
                //                    aBat2NameLabel.text = player.name ?? ""
                aBat2PointLabel.text = "\(player.credit ?? "") cr."
                aBat2ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "C"
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                batStackView.spacing = 80
                if player.team == "team1" {
                    bat3UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat3UiView.backgroundColor = .black
                    aBat3NameLabel.backgroundColor = .black
                }
                bat3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat3NameLabel.text = sortName
                }
                //                    aBat3NameLabel.text = player.name ?? ""
                aBat3PointLabel.text = "\(player.credit ?? "") cr."
                aBat3ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "C"
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                    aBat3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setWKDataList() {
        for (index,player) in wkArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    wk1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk1NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk1UIView.backgroundColor = .black
                    awk1NameLbl.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk1NameLbl.text = sortName
                }
                //                            wk1_Player_ID = player.id ?? 0
                //                            awk1NameLbl.text = player.name ?? ""
                awk1PointLbl.text = "\(player.credit ?? "") cr."
                awk1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "C"
                    awkCaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                    awkCaptainLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
            case 1:
                wkeeperStackView.spacing = 100
                if player.team == "team1" {
                    wk2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk2NameLBl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk2UIView.backgroundColor = .black
                    awk2NameLBl.backgroundColor = .black
                }
                wk2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk2NameLBl.text = sortName
                }
                //                            awk2NameLBl.text = player.name ?? ""
                awk2PointLabel.text = "\(player.credit ?? "") cr."
                awk2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "C"
                    awk2CaptainLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awk2CaptainLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWk2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                  wkeeperStackView.spacing = 80
                if player.team == "team1" {
                    wk3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    awk3NameLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    wk3UIView.backgroundColor = .black
                    awk3NameLbl.backgroundColor = .black
                }
                wk3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk3NameLbl.text = sortName
                }
                //                            awk3NameLbl.text = player.name ?? ""
                awk3PointLbl.text = "\(player.credit ?? "") cr."
                awk3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "C"
                    awk3CaptianLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                    awk3CaptianLbl.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                
            default:break
                
            }
        }
        
    }
    
    fileprivate func setAllDataList() {
        for (index,player) in allArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    all1UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all1UIView.backgroundColor = .black
                    aAR1NameLabel.backgroundColor = .black
                }
                ar1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR1NameLabel.text = sortName
                }
                //                  aAR1NameLabel.text = player.name ?? ""
                aAR1PointLabel.text = "\(player.credit ?? "") cr."
                aAR1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "C"
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                    aAR1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR1ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR1ImageView == nil {
                    //                        aAR1ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                    }
                }
                
            case 1:
                allRounderStackView.spacing = 100
                if player.team == "team1" {
                    all2UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all2UIView.backgroundColor = .black
                    aAR2NameLabel.backgroundColor = .black
                }
                ar2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR2NameLabel.text = sortName
                }
                //                  aAR2NameLabel.text = player.name ?? ""
                aAR2PointLabel.text = "\(player.credit ?? "") cr."
                aAR2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if  temp == self.captainID {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "C"
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR2ImageView == nil {
                    //                        aAR2ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                    }
                }
                
            case 2:
                  allRounderStackView.spacing = 80
                if player.team == "team1" {
                    all3UIView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aAR3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    all3UIView.backgroundColor = .black
                    aAR3NameLabel.backgroundColor = .black
                }
                ar3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aAR3NameLabel.text = sortName
                }
                //                  aAR3NameLabel.text = player.name ?? ""
                aAR3PointLabel.text = "\(player.credit ?? "") cr."
                aAR3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "C"
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == viceCaptianID {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                    aAR3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR3ImageView == nil {
                    //                        aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setBatDataList() {
        for (index,player) in batArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    bat1UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat1UiView.backgroundColor = .black
                    aBat1NameLabel.backgroundColor = .black
                }
                bat1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat1NameLabel.text = sortName
                }
                //                aBat1NameLabel.text = player.name ?? ""
                aBat1PointLabel.text = "\(player.credit ?? "") cr."
                aBat1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                
                if temp ==  self.captainID {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "C"
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp ==  self.viceCaptianID{
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                    aBat1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
                //                }
                
            case 1:
                batStackView.spacing = 100
                if player.team == "team1" {
                    bat2UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat2UiView.backgroundColor = .black
                    aBat2NameLabel.backgroundColor = .black
                }
                bat2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat2NameLabel.text = sortName
                }
                //                aBat2NameLabel.text = player.name ?? ""
                aBat2PointLabel.text = "\(player.credit ?? "") cr."
                aBat2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "C"
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                batStackView.spacing = 80
                if player.team == "team1" {
                    bat3UiView.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBat3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    bat3UiView.backgroundColor = .black
                    aBat3NameLabel.backgroundColor = .black
                }
                bat3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat3NameLabel.text = sortName
                }
                //                aBat3NameLabel.text = player.name ?? ""
                aBat3PointLabel.text = "\(player.credit ?? "") cr."
                aBat3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "C"
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                    aBat3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    @IBAction func aEditButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
        vc.fromPreview = true
        //              delegate?.checkFrom(check: true)(check: true)
        self.navigationController?.popViewController(animated: true)
        //        openViewController(controller: EditCloneTeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
        //            if self.isFromLeaderBoard {
        //                vc.contestData = self.contestData
        //                let teamNum = self.leaderBoardTeamArray[0].teamnumber
        //                vc.teamNumber = "\(teamNum ?? 999)"
        //                vc.teamId = self.teamId
        //            } else {
        //                vc.contestData = self.contestData
        //                let teamNum = self.teamInfo?.teamnumber
        //                vc.teamNumber = "\(teamNum ?? 999)"
        //                vc.teamId = self.teamId
        //            }
        //        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func handleBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func unwindToMyTeamsFromPowerPlay(segue: UIStoryboardSegue) {
        if isFromLeaderBoard {
            getLeaderBoardTeams()
        } else {
            getMyTeamsData()
        }
    }
}
