//
//  GeneralVC.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

// Common Viewcontroller to do Global fuctionalities
class GeneralVC: UIViewController, Alert {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    func navigateToLogin() {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
        self.present(destVC, animated: true, completion: nil)
    }
    func navigateToMain() {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "MainNav") as! UINavigationController
        self.present(destVC, animated: true, completion: nil)
    }
}
extension TimeInterval{
    func minutesSeconds() -> String {
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
}
