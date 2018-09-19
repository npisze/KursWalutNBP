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
        let navigationCurrencies = MainNavigationController(rootViewController: currenciesVC)

        let goldVC = GoldViewController()
        goldVC.title = "Cena złota"
        goldVC.tabBarItem = UITabBarItem(title: "Złoto", image: UIImage(named: "gold"), tag: 1)
        let navigationGold = MainNavigationController(rootViewController: goldVC)
        
        let walletVC = WalletViewController()
        walletVC.title = "Portfel"
        walletVC.tabBarItem = UITabBarItem(title: "Portfel", image: UIImage(named: "wallet"), tag: 2)
        let navigationWallet = MainNavigationController(rootViewController: walletVC)
        
        viewControllers = [navigationCurrencies, navigationGold, navigationWallet]
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let selectedVC = tabBarController.selectedViewController, let fromView: UIView = selectedVC.view else { return false } // tabBarController.selectedViewController!.view <--- Kiedy to może wybuchnąć?
        let toView: UIView = viewController.view
        if fromView == toView {
            return false
        }

        let fromIndex = tabBarController.selectedIndex
        let toIndex = viewControllers?.index(of: viewController)
        
        if fromIndex > toIndex! { // <--- kiedy to wybuchnie?
            UIView.transition(from: fromView, to: toView, duration: 0.4, options: UIViewAnimationOptions.transitionFlipFromRight) { (finished:Bool) in
            }
        } else {
            UIView.transition(from: fromView, to: toView, duration: 0.4, options: UIViewAnimationOptions.transitionFlipFromLeft) { (finished:Bool) in
            }
        }
        return true
    }
    
}
