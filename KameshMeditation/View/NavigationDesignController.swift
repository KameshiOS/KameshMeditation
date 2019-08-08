//
//  NavigationDesignController.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

extension UINavigationController {
    // This function is used to customise navigation bar
    func updateViews(setBackgroundWhite: Bool) {
        customiseBackButton()
        if setBackgroundWhite {
            navigationBar.shadowImage = UIImage()
            navigationBar.tintColor = UIColor.darkGray
            navigationBar.barTintColor = UIColor.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.white
            
            navigationBar.layer.masksToBounds = false
            navigationBar.layer.shadowColor = UIColor.darkGray.cgColor
            navigationBar.layer.shadowOpacity = 0.6
            navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
            navigationBar.layer.shadowRadius = 4
        } else {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.black
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        }
    }
    func customiseBackButton() {
        let backImage = UIImage(named: "back")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }
}

