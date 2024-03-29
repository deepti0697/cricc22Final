//
//  ContestDetailVCViewController.swift
//  DreamTeam
//
//  Created by Test on 24/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import SwiftyJSON
class ContestDetailVCViewController: BaseClass {
    
    
    @IBOutlet weak var maxTeamHeightConstaint: NSLayoutConstraint!
    @IBOutlet weak var maxteamLbl: UILabel!
    @IBOutlet weak var aConfirmLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var aCollectionView: UICollectionView!
    @IBOutlet weak var superViewHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var firstRrank: UILabel!
//    @IBOutlet weak var firstTeamImageView: UIImageView!
    @IBOutlet weak var bonousPercentWidthConstraint: NSLayoutConstraint!
//    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var leaderBoardOutlt: UIButton!
    @IBOutlet weak var winnerOult: UIButton!
    var homeType: HomeType = .upcomming
    @IBOutlet weak var joinBtnOutlet: UIButton!
    @IBOutlet weak var totalNoofWinners: UILabel!
    @IBOutlet weak var multipleLbl: UILabel!
    @IBOutlet weak var bonusPercent: UILabel!
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var c: UILabel!
    @IBOutlet weak var bonus: UILabel!
    @IBOutlet weak var spotLeft: UILabel!
    @IBOutlet weak var totalSpot: UILabel!
    @IBOutlet weak var winningbrkupAmount: UILabel!
    @IBOutlet weak var prizePoolAmount: UILabel!
    @IBOutlet weak var teamdisplayName: UILabel!
       @IBOutlet weak var timeLbl: UILabel!
       @IBOutlet weak var team1DisplayName: UILabel!
       @IBOutlet weak var aTimerContainerView: UIView!
    @IBOutlet weak var aProgressView: UIProgressView!
    
    @IBOutlet weak var joinedContestHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var aBonusLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var aMultipleLabelWidthConstraint: NSLayoutConstraint!
    
    var notFromPreview = false
    var referCode = ""
    var matchType = ""
    var winnerBrkupRespnse = [WinnerbreakUpResponse]() {
        didSet {
            aCollectionView.reloadDataInMainQueue()
        }
    }
    var challngeRespnse:ChallengeRespnse?
    
    var leaderREsponse = [GetLEaderBoardResponse]() {
        didSet {
            aCollectionView.reloadDataInMainQueue()
        }
    }
    var visibleCellIndex = 0 {
        didSet {
            moveSelectionView(index: visibleCellIndex)
        }
    }
    var leagueType = ""
      var matchOFType = ""
      var refreshControl = UIRefreshControl()
      var availableBalance = ""
      var usableBalance = ""
      var confirmationView: ConfirmationView?
      var myTeamsData = [MyTeamResponses]()
    
      var entreeFee = 0
      var winnerBreakUpView: WinnerBreakupView?
      var contestData: GetMatchDetails?
    var contestLiveData:Any?
      var myContestResponse:myjoinedContest?
      var releaseDate: NSDate?
      var countdownTimer = Timer()
      var matchKey = ""
      var challengeId = 0
      var league: MyLeague?
    var joinedContest:myjoinedContest?
    var ifFromJoinedContest = false
      var leaderBoardArray = [GetLEaderBoardResponse]() {
          didSet {
//              aTableView.reloadDataInMainQueue()
          }
      }
      var joinedID = 0
     
      var pdfURLStr = ""
      var amount = ""
      var winning = ""
      var winners = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        winningbrkupAmount.setCornerRadius(value: 5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
//        addNavigationBar(navigationTitle: "Contest", titleContentMode: .left, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: true, isBinButtonShow: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        registerCell()
        if ifFromJoinedContest {
             setContestDataLive()
            if homeType == .upcomming {
            guard let data = myContestResponse else {
                return
            }
            setupJoined(joinedContest: data)
            }
            else {
                guard let data = challngeRespnse else { return }
                setuoChallenge(contest: data)
            }
            
        }
        else {
            if leagueType == "Contest" {
                setContestData()
                           guard let leaguedata = league else {
                               return
                           }
                            setup(league: leaguedata)
            }
            else {
                 setContestData()
                guard let data = myContestResponse else {
                               return
                           }
                setupJoined(joinedContest: data)
            }
             
        }
        if homeType == .upcomming {
            superViewHeightConstraint.constant = 160
            joinBtnOutlet.isHidden = false
            joinedContestHeightConstraint.constant = 50
        } else {
            joinBtnOutlet.isHidden = true
            superViewHeightConstraint.constant = 120
            joinedContestHeightConstraint.constant = 0
        }
       
        if !notFromPreview {
            getLeaderBoard()
                   getWinnerBreakupData()
        }
      
    }
    @IBAction func walletAction(_ sender: Any) {
        openViewController(controller: AccountCollectinViewController.self, storyBoard: .accountStoryBoard, handler: { (vc) in
                   
               })
    }
    override func handleWalletButtonAction() {
       
    }
    fileprivate func setContestData() {
        if let getcontestdata = contestData {
            teamdisplayName.text = getcontestdata.team1display
            team1DisplayName.text = getcontestdata.team2display
            matchKey = getcontestdata.matchkey ?? ""
//            if let imagePath = getcontestdata.team1logo {
//                                                let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//                                                let imageUrl = URL(string: urlString ?? "")
//                                                firstTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
//                                                }
//                                            }
//                      if let imagePath = getcontestdata.team2logo {
//                                                let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//                                                let imageUrl = URL(string: urlString ?? "")
//                                                secondTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
//                                                }
//                                            }

            if let time = getcontestdata.time_start {
                setReleaseTime(releaseDateString: time)
            }
        }
        
    }
    fileprivate func setContestDataLive() {
        if let getcontestdata = contestLiveData as? MyContestLiveLeagues {
            teamdisplayName.text = getcontestdata.team1display
            team1DisplayName.text = getcontestdata.team2display
            matchKey = getcontestdata.matchkey ?? ""
//            if let imagePath = getcontestdata.team1logo {
//                                      let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//                                      let imageUrl = URL(string: urlString ?? "")
//                                      firstTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
//                                      }
//                                  }
//            if let imagePath = getcontestdata.team2logo {
//                                      let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//                                      let imageUrl = URL(string: urlString ?? "")
//                                      secondTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
//                                      }
//                                  }

//            if firstTeamImageView == nil {
//                firstTeamImageView.image = #imageLiteral(resourceName: "team_placeholder")
//            }
//            if secondTeamImageView == nil {
//                secondTeamImageView.image = #imageLiteral(resourceName: "team_placeholder")
//            }
            if homeType == .live
            {
                timeLbl.text = "In Progress"
            }
            else if homeType == .upcomming {
                if let time = getcontestdata.time_start {
                    setReleaseTime(releaseDateString: time)
                }
            }
            else {
                timeLbl.text = "Winner Declared"
            }
        }
        
    }
     func openMyTeamVC(entryFee: Double, challengeID: Int) {
    
         openViewController(controller: MyTeamViewController.self, storyBoard: .homeStoryBoard) { (vc) in
            vc.myTeamsData = self.myTeamsData
             vc.contestData = self.contestData
             vc.challengeid = challengeID
             vc.enteryFees = entryFee
            vc.matchKey = self.matchKey
            vc.matchType = self.matchOFType
              vc.contestLiveDatas = self.contestLiveData as? MyContestLiveLeagues
         
     }
    }
    
    override func handleBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    func registerCell() {
        aCollectionView.register(UINib(nibName: ContestDetailCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: ContestDetailCollectionViewCell.identifier())
        
         aCollectionView.register(UINib(nibName: LeaderboardCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: LeaderboardCollectionViewCell.identifier())
    }
    
     func downloadButtonAction() {
        if homeType != .upcomming {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            guard let items = try? FileManager.default.contentsOfDirectory(atPath: path) else { return }
            
            for item in items {
                // This can be made better by using pathComponent
                let completePath = path.appending("/").appending(item)
                try? FileManager.default.removeItem(atPath: completePath)
            }
            
            let url = URL(string: pdfURLStr)
            let fileName = String((url!.lastPathComponent)) as NSString
            // Create destination URL
            guard let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as? URL else {
                return
            }
            let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName)")
            //Create URL to the source file you want to download
            let fileURL = URL(string: pdfURLStr)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            let request = URLRequest(url:fileURL!)
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("\(statusCode)")
                        print("Successfully downloaded")
                    }
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        do {
                            let contents  = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                            for indexx in 0..<contents.count {
                                if contents[indexx].lastPathComponent == destinationFileUrl.lastPathComponent {
                                    let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                                     DispatchQueue.main.async {
                                                                          self.present(activityViewController, animated: true, completion: nil)
                                                                       }
                                }
                            }
                        }
                        catch (let err) {
                            print("error: \(err)")
                        }
                    } catch (let writeError) {
                          DispatchQueue.main.async {
                        Loader.showToast(message: "File already exist", onView: self.view, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))
                        }
                        print("\(writeError)")
                    }
                } else {
                      DispatchQueue.main.async {
                    Loader.showToast(message: "Unable to find PDF", onView: self.view, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))
                    print("\(error?.localizedDescription ?? "")")
                    }
                }
            }
            task.resume()
        }
        
        else {
             Loader.showToast(message: "You can download team after Match start.", onView: self.view, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))
        }
    }

    func getWinnerBreakupData() {
           showActivityIndicator(sMessage: "Loading...")
           let headers = [
               "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDQwNzYwNCwiZXhwIjoxNTY0NDExMjA0LCJuYmYiOjE1NjQ0MDc2MDQsImp0aSI6IlJVb25mSDlWcXloT1Q2WUQiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.ivVe5vYrh2rDWYt98PqKgswj4bgMgx-iggBhNE3JBPQ",
               "content-type": "application/json",
               "Accept": "application/json",
               "cache-control": "no-cache"
               
           ]
           let parameters = ["challenge_id": challengeId, "matchkey": matchKey,"showLeaderBoard":"false"] as [String : Any]
           
           NetworkManager.post_Request2(urlService: kWinnerbreakUpURL, param: parameters, head: headers) { (response) in
               self.hideActivityIndicator()
               do {
                   if response != nil {
                       do {
                           let json =  try JSON(data: response as! Data)
                           let dataresponse = json["result"]
                           self.winnerBrkupRespnse.removeAll()
                        
                           for arr in dataresponse.arrayValue{
                               self.winnerBrkupRespnse.append(WinnerbreakUpResponse(json:arr))
                               
                               
                           }
                        
                           
                       }
                           
                       catch {
                           Loader.showAlert(message: "Status code 500: server internal error")
                       }
                   }
               }
           }
       }
    func getLeaderBoard() {
         showActivityIndicator(sMessage: "Loading...")
        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                 let headers = [
                               "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZXYucmdsYWJzLm5ldFwvcmVwb3NcL2tlc2hhdlwvbHVja3kxMVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NDQwNzYwNCwiZXhwIjoxNTY0NDExMjA0LCJuYmYiOjE1NjQ0MDc2MDQsImp0aSI6IlJVb25mSDlWcXloT1Q2WUQiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.ivVe5vYrh2rDWYt98PqKgswj4bgMgx-iggBhNE3JBPQ",
                               "content-type": "application/json",
                               "Accept": "application/json",
                               "cache-control": "no-cache"
                               
                           ]
                 let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
            let parameters = ["challenge_id": challengeId, "matchkey": matchKey,"showLeaderBoard":"true","user_id": UserDic.value(forKey: "user_id") ?? "0"] as [String : Any]
            NetworkManager.post_Request2(urlService: kLeaderboardURL, param: parameters, head: headers) {
                (response) in
                self.hideActivityIndicator()
                do {
                if response != nil {
                    let jsonRes = try JSON(data:response as! Data)
                    let result = jsonRes["result"]
                    let contest = result["contest"]
                    self.leaderREsponse.removeAll()
                    for arr in contest.arrayValue {
                        self.leaderREsponse.append(GetLEaderBoardResponse(json: arr))
                    }
                    
                }
            }
                catch {
                    self.view.makeToast(message: "Server Error")
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
    
    @IBAction func joinedContestAction(_ sender: Any) {
        if joinBtnOutlet.titleLabel?.text == "INVITE CONTEST" {
            inviteAction(code: referCode)
        }
        else {
        if myTeamsData.count == 0 {
            openCreateTeamVC()
        }
        else {
        openMyTeamVC(entryFee: Double(entreeFee), challengeID: challengeId)
        }
        }
    }
    
    func openCreateTeamVC() {
        if matchOFType == "CRICKET" {
            openViewController(controller: TeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                vc.contestData = self.contestData
              //  vc.teamNumber = "\(self.getTeamResponse.count + 1)"
            }
        }
        else if matchOFType == "KABADDI" {
            openViewController(controller: KABADDITeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                vc.contestData = self.contestData
              //  vc.teamNumber = "\(self.getTeamResponse.count + 1)"
            }
        }
        else {
            openViewController(controller: FootballTeamViewController.self, storyBoard: .teamStoryBoard) { (vc) in
                vc.contestData = self.contestData
              //  vc.teamNumber = "\(self.getTeamResponse.count + 1)"
            }
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
        let countdown = "\(Utility.getStringFrom(seconds: day))D: \(Utility.getStringFrom(seconds: hour))H: \(Utility.getStringFrom(seconds: minute))M: \(Utility.getStringFrom(seconds: second))S"
        timeLbl.text = countdown
        
        if day == 0 && hour == 0 && minute == 0 && second == 0 {
            countdownTimer.invalidate()
        }
    }
    func setuoChallenge(contest:ChallengeRespnse ){
        totalNoofWinners.text = "\(contest.totalwinners ?? "")  Team wins"
              winningbrkupAmount.text = kRupeeIcon + "\(contest.entryfee ?? Int(0.0))"
              prizePoolAmount.text = contest.win_amount
              totalSpot.text = "\(contest.maximum_user ?? 0) spots"
            
    showBonusView(show: false)
        showMultipleView(show: false)

         showConfirmView(show: false)
//              if contest.is_bonus != 0 {
//                  showBonusView(show: true)
//              } else {
//                  showBonusView(show: false)
//              }
//              if contest.confirmed_challenge != 0 {
//                  showConfirmView(show: true)
//              } else {
//
//              }
//              if contest.multi_entry != 0 {
//                joinBtnOutlet.setTitle("JOIN +", for: .normal)
//                  showMultipleView(show: true)
//              } else {
//                 joinBtnOutlet.setTitle("invite", for: .normal)
//                  //              }
              let totalSpot = Float(contest.maximum_user ?? 0)
          let joinedSpot = Float(contest.joinedusers ?? 0)
              let remainingSpot = totalSpot - joinedSpot
              if totalSpot == joinedSpot {
                  spotLeft.text = "Challenge Closed"
              } else {
                  spotLeft.text = " \(Int(remainingSpot)) Spots left"
              }
              let progressValue = joinedSpot / totalSpot
              aProgressView.progress = Float(progressValue)

    }
    func inviteAction(code: String) {
        let textToShare = [ "Here I challenge you to join my challenge Click to download Cric22 app & use my code \(code) to Play with me." ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.mail ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func setupJoined(joinedContest:myjoinedContest) {
        self.referCode = joinedContest.refercode ?? ""
        totalNoofWinners.text = "\(Int(joinedContest.totalwinners ?? 0) ) Team wins"
              winningbrkupAmount.text = kRupeeIcon + "\(joinedContest.entryfee ?? Int(0.0))"
              prizePoolAmount.text = "\(Double(joinedContest.win_amount ?? 0))"
              totalSpot.text = "\(joinedContest.maximum_user ?? 0) spots"
              firstRrank.text = "\(joinedContest.first_rank_prize ?? "")"
        maxteamLbl.text = "\(joinedContest.max_team_limit ?? 0)"
              self.matchKey = joinedContest.matchkey ?? ""
              if joinedContest.is_bonus != 0 {
                  showBonusView(show: true)
                bonusPercent.text = "\(joinedContest.bonus_percent ?? 0)"
              } else {
                  showBonusView(show: false)
              }
              if joinedContest.confirmed_challenge != 0 {
                  showConfirmView(show: true)
              } else {
                  showConfirmView(show: false)
              }
              if joinedContest.multi_entry != 0 {
                joinBtnOutlet.setTitle("JOIN+", for: .normal)
                  showMultipleView(show: true)
              } else {
                 joinBtnOutlet.setTitle("INVITE CONTEST", for: .normal)
                  showMultipleView(show: false)
              }
        
              let totalSpot = Float(joinedContest.maximum_user ?? 0)
          let joinedSpot = Float(joinedContest.joinedusers ?? 0)
              let remainingSpot = totalSpot - joinedSpot
              if totalSpot == joinedSpot {
                  spotLeft.text = "Challenge Closed"
              } else {
                  spotLeft.text = " \(Int(remainingSpot)) Spots left"
              }
              let progressValue = joinedSpot / totalSpot
              aProgressView.progress = Float(progressValue)
          }
    func setup(league:MyLeague) {
         //  challengeID = league.id ?? 0
        
        maxteamLbl.text = "\(league.max_team_limit ?? 0)"
         firstRrank.text = "\(league.first_rank_prize ?? 0)"
           totalNoofWinners.text = "\(Int(league.totalwinners ?? "0") ?? 0) % Team wins"
           winningbrkupAmount.text = kRupeeIcon + "\(league.entryfee ?? Int(0.0))"
           prizePoolAmount.text = "\(Double(league.win_amount ?? 0))"
           totalSpot.text = "\(league.maximum_user ?? 0) spots"
         //  aAmountLabel.text =
         //  winningAmmount =
      //     contestAmount = Double(league.entryfee ?? Int(0.0))
           self.matchKey = league.matchkey ?? ""
           if league.is_bonus != 0 {
               showBonusView(show: true)
            bonusPercent.text = "\(league.bonus_percent)"
           } else {
               showBonusView(show: false)
           }
           if league.confirmed_challenge != 0 {
               showConfirmView(show: true)
           } else {
               showConfirmView(show: false)
           }
           if league.multi_entry != 0 {
               showMultipleView(show: true)
           } else {
               showMultipleView(show: false)
           }
           let totalSpot = Float(league.maximum_user ?? 0)
       let joinedSpot = Float(league.joinedusers ?? 0)
           let remainingSpot = totalSpot - joinedSpot
           if totalSpot == joinedSpot {
               spotLeft.text = "Challenge Closed"
           } else {
               spotLeft.text = " \(Int(remainingSpot)) Spots left"
           }
           let progressValue = joinedSpot / totalSpot
           aProgressView.progress = Float(progressValue)
       }
       
       fileprivate func showBonusView(show: Bool) {
           bonus.isHidden = !show
           bonusPercent.isHidden = !show
           aBonusLabelWidthConstraint.constant = show ? 15 : 0
        bonousPercentWidthConstraint.constant = show ? 30 : 0
       }
       
       fileprivate func showConfirmView(show: Bool) {
           c.isHidden = !show
           aConfirmLabelWidthConstraint.constant = show ? 15 : 0
       }
       
       fileprivate func showMultipleView(show: Bool) {
           multipleLbl.isHidden = !show
           aMultipleLabelWidthConstraint.constant = show ? 15 : 0
        maxteamLbl.isHidden = !show
        maxTeamHeightConstaint.constant = show ? 25 : 0
       }
       
    func setup() {
    
//        league.
    }
    fileprivate func moveSelectionView(index: Int) {
           let selectionViewWidth = Int(ScreenSize.SCREEN_WIDTH / 2)
           switch index {
           //Live
           case 0:
            self.leaderBoardOutlt.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
            
                              // myView.heightAnchor.constraint(equalToConstant: 100).isActive = true
               UIView.animate(withDuration: 0.2) {
                   self.selectionView.frame = CGRect(x: 0, y: 35, width: selectionViewWidth, height: 2)
                self.winnerOult.setTitleColor(UIColor(red: 20, green: 20, blue: 20), for: .normal)
                   
               }
           //upcoming
           case 1:
               winnerOult.setTitleColor(UIColor(red: 142, green: 145, blue: 147), for: .normal)
              
               UIView.animate(withDuration: 0.2) {
                   self.selectionView.frame = CGRect(x: selectionViewWidth, y: 35, width: selectionViewWidth, height: 2)
                   self.leaderBoardOutlt.setTitleColor(UIColor(red: 20, green: 20, blue: 20), for: .normal)
                   
               }
           
           default:
               break
           }
       }
       
    @IBAction func winningBreakup(_ sender: Any) {
        moveSelectionView(index: 0)
         aCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func LeaderBoard(_ sender: Any) {
        moveSelectionView(index: 1)
         aCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ContestDetailVCViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContestDetailCollectionViewCell.identifier(), for: indexPath) as! ContestDetailCollectionViewCell
//        
         let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: LeaderboardCollectionViewCell.identifier(), for: indexPath) as! LeaderboardCollectionViewCell
              
        cell1.delegate = self
              cell1.pdf = {[weak self]  in
                            if let strongSelf = self {
                                                              strongSelf.downloadButtonAction()
                                                          }
                                                      }
              switch indexPath.item {
              case 0:
                cell.homeType = homeType
                if winnerBrkupRespnse.count > 0 {
                    
                  cell.winnerBreakupArr = winnerBrkupRespnse
                    return cell
                }
                else {
                    if winnerBrkupRespnse.count == 0 {
                     cell.winnerBreakupArr = winnerBrkupRespnse
                   
                }
                   return cell
                  }
              case 1 :
                cell1.homeType = homeType
                if leaderREsponse.count > 0 {
                    cell1.leaderBoardRespnse = leaderREsponse
                    return cell1
                }
                else {
                    if winnerBrkupRespnse.count == 0 {
                     cell1.leaderBoardRespnse = leaderREsponse
                    
                }
                 return cell1
                }
             
              default:
                
                
                cell.showNoDataLabel(show: true, text: "No data")
              return cell
              
       
    }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: aCollectionView.frame.width, height: aCollectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           visibleCellIndex = Utility.findCenterCellIndex(collectionView: aCollectionView)
       }
    public func collectionView(_ collectionView: UICollectionView, layout
       collectionViewLayout: UICollectionViewLayout,
       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
    
}
extension ContestDetailVCViewController:openLEaderBoardPrview {
    func OpenSelectionVc(join_id: Int?, challenge_id: Int?, team_id: Int?, userid: Int?) {
            
             openViewController(controller: MyTeamViewController.self, storyBoard: .homeStoryBoard) { (vc) in
    vc.myTeamsData = self.myTeamsData
               vc.contestData = self.contestData
                vc.challengeid = self.challengeId
                
    //           vc.enteryFees = entryFee
                vc.joinID = join_id
              vc.matchKey = self.matchKey
              vc.matchType = self.matchOFType
                vc.swtichTeam = true
              vc.contestLiveDatas = self.contestLiveData as? MyContestLiveLeagues
                      }
        }
        
        
    
    func sendLEaderBoardPReviewData(teamID: Int, challengeID: Int, userID: Int) {
        if matchOFType == "CRICKET" {
             openTeamPreview(teamID: teamID, challengeID: challengeID, userID: userID)
        }
        else if matchOFType == "FOOTBALL" {
            openFootball(teamID: teamID, challengeID: challengeID, userID: userID)
        }
        else {
            openKabaddiPreview(teamID: teamID, challengeID: challengeID, userID: userID)
        }
    }
    
    func openTeamPreview(teamID: Int, challengeID: Int, userID: Int) {
           openViewController(controller: PreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
               vc.teamId = teamID
               vc.contestData = self.contestData
               vc.isFromLeaderBoard = true
               vc.challengeID = challengeID
           }
       }
    func openKabaddiPreview(teamID: Int, challengeID: Int, userID: Int) {
              openViewController(controller: KabaddiPreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                  vc.teamId = teamID
                  vc.contestData = self.contestData
                  vc.isFromLeaderBoard = true
                  vc.challengeID = challengeID
              }
          }
    func openFootball(teamID: Int, challengeID: Int, userID: Int) {
                 openViewController(controller: FootballPreviewViewController.self, storyBoard: .homeStoryBoard) { (vc) in
                     vc.teamId = teamID
                     vc.contestData = self.contestData
                     vc.isFromLeaderBoard = true
                     vc.challengeID = challengeID
                 }
             }
}
