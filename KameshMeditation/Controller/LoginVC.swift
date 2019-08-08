//
//  LoginVC.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginVC: GeneralVC {

    @IBOutlet weak var anonymousView: ViewDesign!
    @IBOutlet weak var googleView: ViewDesign!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(googleSignInAction))
        googleView.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(signinAnonymously))
        anonymousView.addGestureRecognizer(tap2)
    }
    @objc func googleSignInAction() {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    @objc func signinAnonymously() {
        LoginVM.shared.signInAnonymously { (success, error) in
            if success {
                self.navigateToMain()
            } else {
                self.show(title: "Alert!", message: error!)
            }
        }
    }
    func signIn(with credential: AuthCredential) {
        // Auth Credentials are stored in the Firebase Authentication Tab
        LoginVM.shared.signInWithCredential(credendial: credential) { (success, error) in
            if success {
                self.navigateToMain()
            } else {
                self.show(title: "Alert!", message: error!)
            }
        }
    }
}
extension LoginVC: GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            guard let authentication = user.authentication else { return }
            
            // This Auth Credentials are stored in my Firebase Sample project account
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            self.signIn(with: credential)
        } else {
            self.show(title: "Alert!", message: error.localizedDescription)
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        self.show(title: "Alert!", message: error.localizedDescription)
    }
}
