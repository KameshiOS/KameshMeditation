//
//  LaunchVC.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit
import Lottie

// Launch Viewcontroller with Lottie Animation, if needed please increase the timeinterval

class LaunchVC: GeneralVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Loader.shared.show()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            Loader.shared.hide()
            if Datamanager.isLoggedIn {
                self.navigateToMain()
            } else {
                self.navigateToLogin()
            }
        }
    }
}

