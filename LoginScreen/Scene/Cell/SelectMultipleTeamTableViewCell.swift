//
//  SelectMultipleTeamTableViewCell.swift
//  DreamTeam
//
//  Created by uu on 31/08/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class SelectMultipleTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var radioImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bowlTextLbl: UILabel!
    @IBOutlet weak var wkTextLbl: UILabel!
    @IBOutlet weak var arTextLbl: UILabel!
    @IBOutlet weak var batLbl: UILabel!
    @IBOutlet weak var bowlView: UIView!
    @IBOutlet weak var aContainerView: UIView!
    @IBOutlet weak var aTeamName: UILabel!
    @IBOutlet weak var aCaptainNameLabel: UILabel!
    @IBOutlet weak var aViceCaptainNameLabel: UILabel!
    @IBOutlet weak var aWKLabel: UILabel!
    @IBOutlet weak var aBatLabel: UILabel!
    @IBOutlet weak var aARLabel: UILabel!
    @IBOutlet weak var aBowlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.containerView.borderWidth = 1
//        self.containerView.borderColor = UIColor(red: 225, green: 225, blue: 225)

        // Configure the view for the selected state
    }
    func configureCell(data: MyTeamResponses) {
           
           var wkCount = 0
           var batCount = 0
           var arCount = 0
           var bowlCount = 0
//           teamResponse.removeAll()
//           storeOnePlayerData = data
           aTeamName.text = "Team \(data.teamnumber ?? 0)"
           if let players = data.players {
               for player in players {
                 
                   if player.captain == 1 {
                       aCaptainNameLabel.text = player.name
//                       captainId = player.id ?? 0
                   }
                   if player.vicecaptain == 1 {
                       aViceCaptainNameLabel.text = player.name
//                       vcid = player.id ?? 0
                   }
                   if player.role == "batsman" {
                       batCount += 1
                   }
                   if player.role == "allrounder" {
                       arCount += 1
                   }
                   if player.role == "bowler" {
                       bowlCount += 1
                   }
                   if player.role == "keeper" {
                       wkCount += 1
                   }
                   
//                     teamResponse.append(player.id ?? 0)
               }
               
               aWKLabel.text = "(\(wkCount))"
               aBowlLabel.text = "(\(bowlCount))"
               aBatLabel.text = "(\(batCount))"
               aARLabel.text = "(\(arCount))"
//               teamId = data.teamid ?? 0
           }

       }
}
