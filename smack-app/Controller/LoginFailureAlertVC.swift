//
//  LoginFailureAlertVC.swift
//  smack-app
//
//  Created by Dan Sims on 4/18/18.
//  Copyright © 2018 Dan Sims. All rights reserved.
//

import Foundation

class LoginFailureAlertVC: UIViewController {
    
    var alertController: UIAlertController?
    var alertTimer: Timer?
    var remainingTime = 0
    var baseMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showAlertMsg(title: AuthService.instance.message, message: "This will disappear in ", time: 5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlertMsg(title: String, message: String, time: Int) {
        guard (self.alertController == nil) else { if DEBUG_FLAG { print("Alert already displayed") }; return }
        
        self.baseMessage = message
        self.remainingTime = time
        
        self.alertController = UIAlertController(title: title, message: self.alertMessage(), preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel) { (action) in
            if DEBUG_FLAG { print("Alert was cancelled") }
            self.alertController = nil;
            self.alertTimer?.invalidate()
            self.alertTimer = nil
            self.dismiss(animated: true, completion: nil)
        }
        
        self.alertController!.addAction(cancelAction)
        
        self.alertTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LoginFailureAlertVC.countDown), userInfo: nil, repeats: true)
        
        self.present(self.alertController!, animated: true, completion: nil)
    }
    
    @objc func countDown() {
        
        self.remainingTime -= 1
        if (self.remainingTime < 0) {
            self.alertTimer?.invalidate()
            self.alertTimer = nil
            self.alertController!.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.alertController!.message = self.alertMessage()
        }
        
    }
    
    func alertMessage() -> String {
        var message = ""
        if let baseMessage = self.baseMessage {
            message=baseMessage + " "
        }
        return("\(message)\(self.remainingTime)")
    }
}
