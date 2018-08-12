//
//  NativeAdViewController.swift
//  sandbox
//
//  Created by JigSaw on 11.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit
import Appodeal

class NativeAdViewController: UITableViewController, APDNativeAdLoaderDelegate{
    
    var apdLoader: APDNativeAdLoader!
    var nativeAd = APDNativeAd()
    var nativeAds = [APDNativeAd]()
    var countries = [String]()
    let countriesLoader = CountriesLoader()
    var numberOfRows = 0
    var nativeAdIsHidden = false


    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountries()
        numberOfRows = countries.count + 1
        
        let statusBarheight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarheight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        apdLoader = APDNativeAdLoader.init()
        apdLoader?.delegate = self
        apdLoader.loadAd(with: .auto, capacity: 5)
        
        var cellNib = UINib(nibName: "NativeAdTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        cellNib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CountryCell")
    }
    
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue!, ofCount count: Int) {
        nativeAds = adQueue.getNativeAds(ofCount: 5)
    }
    
    func nativeAdLoader(_ loader: APDNativeAdLoader!, didLoad nativeAds: [APDNativeAd]!) {
        print("Native Ad was load successfully")
        print("\(nativeAds)")
    }
    
    func nativeAdLoader(_ loader: APDNativeAdLoader!, didFailToLoadWithError error: Error!) {
        print("Native Ad was failed because of error: \(error)")
    }
    
}

//MARK: - TableViewDataSource
extension NativeAdViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if !nativeAdIsHidden{
            if indexPath.row == 2 {
                let tableCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NativeAdTableViewCell
                self.nativeAd.attach(to: tableCell, viewController: self)
                tableCell.titleTextView.text = nativeAd.title
                tableCell.adChoiceView = nativeAd.adChoicesView
                tableCell.descriptionLabel.text = nativeAd.descriptionText
                tableCell.actionButton.titleLabel?.text = nativeAd.callToActionText
                cell = tableCell
            }else if indexPath.row < 2{
                let tableCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
                tableCell.countryLabel?.text = countries[indexPath.row]
                cell = tableCell
            }else if indexPath.row > 2{
                let tableCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
                tableCell.countryLabel?.text = countries[indexPath.row - 1]
                cell = tableCell
            }
        }else{
            let tableCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
            tableCell.countryLabel?.text = countries[indexPath.row]
            cell = tableCell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        if !nativeAdIsHidden {
            if indexPath.row == 2{
                height = 200
            }else {
                height = 40
            }
        }else{
            height = 40
        }
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            showThreeAlerts()
        }
    }
    
}

//Mark: - Load Countries
extension NativeAdViewController {
        func loadCountries() {
            do {
                countries = try countriesLoader.loadCountries()
            }catch{
                switch error {
                case LoaderError.arrayFailed:
                    print("Could not load the array")
                case LoaderError.pathFailed:
                    print("Could not find valid file at path")
                default:
                    print("Unknown error")
            }
        }
    }
}

//MARK: - Show Alert
extension NativeAdViewController {
    func showThreeAlerts() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let actionToDownload = UIAlertAction(title: "Download Native Ad", style: .default, handler: nil)
        let actionToShow = UIAlertAction(title: "Show Native Ad", style: .default, handler: {_ in return self.showNativeAd()})
        let actionToHide = UIAlertAction(title: "Hide Native Ad", style: .default, handler: {_ in return self.hideNativeAd()})
        alert.addAction(actionToDownload)
        alert.addAction(actionToHide)
        alert.addAction(actionToShow)
        present(alert, animated: true, completion: nil)
    }
    
    func hideNativeAd() {
        nativeAdIsHidden = true
        numberOfRows = countries.count
        tableView.reloadData()
    }
    
    func showNativeAd(){
        nativeAdIsHidden = false
        numberOfRows = countries.count + 1
        tableView.reloadData()
    }
    
}
