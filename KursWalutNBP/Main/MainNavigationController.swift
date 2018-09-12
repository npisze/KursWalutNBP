//
//  MainNavigationController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 12/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configure()
    }
    
    private func configure() {
        self.navigationBar.barTintColor = UIColor.orange
        self.navigationBar.isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

extension UINavigationItem {
    func changeTitle(to title: String) {
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.text = title
        self.titleView = label
    }
}
