//
//  FootballTeamTableViewCell.swift
//  DreamTeam
//
//  Created by Test on 06/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
protocol openfootballPlayerProfile {
    func openProfile(playerResp:PlayerListResponses)
}
class FootballTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var DullView: UIView!
      @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var openPlayerProfile: UIButton!
        @IBOutlet weak var removePlayer: UIImageView!
        @IBOutlet weak var addPlayerImage: UIImageView!
       @IBOutlet weak var playerSelectionWidth: NSLayoutConstraint!
        @IBOutlet weak var aPlayerSelectionLabel: UILabel!
        var check = false
        @IBOutlet weak var aSelectionView: UIView!
        @IBOutlet weak var aPlayerImage: UIImageView!
        @IBOutlet weak var aPlayerNameLabel: UILabel!
        @IBOutlet weak var aPlayerTeamNameLabel: UILabel!
        @IBOutlet weak var aPointLabel: UILabel!
        @IBOutlet weak var aCreditLabel: UILabel!
        var playerId:PlayerListResponses?
       
        var delegate:openfootballPlayerProfile?
        override func awakeFromNib() {
            super.awakeFromNib()
            aPlayerImage.setCornerRadiusImageView(value: 20)
            circularView.setCornerRadius(value: 3)
        }
        
    
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
                            circularView.isHidden = true
         //                                         playerSelectionWidth.constant = 0
                                                  aPlayerSelectionLabel.isHidden = true
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

