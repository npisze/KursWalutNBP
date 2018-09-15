//
//  GoldViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 27/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class GoldViewController: UIViewController {

    lazy var contentView: GoldView = {
        return GoldView(frame: .zero)
    }()
    
    override func loadView() {
        view = contentView
    }
    
    let service = DataService()
    
    var goldData: GoldRate? {
        didSet {
            goldRate = goldData
            contentView.updateGoldLabel(value: goldData?.cena, data: goldData?.data)
        }
    }
    
    var goldRate: GoldRate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoldData()
    }

    private func fetchGoldData() {
        service.fetchGoldData { [weak self] (error, gold) in
            guard let data = gold else { return }
            self?.goldData = data
        }
    }
}
