//
//  Loader.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//


import UIKit
import Lottie

// Custom Lottie Loader Singleton Class to access whenever necessary
public class Loader {
    public static let shared = Loader()
    
    var blurImg = UIImageView()
    var loadView = AnimationView()
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.white
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 1

        loadView = AnimationView(name: "loading")
        loadView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        loadView.center = blurImg.center
        loadView.animationSpeed = 0.8
        loadView.loopMode = .loop
    }
    func show(){
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.loadView)
            self.loadView.play()
        })
    }
    func hide(){
        DispatchQueue.main.async( execute: {
            self.loadView.stop()
            self.blurImg.removeFromSuperview()
            self.loadView.removeFromSuperview()
        })
    }
}
