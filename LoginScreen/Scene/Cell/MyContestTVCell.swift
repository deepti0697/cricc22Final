//
//  MyContestTVCell.swift
//  Club11
//
//  Created by Developer on 28/05/19.
//

import UIKit

class MyContestTVCell: UITableViewCell {
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var totalWinningLalbal: UILabel!
    @IBOutlet weak var aJoinedContestCountLabel: UILabel!
    @IBOutlet weak var aContainerView: UIView!
    @IBOutlet weak var aFirstTeamNameLabel: UILabel!
    @IBOutlet weak var aSecondTeamNameLabel: UILabel!
    @IBOutlet weak var aSeriesNameLabel: UILabel!
    @IBOutlet weak var aTimeLabel: UILabel!
    @IBOutlet weak var aFirstTeamImageView: UIImageView!
    @IBOutlet weak var aSecondImageView: UIImageView!
    
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var homeType: HomeType = .upcomming

    override func awakeFromNib() {
        super.awakeFromNib()
        aContainerView.setCornerRadius(value: 5)
        
//        aFirstTeamImageView.setCornerRadiusImageView(value: 25)
//        aSecondImageView.setCornerRadiusImageView(value: 25)
//        aFirstTeamImageView.setBorderImageView(color: .lightGray, size: 1)
//        aFirstTeamImageView.setBorderImageView(color: .lightGray, size: 1)
    }
    
    override func prepareForReuse() {
        aTimeLabel.text = ""
    }
    
    func configureMyContestCell(data: MyContestLiveLeagues) {
         totalWinningLalbal.text = "Total winning: \(kRupeeIcon) \(data.winning_total ?? 0) "
         aSeriesNameLabel.text = data.name  ?? ""
                aFirstTeamNameLabel.text = data.team1display ?? ""
                aSecondTeamNameLabel.text = data.team2display ?? ""
//
        
                if let imagePath1 = data.team1logo {
                    let urlString = imagePath1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

                    let imageUrl = URL(string: urlString ?? "")
                    aFirstTeamImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
                if let imagePath2 = data.team2logo {
                    let urlString = imagePath2.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

                    let imageUrl = URL(string: urlString ?? "")
                    aSecondImageView?.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "team_placeholder"), options: .continueInBackground) { (img, err, cacheType, url) in
                    }
                }
       
                if let time = data.start_date {
                    switch homeType {
                    case .live:
                        arrowImage.isHidden = false
                        totalWinningLalbal.isHidden = true
                        if data.match_status == "Under Review" {
                          aTimeLabel.text = "Under Review"
                        }
                        else {
                            aTimeLabel.text = "In Progress"
                        }
                      
                        aTimeLabel.textColor = UIColor(red: 33, green: 157, blue: 71)
                    case .result:
                         arrowImage.isHidden = true
                         totalWinningLalbal.isHidden = false
                        aTimeLabel.text = "Winner Declared"
                        aTimeLabel.textColor = UIColor(red: 33, green: 157, blue: 71)
                    case .upcomming:
                        arrowImage.isHidden = false
                         totalWinningLalbal.isHidden = true
                        aTimeLabel.textColor = UIColor(red: 0, green: 83, blue: 161)
                        setReleaseTime(releaseDateString: time)
                    }
                }
        aJoinedContestCountLabel.text = "\(data.joined_count ?? 0) Contest Joined"
            }
            
            fileprivate func setReleaseTime(releaseDateString: String) {
                let releaseDateFormatter = DateFormatter()
                releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
                countdownTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
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
                let countdown = "\(Utility.getStringFrom(seconds: day))D \(Utility.getStringFrom(seconds: hour))H \(Utility.getStringFrom(seconds: minute))M \(Utility.getStringFrom(seconds: second))S"
                switch homeType {
                case .live:
                    aTimeLabel.text = "In Progress"
//                    aTimeLabel.textColor = .black
                case .result:
                    aTimeLabel.text = "Winner Declared"
//                    aTimeLabel.textColor =  .black
                case .upcomming:
                    aTimeLabel.text = countdown
//                    aTimeLabel.textColor =  UIColor(red: 240, green: 75, blue: 80)
                }
                if day == 0 && hour == 0 && minute == 0 && second == 0 {
                    countdownTimer.invalidate()
                }
            }
            
        }
