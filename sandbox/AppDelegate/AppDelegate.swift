//
//  AppDelegate.swift
//  sandbox
//
//  Created by JigSaw on 11.08.2018.
//  Copyright © 2018 poulkravtsoff. All rights reserved.
//

import UIKit
import Appodeal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let adTypes: AppodealAdType = [.banner, .rewardedVideo, .nativeAd]
    
    //AppKey for com.poulkravtsoff.sandbox
//    let appKey = "058b55ddb57d33498273cb7f9929f166c0b2afc1676ffb83"
    //AppKey for com.appodeal.bundle
//    let appKey = "750c9244ff90b78a617d3e0effbf7e64ab036c4317be8f38"
    //Appkey for com.appodeal.test
//    let appKey = "fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f"
    //AppKey com.appodeal.sandbox
    let appKey = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Appodeal.setAutocache(true, types: adTypes)
        Appodeal.initialize(withApiKey: appKey, types:  adTypes)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

