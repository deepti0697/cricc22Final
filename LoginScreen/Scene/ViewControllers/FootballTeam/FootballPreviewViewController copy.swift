//
//  FootballPreviewViewController.swift
//  
//
//  Created by Test on 06/06/20.
//


import UIKit
import SwiftyJSON
import Alamofire
protocol FootbaalPreviewDetail {
    func checkComingFromPReview(check :Bool)
}
class FootballPreviewViewController: BaseClass {
    
    @IBOutlet weak var fwdStackView: UIStackView!
    @IBOutlet weak var defStackView: UIStackView!
    @IBOutlet weak var midFieldStackView: UIStackView!
    
    var vcID = 0
       var cId = 0
    var teamName:String?
    @IBOutlet weak var aGoalKeeperView1: UIView!
    @IBOutlet weak var aDefView1: UIView!
    @IBOutlet weak var aDefView2: UIView!
    @IBOutlet weak var aDefView3: UIView!
    @IBOutlet weak var aDefView4: UIView!
    @IBOutlet weak var aDefView5: UIView!
    
    @IBOutlet weak var aMidView1: UIView!
    @IBOutlet weak var aMidView2: UIView!
    @IBOutlet weak var aMidView3: UIView!
    @IBOutlet weak var aMidView4: UIView!
    @IBOutlet weak var aMidView5: UIView!
    
    
    @IBOutlet weak var aForwordView1: UIView!
    @IBOutlet weak var aForwordView2: UIView!
    @IBOutlet weak var aForwordView3: UIView!
    
    @IBOutlet weak var editLbl: UILabel!
    @IBOutlet weak var editBtnAction: UIButton!
    
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var crossBtn: UIButton!
    
    
    @IBOutlet weak var aGKCaptainLabel: UILabel!
    @IBOutlet weak var aGKContainerView: UIView!
    @IBOutlet weak var aGKImageView: UIImageView!
    @IBOutlet weak var aGKNameLabel: UILabel!
    @IBOutlet weak var aGKPointLabel: UILabel!
    
    @IBOutlet weak var aDef1CaptainLabel: UILabel!
    @IBOutlet weak var aDef1ContainerView: UIView!
    @IBOutlet weak var aDef1ImageView: UIImageView!
    @IBOutlet weak var aDef1NameLabel: UILabel!
    @IBOutlet weak var aDef1PointLabel: UILabel!
    
    @IBOutlet weak var aDef2CaptainLabel: UILabel!
    @IBOutlet weak var aDef2ContainerView: UIView!
    @IBOutlet weak var aDef2ImageView: UIImageView!
    @IBOutlet weak var aDef2NameLabel: UILabel!
    @IBOutlet weak var aDef2PointLabel: UILabel!
    
    @IBOutlet weak var aDef3CaptainLabel: UILabel!
    @IBOutlet weak var aDef3ContainerView: UIView!
    @IBOutlet weak var aBat3ImageView: UIImageView!
    @IBOutlet weak var aDef3NameLabel: UILabel!
    @IBOutlet weak var aDef3PointLabel: UILabel!
    
    @IBOutlet weak var aDef4CaptainLabel: UILabel!
    @IBOutlet weak var aDef4ContainerView: UIView!
    @IBOutlet weak var aDef4ImageView: UIImageView!
    @IBOutlet weak var aDef4NameLabel: UILabel!
    @IBOutlet weak var aDef4PointLabel: UILabel!
    
    @IBOutlet weak var aDef5CaptainLabel: UILabel!
    @IBOutlet weak var aDef5ContainerView: UIView!
    @IBOutlet weak var aDef5ImageView: UIImageView!
    @IBOutlet weak var aDef5NameLabel: UILabel!
    @IBOutlet weak var aDef5PointLabel: UILabel!
    
    @IBOutlet weak var aFwd1CaptainLabel: UILabel!
    @IBOutlet weak var aFwd1ContainerView: UIView!
    @IBOutlet weak var aFwd1ImageView: UIImageView!
    @IBOutlet weak var aFwd1NameLabel: UILabel!
    @IBOutlet weak var aFwd1PointLabel: UILabel!
    
    @IBOutlet weak var aFwd2CaptainLabel: UILabel!
    @IBOutlet weak var aFwd2ContainerView: UIView!
    @IBOutlet weak var aFwd2ImageView: UIImageView!
    @IBOutlet weak var aFwd2NameLabel: UILabel!
    @IBOutlet weak var aFwd2PointLabel: UILabel!
    
    @IBOutlet weak var aFwd3CaptainLabel: UILabel!
    @IBOutlet weak var aFwd3ContainerView: UIView!
    @IBOutlet weak var aFwd3ImageView: UIImageView!
    @IBOutlet weak var aFwd3NameLabel: UILabel!
    @IBOutlet weak var aFwd3PointLabel: UILabel!
    
    @IBOutlet weak var aMid1CaptainLabel: UILabel!
    @IBOutlet weak var aMid1ContainerView: UIView!
    @IBOutlet weak var aMid1ImageView: UIImageView!
    @IBOutlet weak var aMid1NameLabel: UILabel!
    @IBOutlet weak var aMid1PointLabel: UILabel!
    
    @IBOutlet weak var aMid2CaptainLabel: UILabel!
    @IBOutlet weak var aMid2ContainerView: UIView!
    @IBOutlet weak var aMid2ImageView: UIImageView!
    @IBOutlet weak var aMid2NameLabel: UILabel!
    @IBOutlet weak var aMid2PointLabel: UILabel!
    
    @IBOutlet weak var aMid3CaptainLabel: UILabel!
    @IBOutlet weak var aMid3ContainerView: UIView!
    @IBOutlet weak var aMid3ImageView: UIImageView!
    @IBOutlet weak var aMid3NameLabel: UILabel!
    @IBOutlet weak var aMid3PointLabel: UILabel!
    
    @IBOutlet weak var aMid4CaptainLabel: UILabel!
    @IBOutlet weak var aMid4ContainerView: UIView!
    @IBOutlet weak var amid4ImageView: UIImageView!
    @IBOutlet weak var aMid4NameLabel: UILabel!
    @IBOutlet weak var aMid4PointLabel: UILabel!
    
    @IBOutlet weak var aMid5CaptainLabel: UILabel!
    @IBOutlet weak var aMid5ContainerView: UIView!
    @IBOutlet weak var aMid5ImageView: UIImageView!
    @IBOutlet weak var aMid5NameLabel: UILabel!
    @IBOutlet weak var aMid5PointLabel: UILabel!
    
    @IBOutlet weak var aTeamNameLabel: UILabel!
    
    var contestLiveData:MyContestLiveLeagues?
    var getTeamResponse:MyTeamResponses?
    var isComingFromMyteam = false
    var isFromEditClone = false
    var teamId = 0
    
    var arrayOFSelectedPlayer = [Int]()
    var comingromFromPReview = false
   
    var c = 0
    var v = 0
    var delegate : FootbaalPreviewDetail?
    
    var gk1_Player_ID = 0
    
    var def1_Player_ID = 0
    var def2_Player_ID = 0
    var def3_Player_ID = 0
    var def4_Player_ID = 0
    var def5_Player_ID = 0
    
    
    var fwd1_Player_ID = 0
    var fwd2_Player_ID = 0
    var fwd3_Player_ID = 0
    
    var mid1_Player_ID = 0
    var mid2_Player_ID = 0
    var mid3_Player_ID = 0
    var mid4_Player_ID = 0
    var mid5_Player_ID = 0
    
    var gkArrayList = [PlayerListResponses]()
    var defArrayList = [PlayerListResponses]()
    var midArrayList = [PlayerListResponses]()
    var fwdArrayList = [PlayerListResponses]()
    
    var goalKeeperArrayLeaderBoard = [LeaderBoardPlayerDetail]()
    var defenderArrayLeaderBoard = [LeaderBoardPlayerDetail]()
    var forwordArrayLeaderboard = [LeaderBoardPlayerDetail]()
    var midFielderArrayLeader = [LeaderBoardPlayerDetail]()
    
    var gkArray = [PlayerDetail]()
    var defenderArray = [PlayerDetail]()
    var midRFielderArray = [PlayerDetail]()
    var fwdArray = [PlayerDetail]()
    
    var contestData: Any?
    var teamID  = 0
    var challengeID = 0
    var isFromLeaderBoard = false
    var isFromCreateTEam = false
    var matchKey = ""
    var selectedIndex = -1
    var captainID:String?
    var viceCaptainID = 0
   
    var viceCaptianID:String?
    var teamInfo: MyTeamResponses?
    
    
    
    var leaderBoardTeamArray :LeaderBoardFootballDetail? {
        didSet {
            getTeamInfo()
        }
    }
    var myTeamsData = [MyTeamResponses]() {
        didSet {
            getTeamInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNavigationBar(navigationTitle: "", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
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
    
    
    /// UI Setup
    fileprivate func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        
        aFwd1ContainerView.isHidden = true
        aFwd2ContainerView.isHidden = true
        aFwd3ContainerView.isHidden = true
        aGKCaptainLabel.isHidden = true
        aGKContainerView.isHidden = true
        aGKNameLabel.isHidden = true
        aGKPointLabel.isHidden = true
        aDef1ContainerView.isHidden = true
        aDef2ContainerView.isHidden = true
        aDef3ContainerView.isHidden = true
        aDef4ContainerView.isHidden = true
        aDef5ContainerView.isHidden = true
        
        
        aMid1ContainerView.isHidden = true
        aMid2ContainerView.isHidden = true
        aMid3ContainerView.isHidden = true
        aMid4ContainerView.isHidden = true
        aMid5ContainerView.isHidden = true
        
        aFwd1CaptainLabel.isHidden = true
        aFwd2CaptainLabel.isHidden = true
        aFwd3CaptainLabel.isHidden = true
        
        aDef1CaptainLabel.isHidden = true
        aDef2CaptainLabel.isHidden = true
        aDef3CaptainLabel.isHidden = true
        aDef4CaptainLabel.isHidden = true
        aDef5CaptainLabel.isHidden = true
        
        aMid1CaptainLabel.isHidden = true
        aMid2CaptainLabel.isHidden = true
        aMid3CaptainLabel.isHidden = true
        aMid4CaptainLabel.isHidden = true
        aMid5CaptainLabel.isHidden = true
        
        aFwd1CaptainLabel.setCornerRadius(value: 10)
        aFwd2CaptainLabel.setCornerRadius(value: 10)
        aFwd3CaptainLabel.setCornerRadius(value: 10)
        aDef1CaptainLabel.setCornerRadius(value: 10)
        aDef2CaptainLabel.setCornerRadius(value: 10)
        aDef3CaptainLabel.setCornerRadius(value: 10)
        aDef4CaptainLabel.setCornerRadius(value: 10)
        aDef5CaptainLabel.setCornerRadius(value: 10)
        aMid1CaptainLabel.setCornerRadius(value: 10)
        aMid2CaptainLabel.setCornerRadius(value: 10)
        aMid3CaptainLabel.setCornerRadius(value: 10)
        aMid4CaptainLabel.setCornerRadius(value: 10)
        aMid5CaptainLabel.setCornerRadius(value: 10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? TeamViewController {
            viewControllerB.fromPreview = comingromFromPReview
            //Do what you want in here!
        }
        
    }
    
    @IBAction func crossBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Team", bundle: nil).instantiateViewController(withIdentifier: "FootballTeamViewController") as! FootballTeamViewController
        vc.fromPreview = true
        delegate?.checkComingFromPReview(check: true)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        if isFromLeaderBoard {
            getLeaderBoardTeams()
        } else {
            getMyTeamsData()
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        openEditFootballVC(arryOfPlayer :arrayOFSelectedPlayer,viceCaptainID : vcID,captainID :cId,teamIDs:teamID)
    }
    
    
    fileprivate func setContestData() {
        if let contest = contestData as? GetMatchDetails {
            matchKey = contest.matchkey ?? ""
        }
        if let contest = contestData as? MyContestReponse {
            matchKey = contest.matchkey ?? ""
        }
    }
    
    
    /// Get Team Data  from Api
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
            let parameters = ["user_id": UserDic.value(forKey: "user_id") ?? -1, "challenge": challengeID,"teamid": teamId,"sport_key": "FOOTBALL"] as [String : Any]
            NetworkManager.post_Request2(urlService: KShowTeamOnGround, param: parameters, head: headers) { (response) in
                self.hideActivityIndicator()
                do {
                    if response != nil {
                        let jsonData = try JSON(data:response as! Data)
                        let status = jsonData["status"].intValue
                        let message = jsonData["message"].stringValue
                        let result = jsonData["result"]
                        
                        if status == 1 {
                            self.leaderBoardTeamArray = LeaderBoardFootballDetail(json: result)
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
    
    
    /// Setup For Cream Team UI
    fileprivate func setupPreviewTeamFromCreate() {
        crossBtn.isHidden = false
        editLbl.isHidden = true
        editBtnAction.isHidden = true
        editImageView.isHidden = true
        for player in APP_DEL.footballChoosedTeamArray {
            if player.role == "Midfielder" {
                midArrayList.append(player)
            }
            if player.role == "Defender" {
                defArrayList.append(player)
            }
            if player.role == "Forward" {
                fwdArrayList.append(player)
            }
            if player.role == "Goalkeeper" {
                gkArrayList.append(player)
            }
            
        }
        
        setGKDataList()
        setDefDataList()
        setFwdDataList()
        setMidFielderDataList()
        
    }
    
    
    func getTeamInfo() {
        if isFromLeaderBoard {
            setupPreviewDataForLeaderBoardTeams()
            aTeamNameLabel.isHidden = true
            editBtnAction.isHidden = true
            editLbl.isHidden = true
            editImageView.isHidden = true
            crossBtn.isHidden = false
        } else {
            if myTeamsData.count != 0 {
                teamInfo = myTeamsData[selectedIndex]
                setupPreviewDataForTeams()
                
            }
        }
    }
    
    
    fileprivate func setupPreviewDataForTeams() {
        let teamNumber = teamInfo?.teamnumber
        aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        if let playerData = teamInfo?.players {
            setupPreviewTeam(players: playerData)
        }
    }
    
    fileprivate func setupPreviewTeam(players: [PlayerDetail]) {
        for player in players {
            if let playerType = player.role {
                switch playerType {
                case "Goalkeeper" :
                    gkArray.append(player)
                case "Defender" :
                    defenderArray.append(player)
                case "Forward" :
                    fwdArray.append(player)
                case "Midfielder" :
                    midRFielderArray.append(player)
                default:
                    break
                }
            }
        }
        setGKData()
        setDefData()
        setFwdData()
        setMidData()
    }
    
    func openEditFootballVC(arryOfPlayer :[Int],viceCaptainID : Int,captainID :Int,teamIDs:Int){
        openViewController(controller: FootballTeamViewController.self, storyBoard: .teamStoryBoard, handler: { (vc) in
            vc.arrayOFPlayer  = arryOfPlayer
            vc.contestData = self.contestData as? GetMatchDetails
            vc.viceCaptian = viceCaptainID
            vc.Captain = captainID
            vc.teamId = teamIDs
            vc.contestLiveData = self.contestLiveData
        })
    }
    
    fileprivate func setupPReviewForMyTeam(data:MyTeamResponses) {
        crossBtn.isHidden = true
        editLbl.isHidden = false
        editBtnAction.isHidden = false
        editImageView.isHidden = false
        aTeamNameLabel.text = teamName
        if let players = data.players {
            for player in players {
                self.arrayOFSelectedPlayer.append(player.id ?? 0)
                if player.captain == 1 {
                    self.cId = player.id ?? 0
                }
                if player.vicecaptain == 1 {
                    self.vcID = player.id ?? 0
                }
                if player.role == "Defender" {
                    
                    defenderArray.append(player)
                }
                if player.role == "Forward" {
                    fwdArray.append(player)
                }
                if player.role == "Midfielder" {
                    midRFielderArray.append(player)
                }
                if player.role == "Goalkeeper" {
                    gkArray.append(player)
                }
            }
        }
        setGKData()
        setMidData()
        setFwdData()
        setDefData()
        
        
    }
    
    
    fileprivate func setupPReviewForCreate(data:MyTeamResponses) {
        if let players = data.players {
            for player in players {
                
                if player.captain == 1 {
                    
                }
                if player.vicecaptain == 1 {
                    
                }
                if player.role == "Defender" {
                    
                    defenderArray.append(player)
                }
                if player.role == "Midfielder" {
                    midRFielderArray.append(player)
                }
                if player.role == "Forward" {
                    fwdArray.append(player)
                }
                if player.role == "Goalkeeper" {
                    gkArray.append(player)
                }
            }
        }
        setGKDataList()
        setMidFielderDataList()
        setFwdDataList()
        setDefDataList()
    }
    
    fileprivate func setupPreviewDataForLeaderBoardTeams() {
        let teamNumber = leaderBoardTeamArray?.teamnumber
        aTeamNameLabel.text = "Team \(teamNumber ?? 0)"
        if let wkData = leaderBoardTeamArray?.Goalkeeper {
            goalKeeperArrayLeaderBoard = wkData
        }
        if let allData = leaderBoardTeamArray?.Midfielder {
            midFielderArrayLeader = allData
        }
        if let wkData = leaderBoardTeamArray?.Forward {
            forwordArrayLeaderboard = wkData
        }
        if let wkData = leaderBoardTeamArray?.Defender {
            defenderArrayLeaderBoard = wkData
        }
        setWKDataLeaderBoard()
        setBatDataLeaderBoard()
        setBowlDataLeaderBoard()
        setAllDataLeaderBoard()
        
    }
    
    fileprivate func setWKDataLeaderBoard() {
        for player in goalKeeperArrayLeaderBoard {
            if player.team == "team1" {
                aGoalKeeperView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                aGKNameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            } else {
                aGoalKeeperView1.backgroundColor = .black
                aGKNameLabel.backgroundColor = .black
            }
            gk1_Player_ID = player.id ?? 0
            let nameFormatter = PersonNameComponentsFormatter()
            if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                
                let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                aGKNameLabel.text = sortName
            }
            aGKNameLabel.isHidden = false
            aGKPointLabel.isHidden = false
            aGKImageView.isHidden = false
            aGKPointLabel.text = "\(player.credit ?? "") cr."
            aGKContainerView.isHidden = false
            
            if player.captain == 1 {
               aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "C"
                aGKCaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            }
            if player.vicecaptain == 1 {
                aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "VC"
                aGKCaptainLabel.backgroundColor = .black
            }
            if let imagePath = player.image {
                let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString1 ?? "")
                aGKImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
        }
    }
    
    fileprivate func setBowlDataLeaderBoard() {
        for (index,player) in midFielderArrayLeader.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aMidView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView1.backgroundColor = .black
                    aMid1NameLabel.backgroundColor = .black
                }
                mid1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid1NameLabel.text = sortName
                }
                aMid1PointLabel.text = "\(player.credit ?? "") cr."
                aMid1ContainerView.isHidden = false
                
                if player.captain == 1{
                    
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "C"
                    aMid1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "VC"
                    aMid1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                midFieldStackView.spacing = 100
                if player.team == "team1" {
                    aMidView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView2.backgroundColor = .black
                    aMid2NameLabel.backgroundColor = .black
                }
                mid2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid2NameLabel.text = sortName
                }
                aMid2PointLabel.text = "\(player.credit ?? "") cr."
                aMid2ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "C"
                    aMid2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1{
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "VC"
                    aMid2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
            case 2:
                 midFieldStackView.spacing = 80
                if player.team == "team1" {
                    aMidView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView3.backgroundColor = .black
                    aMid3NameLabel.backgroundColor = .black
                }
                mid3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid3NameLabel.text = sortName
                }
                
                aMid3PointLabel.text = "\(player.credit ?? "") cr."
                aMid3ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "C"
                    aMid3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "VC"
                    aMid3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
            case 3:
                 midFieldStackView.spacing = 50
                if player.team == "team1" {
                    aMidView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView4.backgroundColor = .black
                    aMid4NameLabel.backgroundColor = .black
                }
                mid4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid4NameLabel.text = sortName
                }
                
                aMid4PointLabel.text = "\(player.credit ?? "") cr."
                aMid4ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "C"
                    aMid4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "VC"
                    aMid4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    amid4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
                
            case 4:
                 midFieldStackView.spacing = 20
                if player.team == "team1" {
                    aMidView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView5.backgroundColor = .black
                    aMid5NameLabel.backgroundColor = .black
                }
                mid5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid5NameLabel.text = sortName
                }
                
                aMid5PointLabel.text = "\(player.credit ?? "") cr."
                aMid5ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "C"
                    aMid5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1{
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "VC"
                    aMid5CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            default:
                break
            }
        }
    }
    
    fileprivate func setAllDataLeaderBoard() {
        for (index,player) in forwordArrayLeaderboard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aForwordView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView1.backgroundColor = .black
                    aFwd1NameLabel.backgroundColor = .black
                }
                fwd1_Player_ID = player.id ?? 0
                aFwd1NameLabel.text = player.name ?? ""
                aFwd1PointLabel.text = "\(player.credit ?? "") cr."
                aFwd1ContainerView.isHidden = false
                
                if player.captain == 1{
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "C"
                    aFwd1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "VC"
                    aFwd1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                        
                    }
                }
            case 1:
                fwdStackView.spacing = 100
                if player.team == "team1" {
                    aFwd2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aForwordView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView2.backgroundColor = .black
                    aFwd2NameLabel.backgroundColor = .black
                }
                fwd2_Player_ID = player.id ?? 0
                aFwd2NameLabel.text = player.name ?? ""
                aFwd2PointLabel.text = "\(player.credit ?? "") cr."
                aFwd2ContainerView.isHidden = false
                
                if  player.captain == 1 {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "C"
                    aFwd2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "VC"
                    aFwd2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                
            case 2:
                fwdStackView.spacing = 80
                if player.team == "team1" {
                    aForwordView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView3.backgroundColor = .black
                    aFwd3NameLabel.backgroundColor = .black
                }
                fwd3_Player_ID = player.id ?? 0
                aFwd3NameLabel.text = player.name ?? ""
                aFwd3PointLabel.text = "\(player.credit ?? "") cr."
                aFwd3ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "C"
                    aFwd3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "VC"
                    aFwd3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
            default:
                break
            }
        }
    }
    fileprivate func setBatDataLeaderBoard() {
        for (index,player) in defenderArrayLeaderBoard.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aDefView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    
                    aDef1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView1.backgroundColor = .black
                    aDef1NameLabel.backgroundColor = .black
                }
                def1_Player_ID = player.id ?? 0
                aDef1NameLabel.text = player.name ?? ""
                aDef1PointLabel.text = "\(player.credit ?? "") cr."
                aDef1ContainerView.isHidden = false
                
                
                if player.captain == 1 {
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "C"
                    aDef1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "VC"
                    aDef1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
                
            case 1:
                defStackView.spacing = 100
                if player.team == "team1" {
                    aDefView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView2.backgroundColor = .black
                    aDef2NameLabel.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef2NameLabel.text = sortName
                }
                def2_Player_ID = player.id ?? 0
                //                aBat2NameLabel.text = player.name ?? ""
                aDef2PointLabel.text = "\(player.credit ?? "") cr."
                aDef2ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "C"
                    aDef2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "VC"
                    aDef2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 2:
                  defStackView.spacing = 80
                if player.team == "team1" {
                    aDefView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView3.backgroundColor = .black
                    aDef3NameLabel.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef3NameLabel.text = sortName
                }
                def3_Player_ID = player.id ?? 0
                //                aBat3NameLabel.text = player.name ?? ""
                aDef3PointLabel.text = "\(player.credit ?? "") cr."
                aDef3ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "C"
                    aDef3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "VC"
                    aDef3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 3:
                  defStackView.spacing = 50
                if player.team == "team1" {
                    aDefView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView4.backgroundColor = .black
                    aDef4NameLabel.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef4NameLabel.text = sortName
                }
                def4_Player_ID = player.id ?? 0
                //                aBat4NameLabel.text = player.name ?? ""
                aDef4PointLabel.text = "\(player.credit ?? "") cr."
                aDef4ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "C"
                    aDef4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1{
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "VC"
                    aDef4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 4:
                  defStackView.spacing = 20
                if player.team == "team1" {
                    aDefView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView5.backgroundColor = .black
                    aDef5NameLabel.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef5NameLabel.text = sortName
                }
                def5_Player_ID = player.id ?? 0
                //                aBat5NameLabel.text = player.name ?? ""
                aDef5PointLabel.text = "\(player.credit ?? "") cr."
                aDef5ContainerView.isHidden = false
                
                if player.captain == 1 {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "C"
                    aDef5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "VC"
                    aDef5CaptainLabel.backgroundColor = .black
                }
                //                if let imagePath = player.image {
            //
            default:
                break
            }
        }
    }
    @IBAction func editActin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setGKDataList() {
        for player in gkArrayList {
            if player.team == "team1" {
                aGoalKeeperView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                aGKNameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            } else {
                aGoalKeeperView1.backgroundColor = .black
                aGKNameLabel.backgroundColor = .black
            }
            gk1_Player_ID = player.id ?? 0
            //                     aWKNameLabel.text = player.name
            let nameFormatter = PersonNameComponentsFormatter()
            if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                
                let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                aGKNameLabel.text = sortName
            }
            aGKNameLabel.isHidden = false
            aGKPointLabel.isHidden = false
            aGKImageView.isHidden = false
            aGKPointLabel.text = "\(player.credit ?? "") cr."
            aGKContainerView.isHidden = false
            let temp = "\(player.id ?? 0)"
            if temp == self.captainID {
                
                aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "C"
                aGKCaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            }
            if temp == self.viceCaptianID  {
                aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "VC"
                aGKCaptainLabel.backgroundColor = .black
            }
            if let imagePath = player.image {
                let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString1 ?? "")
                aGKImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
        }
    }
    fileprivate func setMidFielderDataList() {
        for (index,player) in midArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aMidView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView2.backgroundColor = .black
                    aMid1NameLabel.backgroundColor = .black
                }
                mid1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid1NameLabel.text = sortName
                }
                //                  aBall1NameLabel.text = player.name ?? ""
                aMid1PointLabel.text = "\(player.credit ?? "") cr."
                aMid1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "C"
                    aMid1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "VC"
                    aMid1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //
                }
            case 1:
                midFieldStackView.spacing = 100
                if player.team == "team1" {
                    aMidView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView2.backgroundColor = .black
                    aMid2NameLabel.backgroundColor = .black
                }
                mid2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid2NameLabel.text = sortName
                }
                //                  aBall2NameLabel.text = player.name ?? ""
                aMid2PointLabel.text = "\(player.credit ?? "") cr."
                aMid2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "C"
                    aMid2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "VC"
                    aMid2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                  if aBall2ImageView == nil {
                    //                     aBall2ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                }
            case 2:
                midFieldStackView.spacing = 80
                if player.team == "team1" {
                    aMidView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView3.backgroundColor = .black
                    aMid3NameLabel.backgroundColor = .black
                }
                mid3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid3NameLabel.text = sortName
                }
                //                  aBall3NameLabel.text = player.name ?? ""
                aMid3PointLabel.text = "\(player.credit ?? "") cr."
                aMid3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "C"
                    aMid3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "VC"
                    aMid3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid3ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aBall3ImageView == nil {
                    //                                        aBall3ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                                     }
                }
            case 3:
                midFieldStackView.spacing = 50
                if player.team == "team1" {
                    aMidView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView4.backgroundColor = .black
                    aMid4NameLabel.backgroundColor = .black
                }
                mid4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid4NameLabel.text = sortName
                }
                aMid4PointLabel.text = "\(player.credit ?? "") cr."
                aMid4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "C"
                    aMid4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "VC"
                    aMid4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    amid4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                  if aBall4ImageView == nil {
                    //                     aBall4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
            //                }
            case 4:
                midFieldStackView.spacing = 20
                if player.team == "team1" {
                    aMidView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView5.backgroundColor = .black
                    aMid5NameLabel.backgroundColor = .black
                }
                mid5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid5NameLabel.text = sortName
                }
                
                aMid5PointLabel.text = "\(player.credit ?? "") cr."
                aMid5ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "C"
                    aMid5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "VC"
                    aMid5CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setFwdDataList() {
        for (index,player) in fwdArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aForwordView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView1.backgroundColor = .black
                    aFwd1NameLabel.backgroundColor = .black
                }
                fwd1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd1NameLabel.text = sortName
                }
                //                  aAR1NameLabel.text = player.name ?? ""
                aFwd1PointLabel.text = "\(player.credit ?? "") cr."
                aFwd1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "C"
                    aFwd1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "VC"
                    aFwd1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd1ImageView?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR1ImageView == nil {
                    //                        aAR1ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                    }
                }
            case 1:
                fwdStackView.spacing = 100
                if player.team == "team1" {
                    aForwordView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView2.backgroundColor = .black
                    aFwd2NameLabel.backgroundColor = .black
                }
                fwd2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd2NameLabel.text = sortName
                }
                
                aFwd2PointLabel.text = "\(player.credit ?? "") cr."
                aFwd2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if  temp == self.captainID {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "C"
                    aFwd2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "VC"
                    aFwd2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR2ImageView == nil {
                    //                        aAR2ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                    //                    }
                }
                
            case 2:
                fwdStackView.spacing = 80
                if player.team == "team1" {
                    aForwordView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView3.backgroundColor = .black
                    aFwd3NameLabel.backgroundColor = .black
                }
                fwd3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd3NameLabel.text = sortName
                }
                //                  aAR3NameLabel.text = player.name ?? ""
                aFwd3PointLabel.text = "\(player.credit ?? "") cr."
                aFwd3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "C"
                    aFwd3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == viceCaptianID {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "VC"
                    aFwd3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                    //                    if aAR3ImageView == nil {
                    //                        aR4ImageView.image = #imageLiteral(resourceName: "Group 7763_4")
                }
                //                  }
                
            default:
                break
            }
        }
    }
    fileprivate func setDefDataList() {
        for (index,player) in defArrayList.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aDefView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView1.backgroundColor = .black
                    aDef1NameLabel.backgroundColor = .black
                }
                def1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef1NameLabel.text = sortName
                }
                //                aBat1NameLabel.text = player.name ?? ""
                aDef1PointLabel.text = "\(player.credit ?? "") cr."
                aDef1ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                
                if temp ==  self.captainID {
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "C"
                    aDef1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp ==  self.viceCaptianID{
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "VC"
                    aDef1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat1ImageView.image == nil {
                //                    aBat1ImageView.image = #imageLiteral(resourceName: "1_3")
                //                }
                
            case 1:
                defStackView.spacing = 100
                if player.team == "team1" {
                    aDefView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView2.backgroundColor = .black
                    aDef2NameLabel.backgroundColor = .black
                }
                def2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef2NameLabel.text = sortName
                }
                //                aBat2NameLabel.text = player.name ?? ""
                aDef2PointLabel.text = "\(player.credit ?? "") cr."
                aDef2ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "C"
                    aDef2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "VC"
                    aDef2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                //                if aBat2ImageView.image == nil {
                //                    aBat2ImageView.image = #imageLiteral(resourceName: "1_3")
            //                }
            case 2:
                defStackView.spacing = 80
                if player.team == "team1" {
                    aDefView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView3.backgroundColor = .black
                    aDef3NameLabel.backgroundColor = .black
                }
                def3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef3NameLabel.text = sortName
                }
                
                aDef3PointLabel.text = "\(player.credit ?? "") cr."
                aDef3ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "C"
                    aDef3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "VC"
                    aDef3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 3:
                defStackView.spacing = 50
                if player.team == "team1" {
                    aDefView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView4.backgroundColor = .black
                    aDef4NameLabel.backgroundColor = .black
                }
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef4NameLabel.text = sortName
                }
                def4_Player_ID = player.id ?? 0
                //                aBat4NameLabel.text = player.name ?? ""
                aDef4PointLabel.text = "\(player.credit ?? "") cr."
                aDef4ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "C"
                    aDef4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "VC"
                    aDef4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            case 4:
                defStackView.spacing = 20
                if player.team == "team1" {
                    aDefView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView5.backgroundColor = .black
                    aDef5NameLabel.backgroundColor = .black
                }
                def5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef5NameLabel.text = sortName
                }
                //                aBat5NameLabel.text = player.name ?? ""
                aDef5PointLabel.text = "\(player.credit ?? "") cr."
                aDef5ContainerView.isHidden = false
                let temp = "\(player.id ?? 0)"
                if temp == self.captainID {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "C"
                    aDef5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if temp == self.viceCaptianID {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "VC"
                    aDef5CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
            default:
                break
            }
        }
    }
    fileprivate func setGKData() {
        for player in gkArray {
            if player.team == "team1" {
                aGoalKeeperView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                aGKNameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            } else {
                aGoalKeeperView1.backgroundColor = .black
                aGKNameLabel.backgroundColor = .black
            }
            aGKNameLabel.isHidden = false
            aGKPointLabel.isHidden = false
            aGKImageView.isHidden = false
            gk1_Player_ID = player.id ?? 0
            let nameFormatter = PersonNameComponentsFormatter()
            if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                
                let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                aGKNameLabel.text = sortName
            }
            
            aGKPointLabel.text = "\(player.credit ?? "") cr."
            aGKContainerView.isHidden = false
           
            if player.captain == 1 {
                
                aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "C"
                aGKCaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
            }
            if player.vicecaptain == 1 {
                aGKCaptainLabel.isHidden = false
                aGKCaptainLabel.text = "VC"
                aGKCaptainLabel.backgroundColor = .black
            }
            if let imagePath = player.image {
                let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                let imageUrl = URL(string: urlString1 ?? "")
                aGKImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
        }
    }
    
    fileprivate func setDefData() {
        for (index,player) in defenderArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aDefView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView1.backgroundColor = .black
                    aDef1NameLabel.backgroundColor = .black
                }
                def1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef1NameLabel.text = sortName
                }
                //                aBat1NameLabel.text = player.name ?? ""
                aDef1PointLabel.text = "\(player.credit ?? "") cr."
                aDef1ContainerView.isHidden = false
                if player.captain == 1 {
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "C"
                    aDef1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    
                }
                if player.vicecaptain == 1 {
                    aDef1CaptainLabel.isHidden = false
                    aDef1CaptainLabel.text = "VC"
                    aDef1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                 defStackView.spacing = 100
                if player.team == "team1" {
                    aDefView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView2.backgroundColor = .black
                    aDef2NameLabel.backgroundColor = .black
                }
                def2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef2NameLabel.text = sortName
                }
                
                aDef2PointLabel.text = "\(player.credit ?? "") cr."
                aDef2ContainerView.isHidden = false
                if player.captain == 1 {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "C"
                    aDef2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef2CaptainLabel.isHidden = false
                    aDef2CaptainLabel.text = "VC"
                    aDef2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                 defStackView.spacing = 80
                if player.team == "team1" {
                    aDefView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView3.backgroundColor = .black
                    aDef3NameLabel.backgroundColor = .black
                }
                def3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef3NameLabel.text = sortName
                }
                
                aDef3PointLabel.text = "\(player.credit ?? "") cr."
                aDef3ContainerView.isHidden = false
                if player.captain == 1 {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "C"
                    aDef3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef3CaptainLabel.isHidden = false
                    aDef3CaptainLabel.text = "VC"
                    aDef3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aBat3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                 defStackView.spacing = 50
                if player.team == "team1" {
                    aDefView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView4.backgroundColor = .black
                    aDef4NameLabel.backgroundColor = .black
                }
                def4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef4NameLabel.text = sortName
                }
                //                aBat4NameLabel.text = player.name ?? ""
                aDef4PointLabel.text = "\(player.credit ?? "") cr."
                aDef4ContainerView.isHidden = false
                if player.captain == 1 {
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "C"
                    aDef4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef4CaptainLabel.isHidden = false
                    aDef4CaptainLabel.text = "VC"
                    aDef4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 4:
                 defStackView.spacing = 20
                if player.team == "team1" {
                    aDefView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aDef5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aDefView5.backgroundColor = .black
                    aDef5NameLabel.backgroundColor = .black
                }
                def5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aDef5NameLabel.text = sortName
                }
                
                aDef5PointLabel.text = "\(player.credit ?? "") cr."
                aDef5ContainerView.isHidden = false
                if player.captain == 1 {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "C"
                    aDef5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aDef5CaptainLabel.isHidden = false
                    aDef5CaptainLabel.text = "VC"
                    aDef5CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aDef5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            default:
                break
            }
        }
    }
    
    fileprivate func setFwdData() {
        for (index,player) in fwdArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aForwordView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView1.backgroundColor = .black
                    aFwd1NameLabel.backgroundColor = .black
                }
                fwd1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd1NameLabel.text = sortName
                }
                
                //                aAR1NameLabel.text = player.name ?? ""
                aFwd1PointLabel.text = "\(player.credit ?? "") cr."
                aFwd1ContainerView.isHidden = false
                if player.captain == 1 {
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "C"
                    aFwd1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd1CaptainLabel.isHidden = false
                    aFwd1CaptainLabel.text = "VC"
                    aFwd1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                fwdStackView.spacing = 100
                if player.team == "team1" {
                    aForwordView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView2.backgroundColor = .black
                    aFwd2NameLabel.backgroundColor = .black
                }
                fwd2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd2NameLabel.text = sortName
                }
                //                aAR2NameLabel.text = player.name ?? ""
                aFwd2PointLabel.text = "\(player.credit ?? "") cr."
                aFwd2ContainerView.isHidden = false
                if player.captain == 1 {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "C"
                    aFwd2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd2CaptainLabel.isHidden = false
                    aFwd2CaptainLabel.text = "VC"
                    aFwd2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                fwdStackView.spacing = 80
                if player.team == "team1" {
                    aForwordView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aFwd3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aForwordView3.backgroundColor = .black
                    aFwd3NameLabel.backgroundColor = .black
                }
                fwd3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aFwd3NameLabel.text = sortName
                }
                
                aFwd3PointLabel.text = "\(player.credit ?? "") cr."
                aFwd3ContainerView.isHidden = false
                if player.captain == 1 {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "C"
                    aFwd3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aFwd3CaptainLabel.isHidden = false
                    aFwd3CaptainLabel.text = "VC"
                    aFwd3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aFwd3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                
                
            default:
                break
            }
        }
    }
    
    fileprivate func setMidData() {
        for (index,player) in midRFielderArray.enumerated() {
            switch index {
            case 0:
                if player.team == "team1" {
                    aMidView1.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid1NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView1.backgroundColor = .black
                    aMid1NameLabel.backgroundColor = .black
                }
                mid1_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid1NameLabel.text = sortName
                }
                //                aBall1NameLabel.text = player.name ?? ""
                aMid1PointLabel.text = "\(player.credit ?? "") cr."
                aMid1ContainerView.isHidden = false
                if player.captain == 1 {
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "C"
                    aMid1CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid1CaptainLabel.isHidden = false
                    aMid1CaptainLabel.text = "VC"
                    aMid1CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid1ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 1:
                midFieldStackView.spacing = 100
                if player.team == "team1" {
                    aMidView2.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid2NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView2.backgroundColor = .black
                    aMid2NameLabel.backgroundColor = .black
                }
                mid2_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid2NameLabel.text = sortName
                }
                //                aBall2NameLabel.text = player.name ?? ""
                aMid2PointLabel.text = "\(player.credit ?? "") cr."
                aMid2ContainerView.isHidden = false
                if player.captain == 1 {
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "C"
                    aMid2CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid2CaptainLabel.isHidden = false
                    aMid2CaptainLabel.text = "VC"
                    aMid2CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid2ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 2:
                  midFieldStackView.spacing = 80
                if player.team == "team1" {
                    aMidView3.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid3NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView3.backgroundColor = .black
                    aMid3NameLabel.backgroundColor = .black
                }
                mid3_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid3NameLabel.text = sortName
                }
                //                aBall3NameLabel.text = player.name ?? ""
                aMid3PointLabel.text = "\(player.credit ?? "") cr."
                aMid3ContainerView.isHidden = false
                if player.captain == 1 {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "C"
                    aMid3CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid3CaptainLabel.isHidden = false
                    aMid3CaptainLabel.text = "VC"
                    aMid3CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid3ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 3:
                  midFieldStackView.spacing = 50
                if player.team == "team1" {
                    aMidView4.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid4NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView4.backgroundColor = .black
                    aMid4NameLabel.backgroundColor = .black
                }
                mid4_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid4NameLabel.text = sortName
                }
                
                aMid4PointLabel.text = "\(player.credit ?? "") cr."
                aMid4ContainerView.isHidden = false
                if player.captain == 1 {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "C"
                    aMid4CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid4CaptainLabel.isHidden = false
                    aMid4CaptainLabel.text = "VC"
                    aMid4CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    amid4ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
            case 4:
                  midFieldStackView.spacing = 20
                if player.team == "team1" {
                    aMidView5.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                    aMid5NameLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                } else {
                    aMidView5.backgroundColor = .black
                    aMid5NameLabel.backgroundColor = .black
                }
                mid5_Player_ID = player.id ?? 0
                let nameFormatter = PersonNameComponentsFormatter()
                if let nameComps  = nameFormatter.personNameComponents(from: player.name ?? ""), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"  // J. Singh
                    aMid5NameLabel.text = sortName
                }
                
                aMid5PointLabel.text = "\(player.credit ?? "") cr."
                aMid5ContainerView.isHidden = false
                if player.captain == 1 {
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "C"
                    aMid5CaptainLabel.backgroundColor = UIColor(red: 240, green: 75, blue: 80)
                }
                if player.vicecaptain == 1 {
                    aMid5CaptainLabel.isHidden = false
                    aMid5CaptainLabel.text = "VC"
                    aMid5CaptainLabel.backgroundColor = .black
                }
                if let imagePath = player.image {
                    let urlString1 = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    let imageUrl = URL(string: urlString1 ?? "")
                    aMid5ImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
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
    
    
    func openPlayerInfoVC(id: Int) {
        //            openViewController(controller: PlayerStaticsViewController.self, storyBoard: .homeStoryBoard) { (vc) in
        //    //            vc.teamId = self.teamId
        //                vc.matchKey = self.matchKey
        //                vc.playerID = id
        //            }
        
    }
}
