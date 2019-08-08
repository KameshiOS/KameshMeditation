//
//  MainVC.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class MainVC: GeneralVC {

    @IBOutlet weak var mainTable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainTable.delegate = self
        mainTable.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.updateViews(setBackgroundWhite: true)
        title = "Home"
    }
    @IBAction func LogoutButtonAction(_ sender: Any) {
        let alertVC = UIAlertController(title: "Logout", message: "Are you sure", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            Datamanager.isLoggedIn = false
            self.navigateToLogin()
        }))
        alertVC.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
// MARK:- UICollectionView Delegate & Datasource methods
extension MainVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.updateView(category: categories[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 24
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "MusicVC") as! MusicVC
        destVC.collection = categories[indexPath.row].title.lowercased().replacingOccurrences(of: " ", with: "_")
        navigationController?.pushViewController(destVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
