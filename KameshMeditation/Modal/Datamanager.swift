//
//  Datamanager.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import Foundation

// Datamanager class is used to save datas in Userdefaults in ease
class Datamanager {
    static var isLoggedIn: Bool! {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
        } get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
    }
 }
