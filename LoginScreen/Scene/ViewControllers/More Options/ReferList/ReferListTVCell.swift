//
//  ReferListTVCell.swift
//  Club11
//
//  Created by Developer on 29/05/19.
//

import UIKit

class ReferListTVCell: UITableViewCell {

    @IBOutlet weak var aNameLabel: UILabel!
    @IBOutlet weak var aDateLabel: UILabel!
    @IBOutlet weak var AMoneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        AMoneyLabel.textColor = UIColor(red: 35 / 255, green: 186 / 255, blue: 46 / 255, alpha: 1.0)
    }

    func configureCell(data: ReferListResponse) {
        aNameLabel.text = data.email
//        aDateLabel.text = data.date
       
        AMoneyLabel.text = "\(kRupeeIcon) \(data.amount)"
        
    }
    
}
