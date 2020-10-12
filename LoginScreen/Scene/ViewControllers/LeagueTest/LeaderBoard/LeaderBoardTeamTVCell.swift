//
//  LeaderBoardTeamTVCell.swift
//  Club11
//
//  Created by Developer on 09/06/19.
//

import UIKit
protocol openTeamViewController {
    func openTeam(join_id : Int?,
     challenge_id : Int?,
     team_id : Int?,
     userid : Int?)
}

class LeaderBoardTeamTVCell: UITableViewCell {

    
   @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var youWonLbl: UILabel!
    @IBOutlet weak var aImageView: UIImageView!
    @IBOutlet weak var aTeamNameLabel: UILabel!
    @IBOutlet weak var aPointLabel: UILabel!
    @IBOutlet weak var aRankLabel: UILabel!
    @IBOutlet weak var aArrowImageView: UIImageView!
    var join_id : Int?
    var challenge_id : Int?
    var team_id : Int?
    var userid : Int?
    var challengeId:Int?
    var delegate:openTeamViewController?
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    var homeTyp:HomeType = .upcomming
    func configureCell(teams: GetLEaderBoardResponse, homeType: HomeType) {
        
       
        switch homeType {
        case .upcomming:
             join_id = teams.join_id
                       team_id = teams.team_id
                       userid = teams.user_id
                       challengeId = teams.challenge_id
                       aRankLabel.isHidden = true
                       aPointLabel.isHidden = true
//              aImageView.image = #imageLiteral(resourceName: "avatar")
//             if let checkID = UserDefaults.standard.object(forKey: kUserId) as? Int {
//                        if teams.user_id == checkID {
//                        aArrowImageView.isHidden = false
////
//                               self.backgroundColor =  UIColor(red: 8 / 255, green: 117 / 255, blue: 183 / 255, alpha: 0.25)
//                           arrowButton.isHidden = false
//                                   }
//                                   else {
//                             arrowButton.isHidden = true
//                            aArrowImageView.isHidden = true
//                            self.backgroundColor = .white
////                                       myTeamView.isHidden = true
//                                       }
//                                   }
//
          aTeamNameLabel.text = "\(teams.name ?? "Team")"
            if let imagePath = teams.user_image {
                                                                let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                                                let imageUrl = URL(string: urlString ?? "")
                                                                aImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                                                                }
                                                            }
            youWonLbl.isHidden = true
            
        case .live:
            aRankLabel.isHidden = false
            aPointLabel.isHidden = false
            arrowButton.isHidden = true
            aArrowImageView.isHidden = true
            aTeamNameLabel.text = "\(teams.name ?? "Team")"
            youWonLbl.isHidden = true
           if let imagePath = teams.user_image {
                                                             let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                                             let imageUrl = URL(string: urlString ?? "")
                                                             aImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                                                             }
                                                         }
            
        case .result:
            aRankLabel.isHidden = false
            aPointLabel.isHidden = false
            aArrowImageView.isHidden = true
//           let imageUrl = URL(string: teams.user_image ?? "" )
//           aImageView.kf.setImage(with: imageUrl)
             arrowButton.isHidden = true
             aArrowImageView.isHidden = true
            youWonLbl.isHidden = false
            
            youWonLbl.text = "Winning \(kRupeeIcon)\(teams.win_amount ?? "0")"
            
//                youWonLbl.textColor = UIColor(red: 8, green: 117, blue:183)
//             if let checkID = UserDefaults.standard.object(forKey: kUserId) as? Int {
//                                  if teams.user_id == checkID {
//                           self.backgroundColor = UIColor(red: 8 / 255, green: 117 / 255, blue: 183 / 255, alpha: 0.25)
//                       } else {
//                           self.backgroundColor = .white
//                       }
            
        
        aTeamNameLabel.text = "\(teams.name ?? "Team")"
        aPointLabel.text = teams.points ?? "0.0"
        aRankLabel.text = "\(teams.userrank ?? 0)"
        if let imagePath = teams.user_image {
                                                          let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                                          let imageUrl = URL(string: urlString ?? "")
                                                          aImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                                                          }
                                                      }
//        if let arrowName = teams.arrowname {
//            
//                aArrowImageView.image = UIImage(named: "arrow_up")
//            
//        }
//    }
        }
    }
  @IBAction func SwitchTeam(_ sender: Any) {
        self.delegate?.openTeam(join_id: join_id, challenge_id: challenge_id, team_id: team_id, userid: userid)
    }
}
