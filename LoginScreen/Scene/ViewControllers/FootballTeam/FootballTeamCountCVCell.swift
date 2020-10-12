//
//  FootballTeamCountCVCell.swift
//  DreamTeam
//
//  Created by Test on 06/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class FootballTeamCountCVCell: UICollectionViewCell {
    
    @IBOutlet weak var aimageView: UIImageView!
        @IBOutlet weak var aLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            aLabel.setCornerRadius(value: ScreenSize.SCREEN_WIDTH / 30)
        }
        
        func configureCell(index: Int) {
            if index == 10 {
                aLabel.text = "11"
                aLabel.textColor = .clear
                aLabel.backgroundColor = .clear
                   aimageView.image = #imageLiteral(resourceName: "ic_team_unselected_progress_4")
            } else {
                aLabel.textColor = .clear
                aLabel.backgroundColor = .clear
                aimageView.image = #imageLiteral(resourceName: "ic_team_unselected_progress_4")
                
            }
            for (num, _) in APP_DEL.footballChoosedTeamArray.enumerated() {
                if index <= num {
                    aLabel.text = "\(index + 1)"
                    aLabel.textColor = .clear
                    aimageView.image = #imageLiteral(resourceName: "ic_team_selected_progress_6")
                   // aLabel.backgroundColor = UIColor(red: 240, green: 136, blue: 33)
                }
            }
        }
        
    }

