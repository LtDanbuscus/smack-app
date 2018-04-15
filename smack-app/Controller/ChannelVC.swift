//
//  ChannelVC.swift
//  smack-app
//
//  Created by Dan Sims on 4/15/18.
//  Copyright © 2018 Dan Sims. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
