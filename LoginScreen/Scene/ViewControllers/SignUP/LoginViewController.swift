//
//  LoginViewController.swift
//  DreamTeam
//
//  Created by Test on 07/05/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import SwiftyJSON
import UIKit
import AuthenticationServices
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
import PasswordTextField
import MBProgressHUD
import Alamofire

class LoginViewController: BaseClass {
    
    @IBOutlet weak var nothaveAccountLabel: UILabel!
    //
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var orLblSidelineview: UIView!
    
    @IBOutlet weak var orLblRightSideView: UIView!
    @IBOutlet weak var regiterNowBtn: UIButton!
    @IBOutlet weak var forgotPasswordbtn: UIButton!
    
    
    @IBOutlet weak var passwordPlaceHolderText: UILabel!
    @IBOutlet weak var userNamePlaceHolderText: UILabel!
    @IBOutlet weak var welcomeBackLbl: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupDefaultNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        storeConstantData()
         
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setup()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setup() {
        stackView.spacing = 5
        signInButton.backgroundColor = UIColor(red: 253, green: 185, blue: 40)
        signInButton.setTitleColor(.black, for: .normal)
        userNameTextField.textColor = .black
        userNameTextField.addLine(position: .LINE_POSITION_BOTTOM, color: UIColor.FlatColor.Grey.lightGrey, width: 0.5)
        passwordTextField.addLine(position: .LINE_POSITION_BOTTOM, color: UIColor.FlatColor.Grey.lightGrey, width: 0.5)
        userNamePlaceHolderText.textColor = UIColor.FlatColor.Grey.DarkGrey
        passwordPlaceHolderText.textColor = UIColor.FlatColor.Grey.DarkGrey
        signInButton.titleLabel?.textColor = UIColor.black
//        signInButton.backgroundColor = UIColor.FlatColor.Blue.GreenishBlue
        facebookButton.backgroundColor = UIColor.FlatColor.Blue.lightBlue
        facebookButton.titleLabel?.textColor = UIColor.FlatColor.white.whitecolor
        facebookButton.setInsets(forContentPadding: UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5), imageTitlePadding: 15)
        googleButton.setInsets(forContentPadding: UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5), imageTitlePadding: 15)
        googleButton.titleLabel?.textColor = UIColor.FlatColor.Grey.DarkGrey
        googleButton.layer.borderWidth = 1
        googleButton.layer.borderColor = UIColor.FlatColor.Grey.DarkGrey.cgColor
        forgotPasswordbtn.setTitleColor(UIColor.FlatColor.Grey.DarkGrey, for: .normal)
        regiterNowBtn.setTitleColor(UIColor(red: 0, green: 64, blue: 161), for: .normal)
        regiterNowBtn.setTitle(StringConstant.registerNow, for: .normal)
        nothaveAccountLabel.text = StringConstant.nothaveAccount
        nothaveAccountLabel.textColor = UIColor.FlatColor.Grey.DarkGrey
        passwordTextField.customHideSecureTextImage = #imageLiteral(resourceName: "ic_password_view")
        passwordTextField.customShowSecureTextImage = #imageLiteral(resourceName: "view")
        orLblSidelineview.backgroundColor = UIColor.FlatColor.Grey.DarkGrey
        orLblRightSideView.backgroundColor = UIColor.FlatColor.Grey.DarkGrey
        bottomline(btn: regiterNowBtn, color: UIColor.FlatColor.Blue.DarkBlue, height: 0.5)
        bottomline(btn: forgotPasswordbtn, color: UIColor.FlatColor.Blue.DarkBlue, height: 0.5)
        
    }
    
    
    func storeConstantData() {
        welcomeBackLbl.text = StringConstant.welcomeBack
        userNamePlaceHolderText.text = StringConstant.userName
        passwordPlaceHolderText.text = StringConstant.password
        forgotPasswordbtn.setTitle(StringConstant.forgotpassword, for: .normal)
    }
    // MARK: - IBAction
       @IBAction func didTapSignInButton(_ sender: Any) {
           self.view.endEditing(true)
           let emailValidationRes = validateEmailFields()
           if emailValidationRes == "" {
               
               
               loginAction()
           }
           else {
               
               self.view.makeToast(message: emailValidationRes)
           }
       }
       
       
       
       
       @IBAction func didTapFacebookButton(_ sender: Any) {
           handleFacebookAuthentication()
           //  getFBUserData()
       }
       
       @IBAction func didTapGoogleButton(_ sender: Any) {
           handleGoogleAuthentication()
       }
       
       
       @IBAction func forgotPasswordAction(_ sender: Any) {
           let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
           
           self.navigationController?.pushViewController(secondViewController, animated: true)
       }
       
    @IBAction func registerNowBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        //                                   secondViewController.storeMobileData = self.mobileNoTextField.text
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    

     // MARK: - This Method will perform LoginAction UserWill Redirect to HomeSCreen
    fileprivate func loginAction() {
        showActivityIndicator(sMessage: "Loading...")
        let headers = ["Content-Type":"application/json",
                       "Accept" :"application/json"]
        var loginParams: [String : Any]? = [:]
        loginParams?["email"] = userNameTextField.text
        loginParams?["password"] = passwordTextField.text
        loginParams?["appid"] = ""
        loginParams?["device_id"] = ""
        if Connectivity.isConnectedToInternet {
            guard let urlString = URL(string: kBASE_URL + kLoggedIn) else {
                
                return
            }
            Alamofire.request(urlString, method: .post, parameters: loginParams, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
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
                        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: UserDataDic), forKey: "loginData")
                        
                        // Get Login User Data
                        if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                            
                            let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                            
                            //                        UserDefaults.standard.set(UserDefaults.value(forKey: "user_id", forKey: kUserId)
                            let kuser = UserDic.value(forKey: kUserId)
                            UserDefaults.standard.set(kuser, forKey: kUserId)
                            UserDefaults.standard.set(true, forKey: kLoggedIn)
                            APP_DEL.openInitialViewController()
                            
                        }
                        
                    }else{
                        
                        self.view.makeToast(message: message)
                        //Show SnackBar Alert
                        
                    }
                }
                    
                else{
                    self.view.makeToast(message: "Server Error")
                }
            }
            
        }
        else {
            self.view.makeToast(message: "Check your internet Connectivity")
        }
    }
    
    
   
}

// MARK: - Login with facebook
extension LoginViewController {
    
    /// Our custom functions
    private func handleFacebookAuthentication() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if error != nil {
                self.showPopup(isSuccess: false, type: .facebook)
                return
            }
            guard let token = AccessToken.current else {
                print("Failed to get access token")
                self.showPopup(isSuccess: false, type: .facebook)
                return
            }
            self.viewModel.token = token.appID
            
            GraphRequest(graphPath: "me", parameters: ["fields" : "first_name, last_name, gender, id, name, email,picture"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil), let result = result as? [String: Any]
                    
                {
                    if let fields = result as? NSDictionary {
                        print("\(fields.description)")
                        
                       
                        let imageURL = ((fields["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String
                        let dict = ["email": fields.value(forKey: "email") ?? "",
                                    "name": fields.value(forKey: "name") ?? "",
                                    "provider":"Facebook",
                                    "image": imageURL ?? "" ,
                                    "dob":"",
                                    "appid": "",
                                    "fcmToken":self.viewModel.token ?? "",
                                    "device_id": ""]
                        self.socialLoginAction(parm: dict as NSDictionary)
                    }
                }
            })
        }
    }
    
    
    
    /// This Method will help to login Using Facebook and Google
    /// - Parameter parm: parameters is Dictionary which passes to the parameters to SocialLogin API
    fileprivate func socialLoginAction(parm: NSDictionary) {
        showActivityIndicator(sMessage: "Loading...")
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]
        
        guard let urlString = URL(string: kBASE_URL + kSocialLoginURL) else {
            
            return
        }
        Alamofire.request(urlString, method: .post, parameters: parm as? Parameters, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            self.hideActivityIndicator()
            let json = response.result.value as? NSDictionary
            
            if json != nil{
                let json : NSDictionary = response.result.value as? NSDictionary ?? [:]
                // print(json)
                let status = json.value(forKey: "status") as? Int ?? 0
                let message = json.value(forKey: "message") as? String ?? ""
                if status == 1 { // for Success
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                    // Saved Registered User Data
                    let UserDataDic = json.value(forKey: "result") as? NSDictionary ?? [:]
                    UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: UserDataDic), forKey: "loginData")
                    
                    // Get Login User Data
                    if let heroObject = UserDefaults.standard.value(forKey: "loginData") as? NSData {
                        
                        let UserDic = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as! NSDictionary
                        
                        
                        let kuser = UserDic.value(forKey: kUserId)
                       UserDefaults.standard.set(kuser, forKey: kUserId)
                        UserDefaults.standard.set(true, forKey: kLoggedIn)
                        APP_DEL.openInitialViewController()
                        
                    }
                }else{
                    self.view.makeToast(message:message)
                    MBProgressHUD.hide(for: self.view, animated: true)
                    //Show SnackBar Alert
                    
                }
            }
                
            else{
                 self.view.makeToast(message:"Server Issue")
                MBProgressHUD.hide(for: self.view, animated: true)
                //Show SnackBar Alert
            }
        }
        
    }
    
}

// MARK: - Login with google
extension LoginViewController: GIDSignInDelegate {
    
    /// Our custom functions
    private func handleGoogleAuthentication() {
        GIDSignIn.sharedInstance()?.clientID =  "299204390084-f700kalcp1u2k7cr7ekar07tjqasa4k8.apps.googleusercontent.com"
        
//        "358501050317-u3p9ejelbupecnsvib51lf0dtv65ehgl.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    /// Required functions from protocols
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            let fullName = user.profile.name
            let email = user.profile.email
            
            //  let image = user.profile.imageURL(withDimension: 100)
            let dict = ["email": email ?? "",
                        "name": fullName ?? "",
                        "provider":"Google",
                        "image":  "",
                        "dob":"",
                        "appid": "",
                        "code":"",
                        "device_id": ""] as [String : Any]
            self.socialLoginAction(parm: dict as NSDictionary)
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
}
// MARK: - Show result
extension LoginViewController: LoginResultProtocol {
    
    func showPopup(isSuccess: Bool, user: User? = nil, type: LoginType) {
        let successMessage = "Congratulation! \(user?.username ?? ""). You logged in successully with \(type.name). "
        let errorMessage = "Something went wrong. Please try again"
        let alert = UIAlertController(title: isSuccess ? "Success": "Error", message: isSuccess ? successMessage: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func success(user: User?, type: LoginType) {
        showPopup(isSuccess: true, user: viewModel.user, type: type)
    }
    
    func error(error: Error, type: LoginType) {
        showPopup(isSuccess: false, type: type)
    }
}

extension LoginViewController {
    //MARK: Validation
    private func validateEmailFields() -> String {
        var message = ""
        if let text = userNameTextField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty && Validation.isValid(email: text) {
            message = ""
        } else {
            message = "Please Enter Correct Email"
            return message
        }
        return message
    }
    
    
}
extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if userNameTextField.isFirstResponder {
            userNameTextField.resignFirstResponder()
            
        }
        return true
    }
}
