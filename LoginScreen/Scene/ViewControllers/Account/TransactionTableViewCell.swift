//
//  TransactionTableViewCell.swift
//  DreamTeam
//
//  Created by Test on 01/06/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var createId: UILabel!
    @IBOutlet weak var transactionid: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellConfigure(response:myTransaction) {
        transactionType.text = response.transaction_type
        transactionid.text = response.transaction_id
        createId.text = response.created
        
        if response.add_amount != "0" {
            amount.text = "+ \(kRupeeIcon)\(response.amount ?? "")"
            amount.textColor = UIColor(red: 49, green: 139, blue: 22)
        }
        if response.deduct_amount != "0" {
            amount.text = "- \(kRupeeIcon)\(response.amount ?? "")"
            amount.textColor = UIColor(red: 240, green: 75, blue: 80)
        }
    }
}
