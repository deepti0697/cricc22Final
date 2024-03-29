//
//  TeamTableViewCell.swift
//  TeamBanao
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Rickey_iDev. All rights reserved.
//

import UIKit
protocol openPlayerProfile {
    func openProfile(playerResp:PlayerListResponses)
}
class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DullView: UIView!
    @IBOutlet weak var openPlayerProfile: UIButton!
    @IBOutlet weak var removePlayer: UIImageView!
    @IBOutlet weak var addPlayerImage: UIImageView!
 
    @IBOutlet weak var circularView: UIView!
    
    @IBOutlet weak var aPlayerSelectionLabel: UILabel!
    var check = false
    @IBOutlet weak var aSelectionView: UIView!
    @IBOutlet weak var aPlayerImage: UIImageView!
    @IBOutlet weak var aPlayerNameLabel: UILabel!
    @IBOutlet weak var aPlayerTeamNameLabel: UILabel!
    @IBOutlet weak var aPointLabel: UILabel!
    @IBOutlet weak var aCreditLabel: UILabel!
    var playerId:PlayerListResponses?
   var notSelectedCell = false
    var delegate:openPlayerProfile?
    override func awakeFromNib() {
        super.awakeFromNib()
        aPlayerImage.setCornerRadiusImageView(value: 20)
//         aPlayerSelectionView.setCornerRadius(value: 2.5)
   circularView.setCornerRadius(value: 3)
    }
    
//    func configureCell(playerData: PlayerListResponses) {
//
//        aPlayerNameLabel.text = playerData.name ?? ""
//        if let pointText = playerData.series_points {
//            aPointLabel.text = "\(pointText)"
//        }
//        aCreditLabel.text = playerData.credit ?? ""
//        aPlayerTeamNameLabel.text = "\(playerData.teamcode )".uppercased()
//        playerSelection(selected: playerData.isSelected == "1" ? true : false)
//
//        if let imagePath = playerData.image {
//            let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            let imageUrl = URL(string: urlString ?? "")
//            aPlayerImage?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "sample"), options: .continueInBackground) { (img, err, cacheType, url) in
//            }
//        }
//        playerId = playerData
//
//    }
     func configureCell(playerData: PlayerListResponses) {
            if check {
                aPlayerNameLabel.text = playerData.name ?? ""
                       if let pointText = playerData.series_points {
                           aPointLabel.text = "\(pointText)"
                       }
                       aCreditLabel.text = playerData.credit ?? ""
                aPlayerTeamNameLabel.text = playerData.teamcode
                     playerSelection(selected:true)

                       if let imagePath = playerData.image {
                           let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                           let imageUrl = URL(string: urlString ?? "")
                           aPlayerImage?.sd_setImage(with: imageUrl, placeholderImage:#imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                           }
                       }
                if playerData.is_playing_show == 1 {
                if playerData.is_playing == 1 {
//                    playerSelectionWidth.constant = 35
                    circularView.backgroundColor = UIColor(red: 93 / 255, green: 180 / 255, blue: 84 / 255, alpha: 1.0)
                    aPlayerSelectionLabel.textColor = UIColor(red: 49, green: 139, blue: 22)
                          aPlayerSelectionLabel.text = " Playing  "
                      } else if playerData.is_playing == 0 {
//                          playerSelectionWidth.constant = 62
                    circularView.backgroundColor = .red
                    aPlayerSelectionLabel.textColor = UIColor(red: 240, green: 75, blue: 80)
                 
                          aPlayerSelectionLabel.text = " Not Playing "
                      } else {
                    circularView.isHidden = true
                    
//                          playerSelectionWidth.constant = 0
                          aPlayerSelectionLabel.isHidden = true
                      }
                }
                else {
                    circularView.isHidden = true
//                                         playerSelectionWidth.constant = 0
                                         aPlayerSelectionLabel.isHidden = true
                                     }

            }
            else if notSelectedCell {
                aPlayerNameLabel.text = playerData.name ?? ""
                           if let pointText = playerData.series_points {
                               aPointLabel.text = "\(pointText)"
                           }
                           aCreditLabel.text = playerData.credit ?? ""
                               aPlayerTeamNameLabel.text = playerData.teamcode
                         playerSelection(selected:false)
                
                self.DullView?.backgroundColor = .gray
                           if let imagePath = playerData.image {
                               let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                               let imageUrl = URL(string: urlString ?? "")
                               aPlayerImage?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                               }
                           }
                  if playerData.is_playing_show == 1 {
                if playerData.is_playing == 1 {
//                                        playerSelectionWidth.constant = 35
                    circularView.backgroundColor = UIColor(red: 85, green: 174, blue: 58)
                      aPlayerSelectionLabel.textColor = UIColor(red: 49, green: 139, blue: 22)
                                        aPlayerSelectionLabel.text = " Playing  "
                                    } else if playerData.is_playing == 0 {
//                                      playerSelectionWidth.constant = 62
                    aPlayerSelectionLabel.textColor = UIColor(red: 240, green: 75, blue: 80)
                    circularView.backgroundColor = UIColor(red: 85, green: 174, blue: 58)
                                        aPlayerSelectionLabel.text = " Not Playing "
                                    } else {
//                                       playerSelectionWidth.constant = 0
                                        aPlayerSelectionLabel.isHidden = true
                                    }
                }
                                     else {
                    circularView.isHidden = true
//                                        playerSelectionWidth.constant = 0
                                         aPlayerSelectionLabel.isHidden = true
                                     }
                
            }
            else {
            aPlayerNameLabel.text = playerData.name ?? ""
            if let pointText = playerData.series_points {
                aPointLabel.text = "\(pointText)"
            }
            aCreditLabel.text = playerData.credit ?? ""
                aPlayerTeamNameLabel.text = playerData.teamcode
          playerSelection(selected:false)

            if let imagePath = playerData.image {
                let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                let imageUrl = URL(string: urlString ?? "")
                aPlayerImage?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "Group 7421"), options: .continueInBackground) { (img, err, cacheType, url) in
                }
            }
     
                 if playerData.is_playing_show == 1 {
                if playerData.is_playing == 1 {
//                                        playerSelectionWidth.constant = 35
                                 aPlayerSelectionLabel.textColor = UIColor(red: 49, green: 139, blue: 22)
                    circularView.backgroundColor = UIColor(red: 85, green: 174, blue: 58)
                                        aPlayerSelectionLabel.text = " Playing  "
                                    } else if playerData.is_playing == 0 {
//                                         playerSelectionWidth.constant = 62
                    aPlayerSelectionLabel.textColor = UIColor(red: 240, green: 75, blue: 80)
                     circularView.backgroundColor = .red
                                        aPlayerSelectionLabel.text = " Not Playing "
                                    } else {
                    circularView.isHidden = true
//                                        playerSelectionWidth.constant = 0
                                        aPlayerSelectionLabel.isHidden = true
                                    }
                }
                                     else {
//                                         playerSelectionWidth.constant = 0
                                         aPlayerSelectionLabel.isHidden = true
                    circularView.isHidden = true
                }
                // aPlayerSelectionView.isHidden = true
              //  aPlayerSelectionLabel.isHidden = true
            }
        self.playerId = playerData
            
        }
        
    func playerSelection(selected: Bool) {
        aSelectionView.isHidden = !selected
        if aSelectionView.isHidden == false {
            addPlayerImage.isHidden = true
        }
        else {
            addPlayerImage.isHidden = false
        }
    }
    @IBAction func openPlayerStatisticView(_ sender: Any) {
        self.delegate?.openProfile(playerResp:playerId! )
    }
}

