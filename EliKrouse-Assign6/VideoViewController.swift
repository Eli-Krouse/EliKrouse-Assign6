//
//  VideoViewController.swift
//  EliKrouse-Assign6
//
//  Created by Krouse, William E. on 4/29/26.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tabBarController?.tabBar.tintColor = UIColor(red: 0.8745, green: 0.1922, blue: 0.1804, alpha: 1.0)
        tabBarController?.tabBar.unselectedItemTintColor = .gray
    }

    @IBAction func bmiVideoTapped(_ sender: UIButton) {
            if let url = Bundle.main.url(forResource: "BMI", withExtension: "mp4") {
                playVideo(url: url)
            } else {
                print("BMI.mp4 not found")
            }
        }

    @IBAction func mealPlanTapped(_ sender: UIButton)
    {
        if let url = Bundle.main.url(forResource: "dietAndMealPrep", withExtension: "mp4") {
            playVideo(url: url)
        } else {
            print("dietAndMealPrep.mp4 not found")
        }
    }

    @IBAction func stretchingTapped(_ sender: UIButton) {
        if let url = Bundle.main.url(forResource: "stretching", withExtension: "mp4") {
            playVideo(url: url)
        } else {
            print("stretching.mp4 not found")
        }
    }
    
    func playVideo(url: URL)
    {
        let player = AVPlayer(url: url)
        let playerVC = AVPlayerViewController()
        playerVC.player = player

        present(playerVC, animated: true) {
            player.play()
        }
    }
}

