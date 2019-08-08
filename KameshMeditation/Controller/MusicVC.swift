//
//  MusicVC.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit
import AVFoundation

class MusicVC: GeneralVC {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    var collection = ""
    var audioPlayer = AVAudioPlayer()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Play Music"
        fetchRecord(collection: collection)
    }
    @objc func updateView() {
        progressBar.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
        durationLabel.text = (audioPlayer.duration - audioPlayer.currentTime).minutesSeconds()
    }
    @IBAction func RewindButtonAction(_ sender: Any) {
        audioPlayer.currentTime = audioPlayer.currentTime - TimeInterval(5)
    }
    @IBAction func PlayButtonAction(_ sender: Any) {
        if audioPlayer.isPlaying {
            timer = Timer()
            audioPlayer.pause()
            playButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            DispatchQueue.main.async {
                self.audioPlayer.play()
            }
        }
    }
    @IBAction func ForwardButtonAction(_ sender: Any) {
        audioPlayer.currentTime = audioPlayer.currentTime + TimeInterval(5)
    }
    func downloadAudio(){
        var downloadTask: URLSessionDownloadTask
        Loader.shared.show()
        downloadTask = URLSession.shared.downloadTask(with: URL(string: FirestoreVM.shared.music.audio)!, completionHandler: { (url, response, error) in
            Loader.shared.hide()
            if let error = error {
                self.show(title: "Alert!", message: error.localizedDescription)
            } else {
                self.playAudio(url: url!)
            }
        })
        downloadTask.resume()
    }
    func fetchRecord(collection: String) {
        FirestoreVM.shared.fetchRecord(collection: collection) { (success, error) in
            if success {
                self.bannerImage.sd_setImage(with: URL(string: FirestoreVM.shared.music.image), completed: nil)
                self.downloadAudio()
            } else {
                self.show(title: "Alert!", message: error!)
            }
        }
    }
    func playAudio(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            DispatchQueue.main.async {
                self.durationLabel.text = "\(self.audioPlayer.duration.minutesSeconds())"
            }
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.playback)
            } catch {
                show(title: "Alert!", message: error.localizedDescription)
            }
        } catch {
            show(title: "Alert!", message: error.localizedDescription)
        }
    }
}
