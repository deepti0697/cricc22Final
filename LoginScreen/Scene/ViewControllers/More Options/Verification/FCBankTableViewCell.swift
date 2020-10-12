//
//  FCBankTableViewCell.swift
//  FantasyCricket
//
//  Created by Developer on 20/05/19.
//  Copyright © 2019 Rickey_iDev. All rights reserved.
//

import UIKit

class FCBankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var aImageButton: UIButton!
    @IBOutlet weak var aImageUploadLabel: UILabel!
    @IBOutlet weak var aSubmitButton: UIButton!
    @IBOutlet weak var aAcountNameTextField: UITextField!
    @IBOutlet weak var aAcountNameLabel: UILabel!
    @IBOutlet weak var aAcountNumberTextField: UITextField!
    @IBOutlet weak var aAcountNumberLabel: UILabel!
    @IBOutlet weak var aAcountIFSCTextField: UITextField!
    @IBOutlet weak var aAcountIFSCLabel: UILabel!
    @IBOutlet weak var aAcountBankField: UITextField!
    @IBOutlet weak var aAcountbankLabel: UILabel!
    @IBOutlet weak var aContainerView: UIView!
    @IBOutlet weak var aImageView: UIImageView!
    
    var uploadImageClouser: ((AccountCellType) -> Void) = { _ in }
    var submitButtonActionClousure: ((_ accountName: String,_ accountNumber: String,_ ifscCode: String,_ bankName: String) -> Void) = { _,_,_,_ in }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        aAcountIFSCTextField.setLeftPaddingPoints(10.0)
        aAcountBankField.setLeftPaddingPoints(10.0)
        aAcountNameTextField.setLeftPaddingPoints(10.0)
       
        aAcountNumberTextField.setLeftPaddingPoints(10.0)
        aSubmitButton.setCornerRadiusButton(value: 5)
        aContainerView.setCornerRadius(value: 5)
        aImageButton.setDashedBorderButton(color: .lightGray)
    }
    
    func imageUploadMsg(isUpload: Bool) {
//        if isUpload {
//            aImageUploadLabel.text = "Your bank passbook/cheque image upload successfully"
//            aImageUploadLabel.textColor = .green
//        } else {
//            aImageUploadLabel.text = "Upload Bank Passbook/cheque Photo"
//            aImageUploadLabel.textColor = .lightGray
//        }
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        if let accountName = aAcountNameTextField.text, accountName != "", let accountNo = aAcountNumberTextField.text, accountNo != "", let ifscCode = aAcountIFSCTextField.text, ifscCode != "", let bankName = aAcountBankField.text, bankName != "" {
            submitButtonActionClousure(accountName,accountNo,ifscCode,bankName)
        } else {
            Loader.showToast(message: "Please enter all mentadtory fields", onView: self, bottomMargin: 200, color:UIColor(red: 240, green: 75, blue: 80) )
        }
        
    }
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        uploadImageClouser(.bankCellType)
    }
    
}
