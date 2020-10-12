//
//  LeaderboardCollectionViewCell.swift
//  DreamTeam
//
//  Created by Test on 03/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
protocol openLEaderBoardPrview {
  func  sendLEaderBoardPReviewData(teamID: Int, challengeID: Int, userID: Int)
  
        func OpenSelectionVc(join_id : Int?,
        challenge_id : Int?,
        team_id : Int?,
        userid : Int?)
    
}
class LeaderboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var aTableView: UITableView!
    var delegate:openLEaderBoardPrview?
    @IBOutlet weak var downloadLbl: UILabel!
    @IBOutlet weak var downloadImageView: UIImageView!
    @IBOutlet weak var dowloadButton: UIButton!
    var leaderBoardRespnse = [GetLEaderBoardResponse]() {
        didSet {
            aTableView.reloadDataInMainQueue()
        }
    }
    override func awakeFromNib() {
           super.awakeFromNib()
        if homeType == .upcomming {
             downloadLbl.isHidden = true
                          downloadImageView.isHidden = true
                          dowloadButton.isHidden = true
//                          compareTeamLive.isHidden = true
//                          liveImage.isHidden = true
                
            }
        else {
            downloadLbl.isHidden = false
            downloadImageView.isHidden = false
            dowloadButton.isHidden = false
        }
           register()
       }
    var homeType: HomeType = .live
    var pdf: (() -> Void) = { }
    @IBAction func downloadButtonAction(_ sender: Any) {
    pdf()
    }
    
}
extension LeaderboardCollectionViewCell:  UITableViewDelegate, UITableViewDataSource {
    func register() {
           aTableView.register(UINib(nibName: LeaderBoardTeamTVCell.identifier(), bundle: nil), forCellReuseIdentifier: LeaderBoardTeamTVCell.identifier())

       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderBoardRespnse.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderBoardTeamTVCell.identifier(), for: indexPath) as! LeaderBoardTeamTVCell
        cell.delegate = self
        cell.homeTyp = homeType
        cell.configureCell(teams: leaderBoardRespnse[indexPath.row], homeType: homeType)
        if cell.homeTyp == .upcomming {
            if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                                         
                                         let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                if let checkID = UserDic.value(forKey: "user_id") as? Int {
                                            if leaderBoardRespnse[indexPath.row].user_id == checkID {
                                                cell.aArrowImageView.isHidden = false
                    //
                                                cell.backgroundColor =  UIColor(red: 247, green: 247, blue: 247)
                                                cell.arrowButton.isHidden = false
                                                       }
                                                       else {
                                                cell.arrowButton.isHidden = true
                                                cell.aArrowImageView.isHidden = true
                                                cell.backgroundColor = .white
                    //                                       myTeamView.isHidden = true
                                                           }
                                                       }
                else {
                    cell.arrowButton.isHidden = true
                                                                cell.aArrowImageView.isHidden = true
                                                                            cell.backgroundColor = .white
                }
            }
        }
        else {
            cell.arrowButton.isHidden = true
                                                           cell.aArrowImageView.isHidden = true
                                                           cell.backgroundColor = .white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if homeType == .upcomming {
               let data = leaderBoardRespnse[indexPath.row]
        
            if let datas:Int = UserDefaults.standard.object(forKey: kUserId) as? Int {
                           
                if data.user_id == datas {
                   let data = leaderBoardRespnse[indexPath.row]
                   if let tID = data.team_id, let cID = data.challenge_id, let uID = data.user_id {
                    self.delegate?.sendLEaderBoardPReviewData(teamID: tID, challengeID: cID, userID: uID)
                   }
               }
            
               else {
            
                Loader.showToast(message: "You can preview team after match start", onView: self, bottomMargin: 200, color: UIColor(red: 240, green: 75, blue: 80))

               }
            }
        }
        else {
            let data = leaderBoardRespnse[indexPath.row]
                 
                     
                           
                            if let tID = data.team_id, let cID = data.challenge_id, let uID = data.user_id {
                             self.delegate?.sendLEaderBoardPReviewData(teamID: tID, challengeID: cID, userID: uID)
                            }
                        }
        
       
    }
}
extension LeaderboardCollectionViewCell :openTeamViewController {
    func openTeam(join_id: Int?, challenge_id: Int?, team_id: Int?, userid: Int?) {
//        if let joind = leaderBoardRespnse[0] {
        self.delegate?.OpenSelectionVc(join_id: join_id, challenge_id: challenge_id, team_id: team_id, userid: userid)
//    }
    
    }
    
    
}
