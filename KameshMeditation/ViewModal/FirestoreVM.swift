//
//  FirestoreVM.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import Foundation
import Firebase

// View Modal for Firestore data fetch
public class FirestoreVM {
    public static let shared = FirestoreVM()
    private init() {}
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    var music: Music!
    
    func fetchRecord(collection: String, completion: @escaping responseCallBack) {
        Loader.shared.show()
        db.collection(collection).document("focus").collection("session").getDocuments { (snapshot, err) in
            Loader.shared.hide()
            if let err = err {
                completion(false, err.localizedDescription)
            } else {
                for document in snapshot!.documents {
                    let link = document.data()["link"] as! String
                    let imageURL = document.data()["imageLink"] as! String
                    
                    self.music = Music(image: imageURL, audio: link)
                    completion(true, "")
                }
            }
        }
    }
}
