//
//  AppDelegate.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 27/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabBarViewController()
        return true
    }

}

