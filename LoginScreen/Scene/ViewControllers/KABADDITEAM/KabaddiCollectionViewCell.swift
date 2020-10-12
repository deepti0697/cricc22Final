//
//  KabaddiCollectionCollectionViewCell.swift
//  DreamTeam
//
//  Created by Test on 05/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
protocol openPlayerStatisticProfileKabaddi {
    func sendDatatoMainVc(player:PlayerListResponses)
}
class KabaddiCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var aTableView: UITableView!
    var firstTeamName = ""
    var secondTeamName = ""
    var batIndexArray = [Int]()
    
    var allIndexArray = [Int]()
    var wkIndexArray = [Int]()
    var batSelectionClouser: ((Int) -> Void) = {_ in}
    var wkSelectionClouser: ((Int) -> Void) = {_ in}
    var allSelectionClouser: ((Int) -> Void) = {_ in}
    var playerCountClouser: ((Int) -> Void) = {_ in}
    var playerCreditClouser: ((Float) -> Void) = {_ in}
    var playerChoosedClouser: (() -> Void) = { }
    var delgate:openPlayerStatisticProfileKabaddi?
    var playerDataIndex = -1 {
        didSet {
            aTableView.reloadDataInMainQueue()
        }
    }
    var batSelectionTotal = 0 {
        didSet {
            batSelectionClouser(batSelectionTotal)
        }
    }
    
    var allSelectionTotal = 0 {
        didSet {
            allSelectionClouser(allSelectionTotal)
        }
    }
    var wkSelectionTotal = 0 {
        didSet {
            wkSelectionClouser(wkSelectionTotal)
        }
    }
    var playerCreditTotal = 0.0 {
        didSet {
            playerCreditClouser(Float(playerCreditTotal))
        }
    }
    var playerSelectionTotal = 0
    var remainingCr = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
    }
    
    func registerCell() {
        aTableView.register(UINib(nibName: KabaddiTeamTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: KabaddiTeamTableViewCell.identifier())
    }
}


extension KabaddiCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch playerDataIndex {
        case 0:
            return APP_DEL.kabaddiAllrounder.count
        case 1:
            return APP_DEL.KabaddiDefender.count
        case 2:
            return APP_DEL.KabaddiRaiders.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KabaddiTeamTableViewCell.identifier(), for: indexPath) as! KabaddiTeamTableViewCell
        cell.delegate = self
        switch playerDataIndex {
        case 0:
            
            let obj = APP_DEL.kabaddiAllrounder[indexPath.item]
            if APP_DEL.kabbaddiChoosedTeamArray.contains(where: {$0.id == obj.id}) {
                
                cell.check = true
                cell.DullView.alpha = 1
            }
            else {
                if APP_DEL.kabaddichoosedAllrounderArray.count >= 1 && APP_DEL.KabaddiExtraPlayer == 0 {
                    
                    cell.DullView.alpha = 0.3
                    
                }
                else if APP_DEL.kabaddichoosedAllrounderArray.count  == 3 {
                  cell.DullView.alpha = 0.3
                }
                else {
                    cell.DullView.alpha = 1
                    
                }
                
                cell.check = false
            }
            
            
            cell.configureCell(playerData: APP_DEL.kabaddiAllrounder[indexPath.item])
        case 1:
            let obj = APP_DEL.KabaddiDefender[indexPath.item]
            if APP_DEL.kabbaddiChoosedTeamArray.contains(where: {$0.id == obj.id}) {
                cell.check = true
                 cell.DullView.alpha = 1
            }
            else {
                if APP_DEL.kabaddichoosedDefenderArray.count >= 1 && APP_DEL.KabaddiExtraPlayer == 0 {
                    
                    cell.DullView.alpha = 0.3
                    
                }
                else if APP_DEL.kabaddichoosedDefenderArray.count == 3 {
                     cell.DullView.alpha = 0.3
                }
                else {
                    cell.DullView.alpha = 1
                }
                cell.check = false
            }
            
            cell.configureCell(playerData: APP_DEL.KabaddiDefender[indexPath.item])
        case 2:
            let obj = APP_DEL.KabaddiRaiders[indexPath.item]
            if APP_DEL.kabbaddiChoosedTeamArray.contains(where: {$0.id == obj.id}) {
                cell.check = true
            }
            else {
                if APP_DEL.kabaddichossedRaiderArray.count >= 1 && APP_DEL.KabaddiExtraPlayer == 0 {
                    
                    cell.DullView.alpha = 0.3
                    
                }
                else if APP_DEL.kabaddichossedRaiderArray.count == 3 {
                     cell.DullView.alpha = 0.3
                }
                else {
                    cell.DullView.alpha = 1
                    
                }
                
                cell.check = false
            }
            
            
            cell.configureCell(playerData: APP_DEL.KabaddiRaiders[indexPath.item])
            
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1 - true 0 false
        let cell = tableView.cellForRow(at: indexPath) as! KabaddiTeamTableViewCell
        switch playerDataIndex {
        case 0:
            
            if cell.check {
                let obj =  APP_DEL.kabaddiAllrounder[indexPath.item]
                
                APP_DEL.kabaddiAllrounder[indexPath.row].isSelected = "0"
                if  (APP_DEL.kabaddichoosedAllrounderArray.count > APP_DEL.minAR) {
                    APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
                }
                wkSelectionTotal -= 1
                cell.isSelected = false
                cell.check = false
                if let index2 = APP_DEL.kabbaddiChoosedTeamArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabbaddiChoosedTeamArray.remove(at: index2)
                }
                if let index = APP_DEL.kabaddichoosedAllrounderArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabaddichoosedAllrounderArray.remove(at: index)
                }
                
                removePlayerFromArray(player: APP_DEL.kabaddiAllrounder[indexPath.row])
                
            } else {
                cell.check = true
                if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                    
                    Loader.showToast(message: "You can choose maximum 7 Player", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                    
                    
                } else {
                    if playerTeamCountSeven(player: APP_DEL.kabaddiAllrounder[indexPath.row]) {
                        
                        Loader.showToast(message: "You can Select only 4 from a each team", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        
                        
                        
                    } else {
                        if checkCreaditLimitExceed(sPlayer: APP_DEL.kabaddiAllrounder[indexPath.row]) {
                            
                            Loader.showToast(message: "Only \(remainingCr) credit left", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            
                            
                        } else {
                            if APP_DEL.kabaddichoosedAllrounderArray.count != 3 {
                                if APP_DEL.kabaddichoosedAllrounderArray.count < APP_DEL.minAR || APP_DEL.KabaddiExtraPlayer > 0 {
                                    if APP_DEL.kabaddichoosedAllrounderArray.count >= APP_DEL.minAR {
                                        APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                    }
                                    let touple = toggle(selected: APP_DEL.kabaddiAllrounder[indexPath.row].isSelected == "1" ? true : false, total: wkSelectionTotal)
                                    APP_DEL.kabaddiAllrounder[indexPath.row].isSelected = touple.0
                                    wkSelectionTotal = touple.1
                                    addPlayerInArray(player: APP_DEL.kabaddiAllrounder[indexPath.row])
                                }
                                else {
                                    minimumPlayerWarning()
                                }
                            }else {
                                
                                Loader.showToast(message: "You can Select only 3 all rounder", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                                
                            }
                        }
                    }
                }
            }
        case 1:
            if cell.check {
                let obj =  APP_DEL.KabaddiDefender[indexPath.item]
                
                APP_DEL.KabaddiDefender[indexPath.row].isSelected = "0"
                if  (APP_DEL.kabaddichoosedDefenderArray.count > APP_DEL.minKabaddiDef) {
                    APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
                }
                batSelectionTotal -= 1
                cell.isSelected = false
                cell.check = false
                if let index2 = APP_DEL.kabbaddiChoosedTeamArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabbaddiChoosedTeamArray.remove(at: index2)
                }
                if let index = APP_DEL.kabaddichoosedDefenderArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabaddichoosedDefenderArray.remove(at: index)
                }
                
                removePlayerFromArray(player: APP_DEL.KabaddiDefender[indexPath.row])
                
            } else {
                cell.check = true
                if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                    
                    Loader.showToast(message: "You can choose maximum 7 Player", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                } else {
                    if playerTeamCountSeven(player: APP_DEL.KabaddiDefender[indexPath.row]) {
                        
                        Loader.showToast(message: "You can Select only 4  from each team", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        
                        
                    } else {
                        if checkCreaditLimitExceed(sPlayer: APP_DEL.KabaddiDefender[indexPath.row]) {
                            if DeviceType.IS_IPHONE_X_OR_GREATER {
                                Loader.showToast(message: "Only \(remainingCr) credit left", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            }
                            else {
                                Loader.showToast(message: "Only \(remainingCr) credit left", onView: self, bottomMargin: 0 , color: UIColor(red: 240, green: 75, blue: 80))
                            }
                        } else {
                            if APP_DEL.kabaddichoosedDefenderArray.count != 3 {
                                if APP_DEL.kabaddichoosedDefenderArray.count < APP_DEL.minKabaddiDef || APP_DEL.KabaddiExtraPlayer > 0 {
                                    if APP_DEL.kabaddichoosedDefenderArray.count >= APP_DEL.minKabaddiDef {
                                        APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                    }
                                    let touple = toggle(selected: APP_DEL.KabaddiDefender[indexPath.row].isSelected == "1" ? true : false, total: batSelectionTotal)
                                    APP_DEL.KabaddiDefender[indexPath.row].isSelected = touple.0
                                    batSelectionTotal = touple.1
                                    addPlayerInArray(player: APP_DEL.KabaddiDefender[indexPath.row])
                                }
                                else {
                                    minimumPlayerWarning()
                                }
                            } else {
                                
                                Loader.showToast(message: "You can Select only 3 Defenders", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                                
                                
                            }
                        }
                    }
                }
            }
        case 2:
            if cell.check {
                let obj =  APP_DEL.KabaddiRaiders[indexPath.item]
                
                APP_DEL.KabaddiRaiders[indexPath.row].isSelected = "0"
                if  (APP_DEL.kabaddichossedRaiderArray.count > APP_DEL.minRaid) {
                    APP_DEL.KabaddiExtraPlayer =  APP_DEL.KabaddiExtraPlayer + 1
                }
                allSelectionTotal -= 1
                cell.isSelected = false
                cell.check = false
                if let index2 = APP_DEL.kabbaddiChoosedTeamArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabbaddiChoosedTeamArray.remove(at: index2)
                }
                if let index = APP_DEL.kabaddichossedRaiderArray.firstIndex(where: {$0.id == obj.id}) {
                    APP_DEL.kabaddichossedRaiderArray.remove(at: index)
                }
                removePlayerFromArray(player: APP_DEL.KabaddiRaiders[indexPath.row])
                
            } else {
                cell.check = true
                
                if APP_DEL.kabbaddiChoosedTeamArray.count == 7 {
                    
                    Loader.showToast(message: "You can choose maximum 7 Player", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                    
                    
                } else {
                    if playerTeamCountSeven(player: APP_DEL.KabaddiRaiders[indexPath.row]) {
                        
                        Loader.showToast(message: "You can Select only 4 players from each team", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                        
                    } else {
                        if checkCreaditLimitExceed(sPlayer: APP_DEL.KabaddiRaiders[indexPath.row]) {
                            if DeviceType.IS_IPHONE_X_OR_GREATER {
                                Loader.showToast(message: "Only \(remainingCr) credit left", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                            }
                            else {
                                Loader.showToast(message: "Only \(remainingCr) credit left", onView: self, bottomMargin: 0 , color: UIColor(red: 240, green: 75, blue: 80))
                            }
                        } else {
                            if APP_DEL.kabaddichossedRaiderArray.count != 3 {
                                if APP_DEL.kabaddichossedRaiderArray.count < APP_DEL.minRaid || APP_DEL.KabaddiExtraPlayer > 0 {
                                    if APP_DEL.kabaddichossedRaiderArray.count >= APP_DEL.minRaid {
                                        APP_DEL.KabaddiExtraPlayer = APP_DEL.KabaddiExtraPlayer - 1
                                    }
                                    let touple = toggle(selected: APP_DEL.KabaddiRaiders[indexPath.row].isSelected == "1" ? true : false, total: allSelectionTotal)
                                    APP_DEL.KabaddiRaiders[indexPath.row].isSelected = touple.0
                                    allSelectionTotal = touple.1
                                    addPlayerInArray(player: APP_DEL.KabaddiRaiders[indexPath.row])
                                }
                                else {
                                    minimumPlayerWarning()
                                }
                            }else {
                                
                                Loader.showToast(message: "You can Select only 3 Raiders", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
                                
                                
                            }
                        }
                    }
                }
            }
            
        default:
            break
        }
        aTableView.reloadDataInMainQueue()
    }
    
    func minimumPlayerWarning() {
        if (APP_DEL.kabaddichoosedAllrounderArray.count < 1) {
            Loader.showToast(message:"You must select at least 1 All-Rounder.", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        } else if (APP_DEL.kabaddichoosedDefenderArray.count < 1) {
            Loader.showToast(message: "You must select at least 1 Defender.", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        } else if (APP_DEL.kabaddichossedRaiderArray.count < 1) {
            Loader.showToast(message: "You must select at least 1 Raider.", onView: self, bottomMargin: 30 , color: UIColor(red: 240, green: 75, blue: 80))
            
        }
    }
    func toggle(selected: Bool, total: Int) -> (String,Int) {
        if selected == true {
            playerSelectionTotal += 1
            return ("0", total - 1)
        }
        playerSelectionTotal -= 1
        if playerSelectionTotal <= 0 {
            playerSelectionTotal = 0
        }
        return ("1", total + 1)
    }
    
    
    func addPlayerInArray(player: PlayerListResponses) {
        
        
        
        if player.role == "defender" {
            APP_DEL.kabaddichoosedDefenderArray.append(player)
        }
        if player.role == "raider" {
            APP_DEL.kabaddichossedRaiderArray.append(player)
        }
        if player.role == "allrounder" {
            APP_DEL.kabaddichoosedAllrounderArray.append(player)
        }
        APP_DEL.kabbaddiChoosedTeamArray.append(player)
        playerCountClouser(APP_DEL.kabbaddiChoosedTeamArray.count)
        print("Add \(APP_DEL.kabbaddiChoosedTeamArray.count)")
        playerCreditCount()
        playerChoosedClouser()
    }
    func playerTeamCountSeven(player: PlayerListResponses) -> Bool {
        var tempFirstTotalPlayerCount = 0
        var tempSecondTotalPlayerCount = 0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        for player in players {
            guard let platerTeam = player.team else {
                return false
            }
            if (platerTeam == "team1") {
                tempFirstTotalPlayerCount += 1
            } else if (platerTeam == "team2") {
                tempSecondTotalPlayerCount += 1
            }
        }
        guard let platerTeam = player.team else {
            return false
        }
        if (platerTeam == "team1") {
            if tempFirstTotalPlayerCount  == 4 {
                return true
            } else {
                return false
            }
        } else {
            if tempSecondTotalPlayerCount  == 4 {
                return true
            } else {
                return false
            }
        }
    }
    
    func removePlayerFromArray(player: PlayerListResponses) {
        print("rem\(APP_DEL.kabbaddiChoosedTeamArray.count)")
        APP_DEL.kabbaddiChoosedTeamArray = APP_DEL.kabbaddiChoosedTeamArray.filter({ $0.name != player.name})
        playerCountClouser(APP_DEL.kabbaddiChoosedTeamArray.count)
        print("remo\(APP_DEL.kabbaddiChoosedTeamArray.count)")
        playerCreditCount()
        playerChoosedClouser()
    }
    
    func playerCreditCount() {
        playerCreditTotal = 0.0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        for player in players {
            if let playerCredit = player.credit {
                let pCr = Float(playerCredit) ?? 0.0
                playerCreditTotal += Double(pCr)
            }
        }
    }
    
    func checkCreaditLimitExceed(sPlayer: PlayerListResponses) -> Bool {
        var currentCredit = 0.0
        let players = APP_DEL.kabbaddiChoosedTeamArray
        for player in players {
            if let playerCredit = player.credit {
                let pCr = Double(playerCredit) ?? 0.0
                currentCredit += pCr
            }
        }
        remainingCr = 100.0 - currentCredit
        if let selectedPlayerCreadit = sPlayer.credit {
            if let sPCr = Double(selectedPlayerCreadit) {
                if remainingCr >= sPCr {
                    return false
                } else {
                    return true
                }
            }
        }
        return false
    }
    
}

extension KabaddiCollectionViewCell: openPlayerProfileKabaddi {
    func openProfile(playerResp: PlayerListResponses) {
        self.delgate?.sendDatatoMainVc(player:playerResp)
    }
    
}


