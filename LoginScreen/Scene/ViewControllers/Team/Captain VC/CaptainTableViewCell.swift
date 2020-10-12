//
//  CaptainTableViewCell.swift
//  TeamBanao
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Rickey_iDev. All rights reserved.
//

import UIKit
protocol openCaptainProfile {
    func openProfile(playerResp:PlayerListResponses)
}
class CaptainTableViewCell: UITableViewCell {

    @IBOutlet weak var aNameLabel: UILabel!
    @IBOutlet weak var aImageView: UIImageView!
    @IBOutlet weak var aTeamNameLabel: UILabel!
    @IBOutlet weak var aPointsLabel: UILabel!
    @IBOutlet weak var aVCButton: UIButton!
    @IBOutlet weak var aCButton: UIButton!
    
    var delegate:openCaptainProfile?
     var playerId:PlayerListResponses?
    var captainClooseClouser: (() -> Void) = {}
    var vCaptainClooseClouser: (() -> Void) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }
    
    func configureCell(player: PlayerListResponses) {
        aNameLabel.text = "\(player.name ?? "")"
        aPointsLabel.text = "\(player.series_points ?? 0.0)"
        aTeamNameLabel.text = player.name
//        if let imagePath = player.player_image_path, let imageIcon = player.player_image {
//            let imageUrl = URL(string: imagePath + imageIcon)
//            aImageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "sample"), options: .continueInBackground) { (img, err, cacheType, url) in
//            }
//        }
        playerId = player
    }
    
    func setCornerRadius() {
        aCButton.setCornerRadius(value: 15)
        aVCButton.setCornerRadius(value: 15)
        aCButton.setBorderButton(color: .darkGray, size: 1)
        aVCButton.setBorderButton(color: .darkGray, size: 1)
    }
    
    func selectCaptain(select: Bool) {
//         aCButton.setTitleColor(select ? UIColor(red: 253, green: 185, blue: 40) : .clear, for: <#T##UIControl.State#>) =
        aCButton.backgroundColor = select ? UIColor(red: 253, green: 185, blue: 40) : .clear
        aCButton.setTitleColor(select ? .black : .lightGray, for: .normal)
        aCButton.setBorderButton(color: select ? UIColor(red: 253, green: 185, blue: 40): .darkGray, size: 1)
    }
    
    func selectVCaptain(select: Bool) {
        aVCButton.backgroundColor = select ? UIColor(red: 0, green: 64, blue: 161) : .clear
        aVCButton.setTitleColor(select ? .white : .lightGray, for: .normal)
        aVCButton.setBorderButton(color: select ? UIColor(red: 0, green: 64, blue: 161) : .darkGray, size: 1)
    }
    
    @IBAction func vCaptainButtonAction(_ sender: Any) {
        vCaptainClooseClouser()
    }
    
    @IBAction func captainButtonAction(_ sender: Any) {
        captainClooseClouser()
    }
    
    @IBAction func openProfile(_ sender: Any) {
        self.delegate?.openProfile(playerResp:playerId! )
    }
}
