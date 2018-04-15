//
//  CreateAccountVC.swift
//  smack-app
//
//  Created by Dan Sims on 4/15/18.
//  Copyright © 2018 Dan Sims. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
