//
//  GoldViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 27/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class GoldViewController: UIViewController {

    let service = DataService()
    
    var goldData: GoldRate? {
        didSet {
            goldRate = goldData
        }
    }
    
    var goldRate: GoldRate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoldData()
    }

    private func fetchGoldData() {

        service.fetchGoldData { (error, gold) in
            guard let data = gold else {
                return
            }
        }
    }
}
