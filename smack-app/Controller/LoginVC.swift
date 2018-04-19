//
//  LoginVC.swift
//  smack-app
//
//  Created by Dan Sims on 4/15/18.
//  Copyright © 2018 Dan Sims. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameTxt.text , usernameTxt.text != "" else { self.loginFailure(); return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { self.loginFailure(); return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
                
            // LOGIN FAILURE
            else {
                self.loginFailure()
//                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func loginFailure() {
        if DEBUG_FLAG { print("login failure") }
        self.spinner.isHidden = true
        self.spinner.stopAnimating()
        
        let loginFailure = AlertVC(title: AuthService.instance.message, message: "This will disappear in ", time: 5)
        loginFailure.modalPresentationStyle = .custom
        loginFailure.modalTransitionStyle = .crossDissolve
        self.present(loginFailure, animated: true, completion: nil)
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
    }
}
