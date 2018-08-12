//
//  SecondViewController.swift
//  sandbox
//
//  Created by JigSaw on 11.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit
import Appodeal

class BannerViewController: UIViewController, AppodealBannerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        Appodeal.setBannerDelegate(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(Appodeal.banner())
        Appodeal.banner().frame = CGRect.init(x: 0, y: 0, width: view.bounds.size.width, height: 50)
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton){
        Appodeal.showAd(.bannerTop, rootViewController: self)
    }
    
    @IBAction func hideButtonPressed(_ sender: UIButton) {
        Appodeal.hideBanner()
    }
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
        Appodeal.load()
    }
    
    func bannerDidShow() {
        alertThreeCommands()
    }
    
    func alertThreeCommands() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let actionToDownload = UIAlertAction(title: "Download Content", style: .default, handler: nil)
        let actionToShow = UIAlertAction(title: "Show Banner", style: .default, handler: nil)
        let actionToHide = UIAlertAction(title: "Hide Banner", style: .default, handler: {_ in return Appodeal.hideBanner()})
        alert.addAction(actionToHide)
        alert.addAction(actionToDownload)
        alert.addAction(actionToShow)
        present(alert, animated: true, completion: nil)
    }

}

