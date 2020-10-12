//
//  PreviewViewController.swift
//  Club11
//
//  Created by Developer on 08/06/19.
//

import UIKit
import SwiftyJSON

protocol sendPreviewDetail {
    func checkComingFromPReview (check :Bool)
}
class PreviewViewController: BaseClass {
    
    @IBOutlet weak var teamNameLbl: UILabel!
    
    @IBOutlet weak var bottomTotalPointView: UIView!
    @IBOutlet weak var totalPointsLbl: UILabel!
    @IBOutlet weak var batView3: UIView!
    @IBOutlet weak var batView4: UIView!
    @IBOutlet weak var batView5: UIView!
    @IBOutlet weak var batView2: UIView!
    @IBOutlet weak var batView1: UIView!
    
    @IBOutlet weak var bowlMensStackView: UIStackView!
    @IBOutlet weak var allRounderStackView: UIStackView!
    @IBOutlet weak var batMenStackView: UIStackView!
    @IBOutlet weak var wkKeeperStackView: UIStackView!
    @IBOutlet weak var wkView1: UIView!
    @IBOutlet weak var wkView2: UIView!
    @IBOutlet weak var wkView3: UIView!
    @IBOutlet weak var wkView4: UIView!
    
    @IBOutlet weak var allView1: UIView!
    @IBOutlet weak var allView2: UIView!
    @IBOutlet weak var allView3: UIView!
    @IBOutlet weak var allView4: UIView!
    
    @IBOutlet weak var ballView6: UIView!
    
    
    @IBOutlet weak var ballView2: UIView!
    @IBOutlet weak var ballView1: UIView!
    @IBOutlet weak var ballView3: UIView!
    @IBOutlet weak var ballView4: UIView!
    @IBOutlet weak var ballView5: UIView!
    var getContestDetail:GetMatchDetails?
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var EditBtn: UIButton!
    @IBOutlet weak var EditImageVew: UIImageView!
    @IBOutlet weak var editLbl: UILabel!
    var teamName:String?
    @IBOutlet weak var teamLblName: UILabel!
    
    @IBOutlet weak var aWK4CaptainLabel: UILabel!
    @IBOutlet weak var aWK4ContainerView: UIView!
    @IBOutlet weak var aWK4ImageView: UIImageView!
    @IBOutlet weak var aWKName4Label: UILabel!
    @IBOutlet weak var aWK4PointLabel: UILabel!
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
    @IBOutlet weak var aBat4CaptainLabel: UILabel!
    @IBOutlet weak var aBat4ContainerView: UIView!
    @IBOutlet weak var aBat4ImageView: UIImageView!
    @IBOutlet weak var aBat4NameLabel: UILabel!
    @IBOutlet weak var aBat4PointLabel: UILabel!
    @IBOutlet weak var aBat5CaptainLabel: UILabel!
    @IBOutlet weak var aBat5ContainerView: UIView!
    @IBOutlet weak var aBat5ImageView: UIImageView!
    @IBOutlet weak var aBat5NameLabel: UILabel!
    @IBOutlet weak var aBat5PointLabel: UILabel!
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
    @IBOutlet weak var aR4NameLabel: UILabel!
    @IBOutlet weak var aR4ImageView: UIImageView!
    @IBOutlet weak var aR4CaptainLbl: UILabel!
    @IBOutlet weak var aR4PointLable: UILabel!
    @IBOutlet weak var aR4ContainerView: UIView!
    
    @IBOutlet weak var aBall1CaptainLabel: UILabel!
    @IBOutlet weak var aBall1ContainerView: UIView!
    @IBOutlet weak var aBall1ImageView: UIImageView!
    @IBOutlet weak var aBall1NameLabel: UILabel!
    @IBOutlet weak var aBall1PointLabel: UILabel!
    @IBOutlet weak var aBall2CaptainLabel: UILabel!
    @IBOutlet weak var aBall2ContainerView: UIView!
    @IBOutlet weak var aBall2ImageView: UIImageView!
    @IBOutlet weak var aBall2NameLabel: UILabel!
    @IBOutlet weak var aBall2PointLabel: UILabel!
    @IBOutlet weak var aBall3CaptainLabel: UILabel!
    @IBOutlet weak var aBall3ContainerView: UIView!
    @IBOutlet weak var aBall3ImageView: UIImageView!
    @IBOutlet weak var aBall3NameLabel: UILabel!
    @IBOutlet weak var aBall3PointLabel: UILabel!
    @IBOutlet weak var aBall4CaptainLabel: UILabel!
    @IBOutlet weak var aBall4ContainerView: UIView!
    @IBOutlet weak var aBall4ImageView: UIImageView!
    @IBOutlet weak var aBall4NameLabel: UILabel!
    @IBOutlet weak var aBall4PointLabel: UILabel!
    @IBOutlet weak var aBall5CaptainLabel: UILabel!
    @IBOutlet weak var aBall5ContainerView: UIView!
    @IBOutlet weak var aBall5ImageView: UIImageView!
    @IBOutlet weak var aBall5NameLabel: UILabel!
    @IBOutlet weak var aBall5PointLabel: UILabel!
   
    @IBOutlet weak var aball6ImageView: UIImageView!
    @IBOutlet weak var aBall6NameLb: UILabel!
    @IBOutlet weak var aBall6PointLbl: UILabel!
    @IBOutlet weak var aBall6CaptainLbl: UILabel!
    
    @IBOutlet weak var aBall6ContainerView: UIView!
    @IBOutlet weak var aBat6PointLbl: UILabel!
    @IBOutlet weak var aBat6CaptianLbl: UILabel!
    
    @IBOutlet weak var aBat6NameLbl: UILabel!
    @IBOutlet weak var aBat6ImageView: UIImageView!
    @IBOutlet weak var aBat6ContainerView: UIView!
    
    @IBOutlet weak var aTeamNameLabel: UILabel!
    //  @IBOutlet weak var aRefreshButton: UIButton!
    
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
    
    @IBOutlet weak var batView6: UIView!
    var arrayOFSelectedPlayer = [Int]()
    var comingromFromPReview = false
    var delegate:sendPreviewDetail?
    var getTeamResponse:MyTeamResponses?
    var contestLiveData:MyContestLiveLeagues?
    var isComingFromMyteam = false
    var isFromEditClone = false
    var teamID  = 0
    
    var wk1_Player_ID = 0
    var wk2_Player_ID = 0
    var wk3_Player_ID = 0
    var wk4_Player_ID = 0
    
    
    var bat1_Player_ID = 0
    var bat2_Player_ID = 0
    var bat3_Player_ID = 0
    var bat4_Player_ID = 0
    var bat5_Player_ID = 0
    var bat6_Player_ID = 0
    
    var ar1_Player_ID = 0
    var ar2_Player_ID = 0
    var ar3_Player_ID = 0
    var ar4_Player_ID = 0
    
    var ball1_Player_ID = 0
    var ball2_Player_ID = 0
    var ball3_Player_ID = 0
    var ball4_Player_ID = 0
    var ball5_Player_ID = 0
    var ball6_Player_ID = 0
    
    var wkArrayList = [PlayerListResponses]()
    var batArrayList = [PlayerListResponses]()
    var bowlArrayList = [PlayerListResponses]()
    var allArrayList = [PlayerListResponses]()
    
    var checkEditVc =  false
    var teamInfo: MyTeamResponses?
    var wkArray = [PlayerDetail]()
    var batArray = [PlayerDetail]()
    var bowlArray = [PlayerDetail]()
    var allArray = [PlayerDetail]()
    var wkArrayLeaderboard = [LeaderBoardPlayerDetail]()
    var batArrayLeaderboard = [LeaderBoardPlayerDetail]()
    var bowlArrayLeaderboard = [LeaderBoardPlayerDetail]()
    var allArrayLeaderboard = [LeaderBoardPlayerDetail]()
    var contestData: Any?
    var teamId = 0
    var challengeID = 0
    var isFromLeaderBoard = false
    var isFromCreateTEam = false
    var matchKey = ""
    var selectedIndex = -1
    var captainID:String?
    var viceCaptianID:String?
    var vcID = 0
    var cId = 0
    var c = 0
    var v = 0
    var myTeamsData = [MyTeamResponses]() {
        didSet {
            getTeamInfo()
        }
    }
    var leaderBoardTeamArray :LeaderBoardDetail? {
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
        aWK4ContainerView.isHidden = true
        aAR1ContainerView.isHidden = true
        aAR2ContainerView.isHidden = true
        aAR3ContainerView.isHidden = true
        aR4ContainerView.isHidden = true
        aBat1ContainerView.isHidden = true
        aBat2ContainerView.isHidden = true
        aBat3ContainerView.isHidden = true
        aBat4ContainerView.isHidden = true
        aBat5ContainerView.isHidden = true
        aBat6ContainerView.isHidden = true
//        awk1ImageView.layer.borderWidth = 1.0
//        awk1ImageView.layer.masksToBounds = false
//        awk1ImageView.layer.borderColor = UIColor.white.cgColor
//        awk1ImageView.layer.cornerRadius = awk1ImageView.frame.size.width/2
//        awk1ImageView.clipsToBounds = true
//        aWk2ImageView.layer.borderWidth = 1.0
//        aWk2ImageView.layer.masksToBounds = false
//        aWk2ImageView.layer.borderColor = UIColor.white.cgColor
//        aWk2ImageView.layer.cornerRadius = aWk2ImageView.frame.size.width/2
//        aWk2ImageView.clipsToBounds = true
//        awk3ImageView.layer.masksToBounds = false
//        awk3ImageView.layer.borderColor = UIColor.white.cgColor
//        awk3ImageView.layer.cornerRadius = awk3ImageView.frame.size.width/2
//        awk3ImageView.clipsToBounds = true
//        aWK4ImageView.layer.masksToBounds = false
//        aWK4ImageView.layer.borderColor = UIColor.white.cgColor
//        aWK4ImageView.layer.cornerRadius = aWK4ImageView.frame.size.width/2
        
//        aBall1ImageView.layer.masksToBounds = false
//        aBall1ImageView.layer.borderColor = UIColor.white.cgColor
//        aBall1ImageView.layer.cornerRadius = aBall1ImageView.frame.size.width/2
//
//        aBall2ImageView.layer.masksToBounds = false
//        aBall2ImageView.layer.borderColor = UIColor.white.cgColor
//            aBall2ImageView.layer.cornerRadius = aBall2ImageView.frame.size.width/2
//
//        aBall3ImageView.layer.masksToBounds = false
//        aBall3ImageView.layer.borderColor = UIColor.white.cgColor
//            aBall3ImageView.layer.cornerRadius = aBall3ImageView.frame.size.width/2
//
//        aBall4ImageView.layer.masksToBounds = false
//        aBall4ImageView.layer.borderColor = UIColor.white.cgColor
//            aBall4ImageView.layer.cornerRadius = aBall4ImageView.frame.size.width/2
//
//        aBall5ImageView.layer.masksToBounds = false
//              aBall5ImageView.layer.borderColor = UIColor.white.cgColor
//                  aBall5ImageView.layer.cornerRadius = aBall5ImageView.frame.size.width/2
//
//        aball6ImageView.layer.masksToBounds = false
//        aball6ImageView.layer.borderColor = UIColor.white.cgColor
//        aball6ImageView.layer.cornerRadius = aball6ImageView.frame.size.width/2
//
//        aBat5ImageView.layer.masksToBounds = false
//              aBat5ImageView.layer.borderColor = UIColor.white.cgColor
//               aBat5ImageView.layer.cornerRadius = aBat5ImageView.frame.size.width/2
//
//        aBat6ImageView.layer.masksToBounds = false
//        aBat6ImageView.layer.borderColor = UIColor.white.cgColor
//         aBat6ImageView.layer.cornerRadius = aBat6ImageView.frame.size.width/2
        aWK4ImageView.clipsToBounds = true
        aBall1ContainerView.isHidden = true
        aBall2ContainerView.isHidden = true
        aBall3ContainerView.isHidden = true
        aBall4ContainerView.isHidden = true
        aBall5ContainerView.isHidden = true
        aBall6ContainerView.isHidden  = true
        aBat6ContainerView.isHidden = true
        aWK4CaptainLabel.isHidden = true
        awk3CaptianLbl.isHidden = true
        awk2CaptainLbl.isHidden = true
        awkCaptainLbl.isHidden = true
        
        aAR1CaptainLabel.isHidden = true
        aAR2CaptainLabel.isHidden = true
        aAR3CaptainLabel.isHidden = true
        aR4CaptainLbl.isHidden = true
        
        aBat1CaptainLabel.isHidden = true
        aBat2CaptainLabel.isHidden = true
        aBat3CaptainLabel.isHidden = true
        aBat4CaptainLabel.isHidden = true
        aBat5CaptainLabel.isHidden = true
        aBat6CaptianLbl.isHidden = true
        
        aBall1CaptainLabel.isHidden = true
        aBall2CaptainLabel.isHidden = true
        aBall3CaptainLabel.isHidden = true
        aBall4CaptainLabel.isHidden = true
        aBall5CaptainLabel.isHidden = true
        aBall6CaptainLbl.isHidden = true
        //   aBall6CaptainLbl.isHidden = true
        // aWK4CaptainLabel.isHidden = true
        
        aWK4CaptainLabel.setCornerRadius(value: 10)
        awk3CaptianLbl.setCornerRadius(value: 10)
        awk2CaptainLbl.setCornerRadius(value: 10)
        awkCaptainLbl.setCornerRadius(value: 10)
        
        aAR1CaptainLabel.setCornerRadius(value: 10)
        aAR2CaptainLabel.setCornerRadius(value: 10)
        aAR3CaptainLabel.setCornerRadius(value: 10)
        aBat1CaptainLabel.setCornerRadius(value: 10)
        aBat2CaptainLabel.setCornerRadius(value: 10)
        aBat3CaptainLabel.setCornerRadius(value: 10)
        aBat4CaptainLabel.setCornerRadius(value: 10)
        aBat5CaptainLabel.setCornerRadius(value: 10)
        aBall1CaptainLabel.setCornerRadius(value: 10)
        aBall2CaptainLabel.setCornerRadius(value: 10)
        aBall3CaptainLabel.setCornerRadius(value: 10)
        aBall4CaptainLabel.setCornerRadius(value: 10)
        aBall5CaptainLabel.setCornerRadius(value: 10)
    }
    
    fileprivate func setContestData() {
        if let contest = contestData as? GetMatchDetails {
            matchKey = contest.matchkey ?? ""
        }
        if let contest = contestData as? MyContestReponse {
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
    func getLeaderBoardTeams() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "Authorization" : "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDY1ODE4MCwiZXhwIjoxNTY0NjYxNzgwLCJuYmYiOjE1NjQ2NTgxODAsImp0aSI6IkhGMlJqeG91ZzhiUXhwN1IiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.8WU1ibQPqfzrXDprmQP277lRw1LVuGTNdQBf8kdkmCY",
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
            
            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? -1, "challenge": challengeID,"teamid": teamId] as [String : Any]
            
            NetworkManager.post_Request2(urlService: KShowTeamOnGround, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let jsonData = try JSON(data:response as! Data)
                        let status = jsonData["status"].intValue
                        let message = jsonData["message"].stringValue
                        let result = jsonData["result"]
                        
                        if status == 1 {
                            self.leaderBoardTeamArray = LeaderBoardDetail(json: result)
                            
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
        
        crossBtn.isHidden = false
        editLbl.isHidden = true
        EditBtn.isHidden = true
        bottomTotalPointView.isHidden = true
        EditImageVew.isHidden = true
        for player in APP_DEL.choosedTeamArray {
            if player.role == "bowler" {
                bowlArrayList.append(player)
            }
            if player.role == "batsman" {
                batArrayList.append(player)
            }
            if player.role == "allrounder" {
                allArrayList.append(player)
            }
            if player.role == "keeper" {
                wkArrayList.append(player)
            }
            
        }
        
        
        setWKDataList()
        setBatDataList()
        setAllDataList()
        setBowlDataList()
        
    }
    func getTeamInfo() {
        if isFromLeaderBoard {
            setupPreviewDataForLeaderBoardTeams()
            EditBtn.isHidden = true
            bottomTotalPointView.isHidden = true
            editLbl.isHidden = true
            EditImageVew.isHidden = true
            crossBtn.isHidden = false
            
            // aRefreshButton.isHidden = false
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
        let teamNumber = teamInfo?.teamnumber
        aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        teamNameLbl.text = "Team \(teamNumber ?? 0)"
        if let playerData = teamInfo?.players {
            setupPreviewTeam(players: playerData)
        }
    }
    
    fileprivate func setupPreviewTeam(players: [PlayerDetail]) {
        for player in players {
            if let playerType = player.role {
                switch playerType {
                case "keeper" :
                    wkArray.append(player)
                case "batsman" :
                    batArray.append(player)
                case "allrounder" :
                    allArray.append(player)
                case "bowler" :
                    bowlArray.append(player)
                default:
                    break
                }
            }
        }
        setWKData()
        setBatData()
        setAllData()
        setBowlData()
    }
    
    
    fileprivate func setupPReviewForMyTeam(data:MyTeamResponses) {
        teamLblName.text = teamName
        crossBtn.isHidden = true
        editLbl.isHidden = false
        EditBtn.isHidden = false
        bottomTotalPointView.isHidden = false
        EditImageVew.isHidden = false
        var countPlayerTotalPoint = 0.0
        if let players = data.players {
            for player in players {
                if let totalPoint = Double(player.credit ?? "0") {
                    countPlayerTotalPoint = totalPoint + countPlayerTotalPoint
                }
                
                arrayOFSelectedPlayer.append(player.id ?? 0)
                if player.captain == 1 {
                    self.vcID = player.id ?? 0
                }
                if player.vicecaptain == 1 {
                    self.cId = player.id ?? 0
                }
                if player.role == "batsman" {
                    
                    batArray.append(player)
                }
                if player.role == "allrounder" {
                    allArray.append(player)
                }
                if player.role == "bowler" {
                    bowlArray.append(player)
                }
                if player.role == "keeper" {
                    wkArray.append(player)
                }
            }
        }
        self.totalPointsLbl.text = "\(countPlayerTotalPoint)"
        setWKData()
        setBowlData()
        setAllData()
        setBatData()
        
        
    }
    fileprivate func setupPReviewForCreate(data:MyTeamResponses) {
        if let players = data.players {
            for player in players {
                
                if player.captain == 1 {
                    
                }
                if player.vicecaptain == 1 {
                    
                }
                if player.role == "batsman" {
                    
                    batArray.append(player)
                }
                if player.role == "allrounder" {
                    allArray.append(player)
                }
                if player.role == "bowler" {
                    bowlArray.append(player)
                }
                if player.role == "keeper" {
                    wkArray.append(player)
                }
            }
        }
        setWKDataList()
        setBowlDataList()
        setAllDataList()
        setBatDataList()
        
        
    }
    fileprivate func setupPreviewDataForLeaderBoardTeams() {
        
        let teamNumber = leaderBoardTeamArray?.teamnumber
        aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        teamNameLbl.text =  "Team \(teamNumber ?? 0)"
        
        if let wkData = leaderBoardTeamArray?.keeper {
            wkArrayLeaderboard = wkData
        }
        
        if let allData = leaderBoardTeamArray?.allrounder {
            allArrayLeaderboard = allData
        }
        if let wkData = leaderBoardTeamArray?.bowler {
            bowlArrayLeaderboard = wkData
        }
        if let wkData = leaderBoardTeamArray?.batsman {
            batArrayLeaderboard = wkData
        }
        setWKDataLdrboard()
        setBatDataLeaderBoard()
        setAllDataLeaderBoard()
        setBowlDataLeaderBoard()
    }
    fileprivate func setWKDataLdrboard() {
        for (index,player) in wkArrayLeaderboard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    wkView1.backgroundColor  = UIColor(red: 0, green: 64, blue: 161)
                    awk1NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk1NameLbl.textColor = UIColor.white
                } else {
                    wkView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk1NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     awk1NameLbl.textColor = UIColor.black
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
                    awkCaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awkCaptainLbl.textColor = .black
                }
                if player.vicecaptain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                    awkCaptainLbl.textColor = .white
                    awkCaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                                if awk1ImageView == nil {
                //                                   awk1ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                //                                }
            //                            }
            case 1:
                 wkKeeperStackView.spacing = 100
                if player.team == "team1" {
                    wkView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk2NameLBl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk2NameLBl.textColor = UIColor.white
                } else {
                    wkView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk2NameLBl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      awk2NameLBl.textColor = UIColor.black
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
                    
                   awk2CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk2CaptainLbl.textColor = .black
                }
                if player.vicecaptain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awk2CaptainLbl.textColor = .white
                    awk2CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
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
                wkKeeperStackView.spacing = 80
                if player.team == "team1" {
                    wkView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk3NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      awk3NameLbl.textColor = UIColor.white
                } else {
                    wkView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk3NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     awk3NameLbl.textColor = UIColor.black
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
                    awk3CaptianLbl.textColor = .black
                    awk3CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                    awk3CaptianLbl.textColor = .white
                    awk3CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
            //                            }
            case 3:
                wkKeeperStackView.spacing = 50
                if player.team == "team1" {
                    wkView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aWKName4Label.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aWKName4Label.textColor = UIColor.white
                } else {
                    wkView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aWKName4Label.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aWKName4Label.textColor = UIColor.black
                }
                wk4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aWKName4Label.text = sortName
                }
                //                                aWKName4Label.text = player.name ?? ""
                aWK4PointLabel.text = "\(player.credit ?? "") cr."
                aWK4ContainerView.isHidden = false
                
                
                if player.captain == 1 {
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "C"
                    aWK4CaptainLabel.textColor = .black
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1{
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "VC"
                    aWK4CaptainLabel.textColor = .white
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWK4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:break
                
            }
        }
    }
    
    fileprivate func setBatDataLeaderBoard() {
        for (index,player) in batArrayLeaderboard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    batView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aBat1NameLabel.textColor = UIColor.white
                } else {
                    batView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBat1NameLabel.textColor = UIColor.black
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
                    aBat1CaptainLabel.textColor = .black
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    
                }
                if player.vicecaptain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                    aBat1CaptainLabel.textColor = .white
                    aBat1CaptainLabel.backgroundColor =  UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                batMenStackView.spacing = 100
                if player.team == "team1" {
                    batView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBat2NameLabel.textColor = UIColor.white
                    aBat2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    batView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBat2NameLabel.textColor = UIColor.black
                    aBat2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat2CaptainLabel.textColor = .black
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.textColor = .white
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
//                    aBat2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                batMenStackView.spacing = 80
                if player.team == "team1" {
                    batView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBat3NameLabel.textColor = UIColor.white
                } else {
                    batView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBat3NameLabel.textColor = UIColor.black
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
                    aBat3CaptainLabel.textColor = .black
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                    aBat3CaptainLabel.textColor = .white
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
//                    aBat3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                batMenStackView.spacing = 50
                if player.team == "team1" {
                    batView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBat3NameLabel.textColor = UIColor.white
                } else {
                    batView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    
                }
                bat4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat4NameLabel.text = sortName
                }
                //                    aBat4NameLabel.text = player.name ?? ""
                aBat4PointLabel.text = "\(player.credit ?? "") cr."
                aBat4ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "C"
                    aBat4CaptainLabel.textColor = .black
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "VC"
                    aBat4CaptainLabel.textColor = .white
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
//                    aBat4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 4:
                batMenStackView.spacing = 20
                if player.team == "team1" {
                    batView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBat5NameLabel.textColor = UIColor.white
                } else {
                    batView5.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat5NameLabel.textColor = UIColor.black
                }
                bat5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat5NameLabel.text = sortName
                }
                //                    aBat5NameLabel.text = player.name ?? ""
                aBat5PointLabel.text = "\(player.credit ?? "") cr."
                aBat5ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "C"
                    aBat5CaptainLabel.textColor = .black
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "VC"
                    aBat5CaptainLabel.textColor = .white
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 5:
                 batMenStackView.spacing = 10
                if player.team == "team1" {
                    batView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat6NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBat6NameLbl.textColor = UIColor.white
                } else {
                    batView6.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat6NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat6NameLbl.textColor = UIColor.black
                }
                bat6_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat6NameLbl.text = sortName
                }
                //                    aBat5NameLabel.text = player.name ?? ""
                aBat6PointLbl.text = "\(player.credit ?? "") cr."
                aBat6ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "C"
                    aBat6CaptianLbl.textColor = .black
                                       aBat6CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aBat6CaptianLbl.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "VC"
                    aBat6CaptianLbl.textColor = .white
                                       aBat6CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat6ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            default:
                break
            }
        }
    }
    
    fileprivate func setAllDataLeaderBoard() {
        for (index,player) in allArrayLeaderboard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    allView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aAR1NameLabel.textColor = UIColor.white
                } else {
                    allView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                       aAR1NameLabel.textColor = UIColor.black
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
                    aAR1CaptainLabel.textColor = .white
                                                          aAR1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aAR1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                   aAR1CaptainLabel.textColor = .black
                                                          aAR1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
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
                    allView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                       aAR2NameLabel.textColor = UIColor.white
                } else {
                    allView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                       aAR2NameLabel.textColor = UIColor.black
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
                   aAR2CaptainLabel.textColor = .black
                                                                            aAR2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.textColor = .white
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                   
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
                    allView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aAR3NameLabel.textColor = UIColor.white
                } else {
                    allView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aAR3NameLabel.textColor = UIColor.black
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
                    aAR3CaptainLabel.textColor = .black
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
//                    aAR3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                   aAR3CaptainLabel.textColor = .white
                                       aAR3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                allRounderStackView.spacing = 50
                if player.team == "team1" {
                    allView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aR4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aR4NameLabel.textColor = UIColor.white
                } else {
                    allView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aR4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aR4NameLabel.textColor = UIColor.black
                }
                ar4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aR4NameLabel.text = sortName
                }
                //                          aAR1NameLabel.text = player.name ?? ""
                aR4PointLable.text = "\(player.credit ?? "") cr."
                aR4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "C"
                     aR4CaptainLbl.textColor = .black
                    aR4CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "VC"
                     aR4CaptainLbl.textColor = .white
                    aR4CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aR4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                      if aR4ImageView == nil {
                //                          aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                //                      }
                
            default:
                break
            }
        }
    }
    
    fileprivate func setBowlDataLeaderBoard() {
        for (index,player) in bowlArrayLeaderboard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    ballView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aBall1NameLabel.textColor = UIColor.white
                } else {
                    ballView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                       aBall1NameLabel.textColor = UIColor.black
                }
                ball1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall1NameLabel.text = sortName
                }
                
                //                    aBall1NameLabel.text = player.name ?? ""
                aBall1PointLabel.text = "\(player.credit ?? "") cr."
                aBall1ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "C"
                   aBall1CaptainLabel.textColor = .black
                    aBall1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "VC"
                     aBall1CaptainLabel.textColor = .white
                                      aBall1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall1ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                 bowlMensStackView.spacing = 100
                if player.team == "team1" {
                    ballView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aBall2NameLabel.textColor = UIColor.white
                } else {
                    ballView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall2NameLabel.textColor = UIColor.black
                }
                ball2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall2NameLabel.text = sortName
                }
                //                    aBall2NameLabel.text = player.name ?? ""
                aBall2PointLabel.text = "\(player.credit ?? "") cr."
                aBall2ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "C"
                    aBall2CaptainLabel.textColor = .black
                    aBall2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "VC"
                    aBall2CaptainLabel.textColor = .white
                    aBall2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                 bowlMensStackView.spacing = 80
                if player.team == "team1" {
                    ballView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall3NameLabel.textColor = UIColor.white

                } else {
                    ballView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall3NameLabel.textColor = UIColor.black
                }
                ball3_Player_ID = player.id ?? 0
                
                //                    aBall3NameLabel.text = player.name ?? ""
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall3NameLabel.text = sortName
                }
                
                aBall3PointLabel.text = "\(player.credit ?? "") cr."
                aBall3ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "C"
                   aBall3CaptainLabel.textColor = .black
                    aBall3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "VC"
                     aBall3CaptainLabel.textColor = .white
                    aBall3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                 bowlMensStackView.spacing = 50
                if player.team == "team1" {
                    ballView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBall4NameLabel.textColor = UIColor.white
                } else {
                    ballView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall4NameLabel.textColor = UIColor.black
                }
                ball4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall4NameLabel.text = sortName
                }
                
                //                    aBall4NameLabel.text = player.name ?? ""
                aBall4PointLabel.text = "\(player.credit ?? "") cr."
                aBall4ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "C"
                  aBall4CaptainLabel.textColor = .black
                    aBall4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "VC"
                  aBall4CaptainLabel.textColor = .white
                    aBall4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 4:
                 bowlMensStackView.spacing = 20
                if player.team == "team1" {
                    ballView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBall5NameLabel.textColor = UIColor.white
                } else {
                    ballView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBall5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall5NameLabel.textColor = UIColor.black
                    
                }
                ball5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall5NameLabel.text = sortName
                }
                //                    aBall5NameLabel.text = player.name ?? ""
                aBall5PointLabel.text = "\(player.credit ?? "") cr."
                aBall5ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "C"
                    aBall5CaptainLabel.textColor = .black
                                       aBall5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "VC"
                    aBall5CaptainLabel.textColor = .white
                                      aBall5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 5:
                 bowlMensStackView.spacing = 10
                if player.team == "team1" {
                    ballView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall6NameLb.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aBall6NameLb.textColor = UIColor.white
                } else {
                    ballView6.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aBall6NameLb.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBall6NameLb.textColor = UIColor.black
                }
                ball6_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall6NameLb.text = sortName
                }
                //                    aBall5NameLabel.text = player.name ?? ""
                aBall6PointLbl.text = "\(player.credit ?? "") cr."
                aBall6ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "C"
                    aBall6CaptainLbl.textColor = .black
                                       aBall6CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "VC"
                   aBall6CaptainLbl.textColor = .white
                    aBall6CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aball6ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            default:
                break
            }
        }
    }
    
    
    @IBAction func crossBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
        vc.fromPreview = true
        delegate?.checkComingFromPReview(check: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func EditButtonAction(_ sender: Any) {
        openEditVc(arryOfPlayer :arrayOFSelectedPlayer,viceCaptainID : vcID,captainID :cId,teamIDs:teamID)
    }
    func openEditVc(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int){
        openViewController(controller: TeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
            vc.arrayOfPlayer  = arryOfPlayer
            vc.contestData = self.getContestDetail
            vc.viceCaptainID = viceCaptainID
            vc.captainID = captainID
            vc.teamID = teamIDs
            vc.contestLiveData = self.contestLiveData
            
        })
    }
    fileprivate func setWKDataList() {
        for (index,player) in wkArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    wkView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk1NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      awk1NameLbl.textColor = UIColor.white
                } else {
                    wkView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk1NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     awk1NameLbl.textColor = UIColor.black
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
                    awkCaptainLbl.textColor = .black
                                                          awkCaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                    awkCaptainLbl.textColor = .white
                                       awkCaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                //                            if awk1ImageView == nil {
                //                            awk1ImageView.image = #imageLiteral(resourceName: "Mask Group 14")
            //                                }
            case 1:
                wkKeeperStackView.spacing = 100
                if player.team == "team1" {
                    wkView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk2NameLBl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     awk2NameLBl.textColor = UIColor.white
                } else {
                    wkView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk2NameLBl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                       awk2NameLBl.textColor = UIColor.black
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
                      awk2CaptainLbl.textColor = .black
                    awk2CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awkCaptainLbl.textColor = .white
                        awkCaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWk2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                                if aWk2ImageView == nil {
                    //                                   aWk2ImageView.image = #imageLiteral(resourceName: "Mask Group 14")
                    //                                }
                }
            case 2:
                wkKeeperStackView.spacing = 80
                if player.team == "team1" {
                    wkView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk3NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      awk3NameLbl.textColor = UIColor.white
                } else {
                    wkView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk3NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      awk3NameLbl.textColor = UIColor.black
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
                    awk3CaptianLbl.textColor = .black
                    awk3CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                    awk3CaptianLbl.textColor = .white
                    awk3CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                //                            if awk3ImageView == nil {
                //                                                              awk3ImageView.image = #imageLiteral(resourceName: "Mask Group 14")
            //                                                           }
            case 3:
                wkKeeperStackView.spacing = 50
                if player.team == "team1" {
                    wkView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aWKName4Label.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aWKName4Label.textColor = UIColor.white
                } else {
                    wkView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aWKName4Label.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aWKName4Label.textColor = UIColor.black
                }
                wk4_Player_ID = player.id ?? 0
                  aWK4PointLabel.text = "\(player.credit ?? "") cr."
//                aWKName4Label.text = player.name ?? ""
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aWKName4Label.text = sortName
                }
                //                            aWK4PointLabel.text = "\(player.credit ?? "") cr."
                aWK4ContainerView.isHidden = false
            
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "C"
                    aWK4CaptainLabel.textColor = .black
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "VC"
                   aWK4CaptainLabel.textColor = .white
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWK4ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                //                            if aWK4ImageView == nil {
                //                                                              aWK4ImageView.image = #imageLiteral(resourceName: "Mask Group 14")
            //                                                           }
            default:break
                
            }
        }
        
    }
    fileprivate func setBowlDataList() {
        for (index,player) in bowlArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    ballView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall1NameLabel.textColor = UIColor.white
                } else {
                    ballView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBall1NameLabel.textColor = UIColor.black
                }
                ball1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall1NameLabel.text = sortName
                }
                //                  aBall1NameLabel.text = player.name ?? ""
                aBall1PointLabel.text = "\(player.credit ?? "") cr."
                aBall1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "C"
                    aBall1CaptainLabel.textColor = .black
                    aBall1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "VC"
                   aBall1CaptainLabel.textColor = .white
                  aBall1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
            //                  }
            case 1:
                bowlMensStackView.spacing = 100
                if player.team == "team1" {
                    ballView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall2NameLabel.textColor = UIColor.white
                } else {
                    ballView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall2NameLabel.textColor = UIColor.black
                }
                ball2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall2NameLabel.text = sortName
                }
                //                  aBall2NameLabel.text = player.name ?? ""
                aBall2PointLabel.text = "\(player.credit ?? "") cr."
                aBall2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "C"
                   aBall2CaptainLabel.textColor = .black
                                       aBall2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "VC"
                     aBall2CaptainLabel.textColor = .white
                    aBall2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                  if aBall2ImageView == nil {
                    //                     aBall2ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                }
            case 2:
                bowlMensStackView.spacing = 80
                if player.team == "team1" {
                    ballView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aBall3NameLabel.textColor = UIColor.white
                } else {
                    ballView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBall3NameLabel.textColor = UIColor.black
                }
                ball3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall3NameLabel.text = sortName
                }
                //                  aBall3NameLabel.text = player.name ?? ""
                aBall3PointLabel.text = "\(player.credit ?? "") cr."
                aBall3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "C"
                    aBall2CaptainLabel.textColor = .black
                   aBall2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "VC"
                   aBall3CaptainLabel.textColor = .white
                    aBall3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall3ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aBall3ImageView == nil {
                    //                                        aBall3ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                                     }
                }
            case 3:
                bowlMensStackView.spacing = 50
                if player.team == "team1" {
                    ballView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                     aBall4NameLabel.textColor = UIColor.white
                } else {
                    ballView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall4NameLabel.textColor = UIColor.black
                }
                ball4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall4NameLabel.text = sortName
                }
                //                  aBall4NameLabel.text = player.name ?? ""
                aBall4PointLabel.text = "\(player.credit ?? "") cr."
                aBall4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "C"
                   aBall4CaptainLabel.textColor = .black
                  aBall4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "VC"
                    aBall4CaptainLabel.textColor = .white
                    aBall4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                  if aBall4ImageView == nil {
                    //                     aBall4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                }
            case 4:
                bowlMensStackView.spacing = 20
                if player.team == "team1" {
                    ballView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall5NameLabel.textColor = UIColor.white
                } else {
                    ballView5.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                      aBall5NameLabel.textColor = UIColor.black
                }
                ball5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall5NameLabel.text = sortName
                }
                //                  aBall5NameLabel.text = player.name ?? ""
                aBall5PointLabel.text = "\(player.credit ?? "") cr."
                aBall5ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "C"
                     aBall5CaptainLabel.textColor = .black
                    aBall5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "VC"
                  aBall5CaptainLabel.textColor = .white
                    aBall5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aBall5ImageView == nil {
                    //                       aBall5ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                    }
                }
            case 5:
                bowlMensStackView.spacing = 10
                if player.team == "team1" {
                    ballView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall6NameLb.backgroundColor =  UIColor(red: 0, green: 64, blue: 161)
                     aBall6NameLb.textColor = UIColor.white
                } else {
                    ballView6.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall6NameLb.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                     aBall6NameLb.textColor = UIColor.black
                }
                
                ball6_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall6NameLb.text = sortName
                }
                //                aBall6NameLb.text = player.name ?? ""
                aBall6PointLbl.text = "\(player.series_points ?? 0.0) pts"
                aBall6ContainerView.isHidden = false
                if player.captain == "1" {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "C"
                     aBall6CaptainLbl.textColor = .black
                    aBall6CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == "1" {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "VC"
                    
                    aBall6CaptainLbl.textColor = .white
                    aBall6CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                //                aball6ImageView.isHidden = true
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aball6ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aBat6ImageView == nil {
                    //                       aBat6ImageView.image = #imageLiteral(resourceName: "Group 7421")
                    //                    }
                }
            default:
                break
            }
        }
    }
    
    fileprivate func setAllDataList() {
        for (index,player) in allArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    allView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aAR1NameLabel.textColor = UIColor.white
                } else {
                    
                    allView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR1NameLabel.textColor = UIColor.black
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
                     aAR1CaptainLabel.textColor = .black
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                     aAR1CaptainLabel.textColor = .white
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR1ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
            case 1:
                allRounderStackView.spacing = 100
                if player.team == "team1" {
                    
                    allView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                      aAR2NameLabel.textColor = UIColor.white
                    aAR2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aAR2NameLabel.textColor = UIColor.black
                    allView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aAR2CaptainLabel.textColor = .black
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.textColor = .white
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
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
                     aAR3NameLabel.textColor = UIColor.white
                    allView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                       aAR3NameLabel.textColor = UIColor.black
                    allView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aAR3CaptainLabel.textColor = .black
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == viceCaptianID {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                    aAR3CaptainLabel.textColor = .white
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR3ImageView == nil {
                    //                        aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                  }
            case 3:
                 allRounderStackView.spacing = 50
                if player.team == "team1" {
                     aR4NameLabel.textColor = UIColor.white
                    allView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aR4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    aR4NameLabel.textColor = UIColor.black
                    allView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aR4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ar4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aR4NameLabel.text = sortName
                }
                //                aAR1NameLabel.text = player.name ?? ""
                aR4PointLable.text = "\(player.credit ?? "") cr."
                aR4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "C"
                    aR4CaptainLbl.textColor = .black
                                       aR4CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "VC"
                   aR4CaptainLbl.textColor = .white
                    aR4CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aR4ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aR4ImageView == nil {
                //                    aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
            //                }
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
                       aBat1NameLabel.textColor = UIColor.white
                    batView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBat1NameLabel.textColor = UIColor.black
                    batView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat1CaptainLabel.textColor = .black
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp ==  self.viceCaptianID{
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                   aBat1CaptainLabel.textColor = .white
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat1ImageView.image == nil {
                //                    aBat1ImageView.image = #imageLiteral(resourceName: "1_3")
                //                }
                
            case 1:
                batMenStackView.spacing = 100
                if player.team == "team1" {
                      aBat2NameLabel.textColor = UIColor.white
                    batView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBat2NameLabel.textColor = UIColor.black
                    batView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat2CaptainLabel.textColor = .black
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)

                }
                if temp == self.viceCaptianID {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.textColor = .white
                                       aBat2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat2ImageView.image == nil {
                //                    aBat2ImageView.image = #imageLiteral(resourceName: "1_3")
            //                }
            case 2:
                  batMenStackView.spacing = 80
                if player.team == "team1" {
                     aBat3NameLabel.textColor = UIColor.white
                    batView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBat3NameLabel.textColor = UIColor.black
                    batView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat3CaptainLabel.textColor = .black
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                   aBat3CaptainLabel.textColor = .white
                  aBat3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat3ImageView.image == nil {
                //                    aBat3ImageView.image = #imageLiteral(resourceName: "1_3")
            //                }
            case 3:
                  batMenStackView.spacing = 50
                if player.team == "team1" {
                     aBat4NameLabel.textColor = UIColor.white
                    batView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBat4NameLabel.textColor = UIColor.black
                    batView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat4NameLabel.text = sortName
                }
                bat4_Player_ID = player.id ?? 0
                //                aBat4NameLabel.text = player.name ?? ""
                aBat4PointLabel.text = "\(player.credit ?? "") cr."
                aBat4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "C"
                    aBat4CaptainLabel.textColor = .black
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "VC"
                    aBat4CaptainLabel.textColor = .white
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat4ImageView.image == nil {
                //                    aBat4ImageView.image = #imageLiteral(resourceName: "1_3")
            //                }
            case 4:
                  batMenStackView.spacing = 20
                if player.team == "team1" {
                      aBat5NameLabel.textColor = UIColor.white
                    batView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    aBat5NameLabel.textColor = UIColor.black
                    batView5.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                bat5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat5NameLabel.text = sortName
                }
                //                aBat5NameLabel.text = player.name ?? ""
                aBat5PointLabel.text = "\(player.credit ?? "") cr."
                aBat5ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "C"
                    aBat5CaptainLabel.textColor = .black
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "VC"
                    aBat5CaptainLabel.textColor = .white
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 5:
                  batMenStackView.spacing = 10
                if player.team == "team1" {
                    aBat5NameLabel.textColor = UIColor.white
                    batView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat6NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                else {
                     aBat5NameLabel.textColor = UIColor.black
                    batView6.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat6NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                bat6_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                               if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                                   
                                   let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                                   aBat6NameLbl.text = sortName
                               }
                aBat6PointLbl.text = "\(player.series_points ?? 0.0) pts"
                aBat6ContainerView.isHidden = false
                if player.captain == "1" {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "C"
                    aBat6CaptianLbl.textColor = .black
                    aBat6CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == "1" {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "VC"
                    aBat6CaptianLbl.textColor = .white
                    aBat6CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                aBat6ImageView.isHidden = false
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat6ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setWKData() {
        for (index,player) in wkArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                     aBat5NameLabel.textColor = UIColor.white
                    wkView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk1NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBat5NameLabel.textColor = UIColor.black
                    wkView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk1NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                     awkCaptainLbl.textColor = .black
                    awkCaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    awkCaptainLbl.isHidden = false
                    awkCaptainLbl.text = "VC"
                     awkCaptainLbl.textColor = .white
                    awkCaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
           
            case 1:
                wkKeeperStackView.spacing = 100
                if player.team == "team1" {
                     awk2NameLBl.textColor = UIColor.white
                    wkView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk2NameLBl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      awk2NameLBl.textColor = UIColor.black
                    wkView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk2NameLBl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                wk2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    awk2NameLBl.text = sortName
                }
              
                awk2PointLabel.text = "\(player.credit ?? "") cr."
                awk2ContainerView.isHidden = false
               
                if player.captain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "C"
                    awk2CaptainLbl.textColor = .black
                    awk2CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    awk2CaptainLbl.isHidden = false
                    awk2CaptainLbl.text = "VC"
                    awk2CaptainLbl.textColor = .white
                    awk2CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWk2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                   
                }
            //                            }
            case 2:
                wkKeeperStackView.spacing = 80
                if player.team == "team1" {
                     awk3NameLbl.textColor = UIColor.white
                    wkView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    awk3NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     awk3NameLbl.textColor = UIColor.black
                    wkView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    awk3NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    awk3CaptianLbl.textColor = .black
                    awk3CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    awk3CaptianLbl.isHidden = false
                    awk3CaptianLbl.text = "VC"
                     awk3CaptianLbl.textColor = .white
                    awk3CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    awk3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                                if awk3ImageView == nil {
                    //                                   awk3ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                            }
            case 3:
                wkKeeperStackView.spacing = 50
                if player.team == "team1" {
                     aWKName4Label.textColor = UIColor.white
                    wkView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aWKName4Label.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aWKName4Label.textColor = UIColor.black
                    wkView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aWKName4Label.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                wk4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aWKName4Label.text = sortName
                }
                //                            aWKName4Label.text = player.name ?? ""
                aWK4PointLabel.text = "\(player.credit ?? "") cr."
                aWK4ContainerView.isHidden = false
                
              
                if player.captain == 1 {
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "C"
                    aWK4CaptainLabel.textColor = .black
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aWK4CaptainLabel.isHidden = false
                    aWK4CaptainLabel.text = "VC"
                    aWK4CaptainLabel.textColor = .white
                    aWK4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aWK4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                                if aWK4ImageView == nil {
                    //                                   aWK4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
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
                     aBat1NameLabel.textColor = UIColor.white
                    batView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBat1NameLabel.textColor = UIColor.black
                    batView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                   aBat1CaptainLabel.textColor = .black
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    
                }
                if player.vicecaptain == 1 {
                    aBat1CaptainLabel.isHidden = false
                    aBat1CaptainLabel.text = "VC"
                     aBat1CaptainLabel.textColor = .white
                    aBat1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                batMenStackView.spacing = 100
                if player.team == "team1" {
                     aBat2NameLabel.textColor = UIColor.white
                    batView2.backgroundColor =  UIColor(red: 0, green: 64, blue: 161)
                    aBat2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBat2NameLabel.textColor = UIColor.black
                    batView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat2CaptainLabel.textColor = .black
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBat2CaptainLabel.isHidden = false
                    aBat2CaptainLabel.text = "VC"
                    aBat2CaptainLabel.textColor = .white
                    aBat2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                 batMenStackView.spacing = 80
                if player.team == "team1" {
                     aBat3NameLabel.textColor = UIColor.white
                    batView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    aBat3NameLabel.textColor = UIColor.black
                    batView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aBat3CaptainLabel.textColor = .black
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBat3CaptainLabel.isHidden = false
                    aBat3CaptainLabel.text = "VC"
                     aBat3CaptainLabel.textColor = .white
                    aBat3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                                   
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                 batMenStackView.spacing = 50
                if player.team == "team1" {
                    aBat4NameLabel.textColor = UIColor.white
                    batView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBat4NameLabel.textColor = UIColor.black
                    batView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                bat4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat4NameLabel.text = sortName
                }
                //                aBat4NameLabel.text = player.name ?? ""
                aBat4PointLabel.text = "\(player.credit ?? "") cr."
                aBat4ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "C"
                     aBat4CaptainLabel.textColor = .black
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBat4CaptainLabel.isHidden = false
                    aBat4CaptainLabel.text = "VC"
                   aBat4CaptainLabel.textColor = .white
                    aBat4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 4:
                 batMenStackView.spacing = 20
                if player.team == "team1" {
                    aBat5NameLabel.textColor = UIColor.white
                    batView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBat5NameLabel.textColor = UIColor.black
                    batView5.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                bat5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBat5NameLabel.text = sortName
                }
                //                aBat5NameLabel.text = player.name ?? ""
                aBat5PointLabel.text = "\(player.credit ?? "") cr."
                aBat5ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "C"
                    aBat5CaptainLabel.textColor = .black
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBat5CaptainLabel.isHidden = false
                    aBat5CaptainLabel.text = "VC"
                    aBat5CaptainLabel.textColor = .white
                    aBat5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 5:
                 batMenStackView.spacing = 10
                if player.team == "team1" {
                     aBat5NameLabel.textColor = UIColor.white
                    batView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBat6NameLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                else {
                     aBat5NameLabel.textColor = UIColor.black
                    batView6.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBat6NameLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                bat6_Player_ID = player.id ?? 0
                aBat6NameLbl.text = player.name ?? ""
                aBat6PointLbl.text = "\(player.series_points ?? 0.0) pts"
                aBat6ContainerView.isHidden = false
                if player.captain == 1 {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "C"
                    aBat6CaptianLbl.textColor = .black
                    aBat6CaptianLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                
                if player.vicecaptain == 1 {
                    aBat6CaptianLbl.isHidden = false
                    aBat6CaptianLbl.text = "VC"
                    aBat6CaptianLbl.textColor = .white
                    aBat6CaptianLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat6ImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "sample"), options: .continueInBackground) { (img, err, cacheType, url) in
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
                    aAR1NameLabel.textColor = UIColor.white

                    allView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aAR1NameLabel.textColor = UIColor.black
                    allView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                   aAR1CaptainLabel.textColor = .black
                    aAR1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aAR1CaptainLabel.isHidden = false
                    aAR1CaptainLabel.text = "VC"
                    aAR1CaptainLabel.textColor = .white
                aAR1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
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
                     aAR2NameLabel.textColor = UIColor.white
                    allView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    aAR2NameLabel.textColor = UIColor.black
                    allView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aAR2CaptainLabel.textColor = .black
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aAR2CaptainLabel.isHidden = false
                    aAR2CaptainLabel.text = "VC"
                    aAR2CaptainLabel.textColor = .white
                    aAR2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
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
                    aAR3NameLabel.textColor = UIColor.white
                    allView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aAR3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aAR3NameLabel.textColor = UIColor.black
                    allView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aAR3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
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
                    aAR3CaptainLabel.textColor = .black
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aAR3CaptainLabel.isHidden = false
                    aAR3CaptainLabel.text = "VC"
                   aAR3CaptainLabel.textColor = .white
                    aAR3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aAR3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                 allRounderStackView.spacing = 50
                if player.team == "team1" {
                      aR4NameLabel.textColor = UIColor.white
                    allView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aR4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aR4NameLabel.textColor = UIColor.black
                    allView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aR4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ar4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aR4NameLabel.text = sortName
                }
                //                      aAR1NameLabel.text = player.name ?? ""
                aR4PointLable.text = "\(player.credit ?? "") cr."
                aR4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "C"
                    aR4CaptainLbl.textColor = .black
                    aR4CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if temp == self.viceCaptianID {
                    aR4CaptainLbl.isHidden = false
                    aR4CaptainLbl.text = "VC"
                    aR4CaptainLbl.textColor = .white
                    aR4CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aR4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                      if aR4ImageView == nil {
                //                          aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                //                      }
                
            default:
                break
            }
        }
    }
    
    fileprivate func setBowlData() {
        for (index,player) in bowlArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aBall1NameLabel.textColor = UIColor.white
                    ballView1.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall1NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    aBall1NameLabel.textColor = UIColor.black
                    ballView1.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall1NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall1NameLabel.text = sortName
                }
                //                aBall1NameLabel.text = player.name ?? ""
                aBall1PointLabel.text = "\(player.credit ?? "") cr."
                aBall1ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "C"
                    aBall1CaptainLabel.textColor = .black
                    aBall1CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall1CaptainLabel.isHidden = false
                    aBall1CaptainLabel.text = "VC"
                   aBall1CaptainLabel.textColor = .white
                    aBall1CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                bowlMensStackView.spacing = 100
                if player.team == "team1" {
                    aBall2NameLabel.textColor = UIColor.white
                    ballView2.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall2NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBall2NameLabel.textColor = UIColor.black
                    ballView2.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall2NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall2NameLabel.text = sortName
                }
                //                aBall2NameLabel.text = player.name ?? ""
                aBall2PointLabel.text = "\(player.credit ?? "") cr."
                aBall2ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "C"
                     aBall2CaptainLabel.textColor = .black
                        aBall2CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall2CaptainLabel.isHidden = false
                    aBall2CaptainLabel.text = "VC"
                    aBall2CaptainLabel.textColor = .white
                    aBall2CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                bowlMensStackView.spacing = 80
                if player.team == "team1" {
                     aBall3NameLabel.textColor = UIColor.white
                    ballView3.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall3NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                    
                    aBall3NameLabel.textColor = UIColor.black
                    ballView3.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall3NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall3NameLabel.text = sortName
                }
                //                aBall3NameLabel.text = player.name ?? ""
                aBall3PointLabel.text = "\(player.credit ?? "") cr."
                aBall3ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "C"
                    aBall3CaptainLabel.textColor = .black
                        aBall3CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall3CaptainLabel.isHidden = false
                    aBall3CaptainLabel.text = "VC"
                     aBall3CaptainLabel.textColor = .white
                    aBall3CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                bowlMensStackView.spacing = 50
                if player.team == "team1" {
                     aBall4NameLabel.textColor = UIColor.white
                    ballView4.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall4NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBall4NameLabel.textColor = UIColor.black
                    ballView4.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall4NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall4NameLabel.text = sortName
                }
                //                aBall4NameLabel.text = player.name ?? ""
                aBall4PointLabel.text = "\(player.credit ?? "") cr."
                aBall4ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "C"
                    aBall4CaptainLabel.textColor = .black
                    aBall4CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall4CaptainLabel.isHidden = false
                    aBall4CaptainLabel.text = "VC"
                    aBall4CaptainLabel.textColor = .white
                     aBall4CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 4:
                 bowlMensStackView.spacing = 20
                if player.team == "team1" {
                        aBall5NameLabel.textColor = UIColor.white
                    ballView5.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall5NameLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                     aBall5NameLabel.textColor = UIColor.black
                    ballView5.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall5NameLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall5NameLabel.text = sortName
                }
                aBall5PointLabel.text = "\(player.credit ?? "") cr."
                aBall5ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "C"
                    aBall5CaptainLabel.textColor = .black
                    aBall5CaptainLabel.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall5CaptainLabel.isHidden = false
                    aBall5CaptainLabel.text = "VC"
                   aBall5CaptainLabel.textColor = .white
                    aBall5CaptainLabel.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBall5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 5:
                 bowlMensStackView.spacing = 10
                if player.team == "team1" {
                     aBall6NameLb.textColor = UIColor.white
                    ballView6.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall6NameLb.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                } else {
                      aBall6NameLb.textColor = UIColor.black
                    ballView6.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                    aBall6NameLb.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                ball6_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aBall6NameLb.text = sortName
                }
                aBall6NameLb.text = "\(player.credit ?? "") cr."
                aBall6ContainerView.isHidden = false
                if player.captain == 1 {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "C"
                   aBall6CaptainLbl.textColor = .black
                        aBall6CaptainLbl.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
                }
                if player.vicecaptain == 1 {
                    aBall6CaptainLbl.isHidden = false
                    aBall6CaptainLbl.text = "VC"
                    aBall6CaptainLbl.backgroundColor = UIColor(red: 0, green: 64, blue: 161)
                    aBall6CaptainLbl.textColor = .white
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aball6ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
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
        delegate?.checkComingFromPReview(check: true)
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
    
    @IBAction func aWKButtonAction(_ sender: Any) {
        //  openPlayerInfoVC(id: wk_Player_ID)
    }
    
    @IBAction func aBat1ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: bat1_Player_ID)
    }
    
    @IBAction func aBat2ButtonAction(_ sender: Any) {
        //   openPlayerInfoVC(id: bat2_Player_ID)
    }
    
    @IBAction func aBat3ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: bat3_Player_ID)
    }
    
    @IBAction func aBat4ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: bat4_Player_ID)
    }
    
    @IBAction func aBat5ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: bat5_Player_ID)
    }
    
    @IBAction func aAL1ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ar1_Player_ID)
    }
    
    @IBAction func aAL2ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ar2_Player_ID)
    }
    
    @IBAction func aAL3ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ar3_Player_ID)
    }
    
    @IBAction func aBall1ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ball1_Player_ID)
    }
    
    @IBAction func aBall2ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ball2_Player_ID)
    }
    
    @IBAction func aBall3ButtonAction(_ sender: Any) {
        //openPlayerInfoVC(id: ball3_Player_ID)
    }
    
    @IBAction func aBall4ButtonAction(_ sender: Any) {
        // openPlayerInfoVC(id: ball4_Player_ID)
    }
    
    @IBAction func aBall5ButtonAction(_ sender: Any) {
        //   openPlayerInfoVC(id: ball5_Player_ID)
        
    }
    
    func openPlayerInfoVC(id: Int) {
        //        openViewController(controller: PlayerStaticsViewController.self, storyBoard: .homeStoryBoard) { (vc) in
        ////            vc.teamId = self.teamId
        //            vc.matchKey = self.matchKey
        //            vc.playerID = id
        //        }
        
    }
}
