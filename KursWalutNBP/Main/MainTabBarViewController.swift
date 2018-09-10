//
//  MainTabBarViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 27/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.black
        tabBar.barTintColor = UIColor.orange
        tabBar.unselectedItemTintColor = UIColor.darkGray
        
        let currenciesVC = CurrenciesViewController()
        currenciesVC.title = "Kurs walut NBP"
        currenciesVC.tabBarItem = UITabBarItem(title: "Waluty", image: UIImage(named: "currencies"), tag: 0)
        let navigationCurrencies = UINavigationController(rootViewController: currenciesVC)
        navigationCurrencies.navigationBar.barTintColor = UIColor.orange
        navigationCurrencies.navigationBar.isTranslucent = false
        
        let goldVC = GoldViewController()
        goldVC.title = "Cena złota"
        goldVC.tabBarItem = UITabBarItem(title: "Złoto", image: UIImage(named: "gold"), tag: 1)
        let navigationGold = UINavigationController(rootViewController: goldVC)
        navigationGold.navigationBar.barTintColor = UIColor.orange
        navigationGold.navigationBar.isTranslucent = false
        
        viewControllers = [navigationCurrencies, navigationGold]
    }


}
