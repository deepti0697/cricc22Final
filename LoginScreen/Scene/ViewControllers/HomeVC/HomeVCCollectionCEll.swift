//
//  HomeVCCollectionCEll.swift
//  DreamTeam
//
//  Created by Test on 31/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit
protocol typeOfMatch {
    func sendgetMatchDetail(contstData:GetMatchDetails,matchType:String)
}

class HomeVCCollectionCEll : UICollectionViewCell {
    @IBOutlet weak var aTableView: UITableView!
       @IBOutlet weak var aNoDataLabel: UILabel!
    
    @IBOutlet weak var upcomingMatchLbl: UILabel!
    @IBOutlet weak var noMatchImageView: UIImageView!
    var contestFootballData = [GetMatchDetails]() {
        didSet {
            aTableView.reloadDataInMainQueue()
        }
    }
    var contestKabaddiData = [GetMatchDetails]() {
    didSet {
        aTableView.reloadDataInMainQueue()
    }
    }
    var delegate: typeOfMatch?
    var contestData = [GetMatchDetails]() {
        didSet {
            aTableView.reloadDataInMainQueue()
        }
    }
    var itematIndex = -1 {
           didSet {
               aTableView.reloadDataInMainQueue()
           }
       }
     var matchType: MatchesType = .cricket
    func showNoDataLabel(show: Bool, text: String) {
           aNoDataLabel.isHidden = !show
           aNoDataLabel.text = text
        noMatchImageView.isHidden = !show
//        if aNoDataLabel.isHidden == true {
//            upcomingMatchLbl.isHidden = false
//            upcomingMatchLbl.text = "Upcoming Matches"
//        }
//        else {
//            upcomingMatchLbl.isHidden = true
//        }
       }
      

        override func awakeFromNib() {
            super.awakeFromNib()
            registerCell()
        }
        
        @objc private func refreshWeatherData(_ sender: Any) {
            aTableView.reloadDataInMainQueue()
        }
        
        fileprivate func registerCell() {
            aTableView.register(UINib(nibName: HomeTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier())
        }
        
       
       
    }

    extension HomeVCCollectionCEll: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch itematIndex {
            case 0:
              return  contestData.count
            case 1:
               return contestKabaddiData.count
            case 2:
              return  contestFootballData.count
            default:
                  return contestData.count
            }
          
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:  HomeTableViewCell.identifier(), for: indexPath) as! HomeTableViewCell
                cell.celltype = self.matchType

            switch  itematIndex{
            case 0:
                if contestData.count > 0 {
                     cell.configureMyContestCell(data: contestData[indexPath.row])
                }
                
            case 1:
                if contestKabaddiData.count > 0 {
                    cell.configureMyContestCellKABADDI(data: contestKabaddiData[indexPath.row])
                }
                 
            case 2:
                if contestFootballData.count > 0 {
                    cell.configureMyContestCellFootball(data: contestFootballData[indexPath.row])
                }
                 
            default:
                 cell.configureMyContestCell(data: contestData[indexPath.row])
            }
            
            

            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch itematIndex {
            case 0:
                delegate?.sendgetMatchDetail(contstData: contestData[indexPath.row], matchType: "CRICKET")
            case 1:
                delegate?.sendgetMatchDetail(contstData: contestKabaddiData[indexPath.row], matchType: "KABADDI")
            case 2:
                delegate?.sendgetMatchDetail(contstData: contestFootballData[indexPath.row], matchType: "FOOTBALL")
            default:
                break
            }
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
    }


