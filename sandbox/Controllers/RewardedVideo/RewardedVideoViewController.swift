//
//  FirstViewController.swift
//  sandbox
//
//  Created by JigSaw on 11.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit
import Appodeal

class RewardedVideoViewController: UIViewController, AppodealRewardedVideoDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Appodeal.setRewardedVideoDelegate(self)
        
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        showVideo()
    }
    
    func showStartAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let actionToShow = UIAlertAction(title: "Show Rewarded Video", style: .default, handler: {_ in return Appodeal.showAd(.bannerTop, rootViewController: self)})
        alert.addAction(actionToShow)
        present(alert, animated: true, completion: nil)
    }
    
    func rewardedVideoDidFinish(_ rewardAmount: UInt, name rewardName: String!) {
        showThreeAlerts()
    }
    
    func showThreeAlerts() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let actionToDownload = UIAlertAction(title: "Download Content", style: .default, handler: nil)
        let actionToShow = UIAlertAction(title: "Show Another Video", style: .default, handler: {_ in return self.showVideo()})
        alert.addAction(actionToDownload)
        alert.addAction(actionToShow)
        present(alert, animated: true, completion: nil)
    }
    
    func showVideo(){
        Appodeal.showAd(.rewardedVideo, rootViewController: self)
    }
    
    func rewardedVideoDidFailToLoadAd() {
        print("*** The rewarded video cannot be loaded)")
    }
}

