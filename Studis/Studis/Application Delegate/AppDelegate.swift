//
//  AppDelegate.swift
//  Studis
//
//  Created by Victor S Melo on 01/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        PersistenceManager.shared.storeData()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        PersistenceManager.shared.storeData()
    }
    
}
