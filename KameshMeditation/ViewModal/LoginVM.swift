//
//  LoginVM.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import Foundation
import Firebase

// View Modal for Login 
public class LoginVM {
    public static let shared = LoginVM()
    private init() {}
    
    func signInAnonymously(completion: @escaping responseCallBack) {
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                Datamanager.isLoggedIn = false
                completion(false, error.localizedDescription)
            }
            Datamanager.isLoggedIn = true
            completion(true, "User Signed In Anonymously")
        }
    }
    func signInWithCredential(credendial: AuthCredential, completion: @escaping responseCallBack) {
        Auth.auth().signIn(with: credendial) { (authResult, error) in
            if let error = error {
                Datamanager.isLoggedIn = false
                completion(false, error.localizedDescription)
            }
            Datamanager.isLoggedIn = true
            completion(true, "User Signed in with Credentials")
        }
    }
    
}
