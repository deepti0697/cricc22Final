//
//  RegistrationViewController.swift
//  DreamTeam
//
//  Created by Test on 08/05/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PasswordTextField
import MBProgressHUD
import FormValidatorSwift
class RegistrationViewController: BaseClass {
    
  
    @IBOutlet weak var mobileNoTextField: UITextField!
    @IBOutlet weak var termsAndConditonButton: UIButton!
    @IBOutlet weak var refcodeTextField: UITextField!
   
    @IBOutlet weak var confirmPasswrdLbl: UILabel!
    @IBOutlet weak var passwrdTxtField: PasswordTextField!
    @IBOutlet weak var confirmPasswrdTxtField: PasswordTextField!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var termsAndConditionLbl: UILabel!
    @IBOutlet weak var checkbtn: CustomCheckBox!
    @IBOutlet weak var dobPlaceholdeerLbl: UILabel!
    @IBOutlet weak var passwrdPlceholderLbl: UILabel!
    @IBOutlet weak var emailPlaceHolderLbl: UILabel!
    @IBOutlet weak var mobilenoplaceHolder: UILabel!
    @IBOutlet weak var refcodePlaceHolderLbl: UILabel!
    @IBOutlet weak var DateOfBirthTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    let datePicker = UIDatePicker()
       let toolbar = UIToolbar()
    var storeDatainForm = RegisterForDataM()
    let conditon = AlphanumericCondition()
     var isCheckBoxClicked = false
    var controleRegistrationForm = ControlForm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupDefaultNavigationBar()
         setupDatePicker()
    }
    //hitapi()
    //        WebServices.register(parameters: param, success:  { (json) in
    //            print(json)
    //
    //        }, failure: NSError)
    
    override func viewWillAppear(_ animated: Bool) {
//        addNavigationBar(navigationTitle: "Register", titleContentMode: .center, isNavImageShow: false, isBackButtonShow: true, isWalletButtonShow: false, isBinButtonShow: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        hidenavigationBackButton()
        if (UserDefaults.standard.value(forKey: "loginDataTemp") as? NSData) != nil {
                                                                                          
                                                          
                                                    UserDefaults.standard.removeObject(forKey: "loginDataTemp")
                                                    for key in UserDefaults.standard.dictionaryRepresentation().keys {
                                                        UserDefaults.standard.removeObject(forKey: key)
                                                    }
                                                    
                                            }
        setup()
        AddBottomLineonTextField()
         makeTappableString()
        
    }
    override func handleBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    func makeTappableString() {
     termsAndConditionLbl.text = "By registering, I agree Terms & Conditions"
            let text = "By registering I agree Terms & Conditions"
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of:"Terms & Conditions")
        
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range1)
        termsAndConditionLbl.isUserInteractionEnabled = true
        termsAndConditionLbl.attributedText = underlineAttriString
        termsAndConditionLbl.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))

    }
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
           let text = "By registering I agree Terms & Conditions "
                let termsRange = (text as NSString).range(of: "Terms & Conditions")
        //let privacyRange = (text as NSString).range(of: "Privacy Policy")
           
           if gesture.didTapAttributedTextInLabel(label: termsAndConditionLbl, inRange: termsRange) {
               openViewController(controller: TermAndConditionViewController.self, storyBoard: .moreStoryBoard) { (vc) in
                   
               }
           
           } else {
               print("Tapped none")
           }
       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    func setup() {
        passwrdTxtField.autocorrectionType = .no
        confirmPasswrdTxtField.autocorrectionType = .no
        
   passwrdTxtField.customHideSecureTextImage = #imageLiteral(resourceName: "ic_password_view")
        passwrdTxtField.customShowSecureTextImage = #imageLiteral(resourceName: "view")
       confirmPasswrdTxtField.customHideSecureTextImage = #imageLiteral(resourceName: "ic_password_view")
   confirmPasswrdTxtField.customShowSecureTextImage = #imageLiteral(resourceName: "view")
//
        refcodePlaceHolderLbl.text = StringConstant.referCode
        refcodePlaceHolderLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
        mobilenoplaceHolder.text = StringConstant.mobileNumber
        mobilenoplaceHolder.textColor = UIColor.FlatColor.Grey.DarkGrey
        emailPlaceHolderLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
        emailPlaceHolderLbl.text = StringConstant.email
        passwrdPlceholderLbl.text = StringConstant.password
        confirmPasswrdLbl.text = StringConstant.confirmPassword
        passwrdPlceholderLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
        confirmPasswrdLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
//        termsAndConditionLbl.text = StringConstant.agreeLbl
//        termsAndConditionLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
     //   termsAndConditonButton.setTitle(StringConstant.termsConditions, for: .normal)
        dobPlaceholdeerLbl.text = StringConstant.dob
        DateOfBirthTxtField.inputAccessoryView = toolbar
          DateOfBirthTxtField.inputView = datePicker

        createAccountBtn.setTitle(StringConstant.createAccount, for: .normal)
        dobPlaceholdeerLbl.textColor = UIColor.FlatColor.Grey.DarkGrey
        createAccountBtn.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
        createAccountBtn.setTitleColor(.black, for: .normal)
//        bottomline(btn: termsAndConditonButton, color: UIColor.FlatColor.Blue.GreenishBlue, height: 1)
//
    }
    func setupDatePicker() {
        datePicker.datePickerMode = .date
        toolbar.sizeToFit()
        let calendar = Calendar.current
        var components = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate = calendar.date(byAdding: components, to: Date())
        datePicker.maximumDate = maxDate
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
    }
    @objc func donedatePicker(){
          let formatter = DateFormatter()
          formatter.dateFormat = "dd-MMM-yyyy"
          DateOfBirthTxtField.text = formatter.string(from: datePicker.date)
          DateOfBirthTxtField.resignFirstResponder()
      }
      @objc func cancelDatePicker(){
          self.view.endEditing(true)
      }
    func checkisAllTextFieldFill(){
        
    }
    
    func AddBottomLineonTextField() {
        
    }
    @IBAction func checkBoxButtonACtion(_ sender: UIButton) {
    self.view.endEditing(true)
               sender.isSelected = !sender.isSelected
               if sender.isSelected {
                  
                   isCheckBoxClicked = true
               } else {

                   isCheckBoxClicked = false
               }
    }
    
   
    
    @IBAction func continuetoverfication(_ sender: Any) {
        
      self.view.endEditing(true)
            if isCheckBoxClicked {
                let validmobile = validateMobileFields()
                let emailValidationRes = validateEmailFields()
//                let dobValidationRes = validateDOB()
                let passwordValidationRes = validatePasswordFields()
                let confirmPasswordValidationRes = validateConfirmPassword()
              
                if validmobile != "" {
                    self.view.makeToast(message: validmobile)

                }
             else if emailValidationRes != "" {
                    self.view.makeToast(message: emailValidationRes)

                }
               
                 else if passwordValidationRes != "" {
                  self.view.makeToast(message: passwordValidationRes)
                }else if confirmPasswordValidationRes != "" {
                    self.view.makeToast(message: confirmPasswordValidationRes)
                }
                else {
                    UserRegisterationApi()
                }
            } else {
               
                self.view.makeToast(message: "Please agree Terms and Conditions & Privacy Policy.")
            }
        }
        
        
        
        
    
    func UserRegisterationApi()  {
        // Show Loder
        if Connectivity.isConnectedToInternet {
         showActivityIndicator(sMessage: "Loading...")
        
        let parameters: [String: Any] = [
            "deviceid":"",
            "dob": DateOfBirthTxtField.text ?? "",
            "email":  emailTxtField.text ?? "",
            "fcmToken": "",
            "mobile": mobileNoTextField.text ?? "",
            "password":passwrdTxtField.text ?? "",
            "refer_code":refcodeTextField.text ?? ""
        ]
        let head = ["Content-Type":"application/json",
                    "Accept" :"application/json"]
        
        guard let urlString = URL(string: kBASE_URL + kRegisterUser) else {
                                     
                                       return
                                   }
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: head).responseJSON{ response in
            self.hideActivityIndicator()
            let json = response.result.value as? NSDictionary
            
            if json != nil{
                let json : NSDictionary = response.result.value as? NSDictionary ?? [:]
                // print(json)
                let status = json.value(forKey: "status") as? Int ?? 0
                let message = json.value(forKey: "message") as? String ?? ""
                if status == 1 { // for Success
                  
                    // Saved Registered User Data
                    let UserDataDic = json.value(forKey: "result") as? NSDictionary ?? [:]
                                      UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: UserDataDic), forKey: "loginDataTemp")
                    // Get Login User Data
                        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerifyMobileNumberViewController") as! VerifyMobileNumberViewController
                        secondViewController.storeMobileData = self.mobileNoTextField.text
                        self.navigationController?.pushViewController(secondViewController, animated: true)
                        
                    
                    
                    
                    
                }else{
                    self.view.makeToast(message: message)
                    self.emailTxtField.text?.removeAll()
                    self.passwrdTxtField.text?.removeAll()
                    self.confirmPasswrdTxtField.text?.removeAll()
                    self.DateOfBirthTxtField.text?.removeAll()
                    self.mobileNoTextField.text?.removeAll()
                    self.checkbtn.imageView?.image = #imageLiteral(resourceName: "Rectangle 290")
                  
                    //Show SnackBar Alert
                    
                }
            }
            
            else{
                self.view.makeToast(message: "Internal Error")
                //Show SnackBar Alert
            }
        }
        

        
       
    }
        else {
            self.view.makeToast(message: "Please check you Internet Connection")
        }
    }
    
   
    
}
extension RegistrationViewController {
    //MARK: Validation
    private func validateMobileFields() -> String {
        var message = ""
        if let text = mobileNoTextField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty && Validation.isValid(mobileNo: text) {
            message = ""
        } else {
            message = "Please Enter Correct Mobile No."
            return message
        }
        return message
    }
    
}
// MARK: - TextFiled Delegate Methods.

extension RegistrationViewController {
    //MARK: Validation
    private func validateEmailFields() -> String {
        var message = ""
        if let text = emailTxtField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty && Validation.isValid(email: text) {
            message = ""
        } else {
            message = "Please Enter Correct Email"
            return message
        }
        return message
    }
    

    
    private func validatePasswordFields() -> String {
        var message = ""
        if let text = passwrdTxtField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty && Validation.isValid(password: text) {
            message = ""
        } else {
            message = "Please Enter Correct Password"
            return message
        }
        return message
    }
    
    private func validateConfirmPassword() -> String {
        var message = ""
        if passwrdTxtField.text == confirmPasswrdTxtField.text {
            return message
        } else {
            message = "Password Field Mismatch"
            return message
        }
    }
    
    private func validateDOB() -> String {
        var message = ""
        if let text = DateOfBirthTxtField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty  {
            message = ""
        } else {
            message = "Please Enter Correct Date of Birth"
            return message
        }
        return message
    }
}

// MARK: - TextFiled Delegate Methods.
extension RegistrationViewController: UITextFieldDelegate {
    
//    func setupUIForTextfield(resultString: String = "") {
//        if emailTxtField.text != "" || resultString != "" {
//            aEmailLabel.isHidden = false
//        } else {
//            aEmailLabel.isHidden = true
//        }
//        if aPasswordTextField.text != "" || resultString != "" {
//            aPasswordLabel.isHidden = false
//        } else {
//            aPasswordLabel.isHidden = true
//        }
//        if aConfirmPasswordTextField.text != "" || resultString != "" {
//            aConfirmPasswordLabel.isHidden = false
//        } else {
//            aConfirmPasswordLabel.isHidden = true
//        }
//        if aSelectDOBTextField.text != "" || resultString != "" {
//            aSelectDOBLabel.isHidden = false
//        } else {
//            aSelectDOBLabel.isHidden = true
//        }
//        if aReferralTextField.text != "" || resultString != "" {
//            aReferralLabel.isHidden = false
//        } else {
//            aReferralLabel.isHidden = true
//        }
//    }
}
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //switch textField {
//        case aEmailTextField:
//            aEmailLabel.isHidden = false
//        case aPasswordTextField:
//            aPasswordLabel.isHidden = false
//        case aConfirmPasswordTextField:
//            aConfirmPasswordLabel.isHidden = false
//        case aSelectDOBTextField:
//            aSelectDOBLabel.isHidden = false
//        case aReferralTextField:
//            aReferralLabel.isHidden = false
//        default:
//            break
//        }
    }
    
   // func textFieldDidEndEditing(_ textField: UITextField) {
        //switch textField {
//        case aEmailTextField:
//            aEmailLabel.isHidden = true
//            setupUIForTextfield()
//        case aPasswordTextField:
//            aPasswordLabel.isHidden = true
//            setupUIForTextfield()
//        case aConfirmPasswordTextField:
//            aEmailLabel.isHidden = true
//            setupUIForTextfield()
//        case aSelectDOBTextField:
//            aPasswordLabel.isHidden = true
//            setupUIForTextfield()
//        case aReferralTextField:
//            aEmailLabel.isHidden = true
//            setupUIForTextfield()
//        default:
//            break
//        }
//    }
    
 //   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //setupUIForTextfield()
//        if .isFirstResponder {
//            aEmailTextField.resignFirstResponder()
//            aPasswordTextField.becomeFirstResponder()
//        } else if aPasswordTextField.isFirstResponder {
//            aPasswordTextField.resignFirstResponder()
//            aConfirmPasswordTextField.becomeFirstResponder()
//        } else if aConfirmPasswordTextField.isFirstResponder {
//            aConfirmPasswordTextField.resignFirstResponder()
//            aSelectDOBTextField.becomeFirstResponder()
//        } else if aSelectDOBTextField.isFirstResponder {
//            aSelectDOBTextField.resignFirstResponder()
//            aReferralTextField.becomeFirstResponder()
//        } else if aReferralTextField.isFirstResponder {
//            self.view.endEditing(true)
//        }
//        return true
//    }



