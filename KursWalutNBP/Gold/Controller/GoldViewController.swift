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
        setUpNavBar()
        fetchGoldData()
    }
    
    private func setUpNavBar() {
        let refreshBtn = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action:#selector(refreshGoldData))
        refreshBtn.tintColor = .black
        navigationItem.setRightBarButton(refreshBtn, animated: true)
    }
    
    @objc func refreshGoldData() {
        fetchGoldData()
    }

    private func fetchGoldData() {
        contentView.startIndicator()
        service.fetchGoldData { [weak self] (error, gold) in
            guard let data = gold else {
                self?.contentView.stopIndicator()
                self?.contentView.errorView(isVisible: true)
                return
            }
            self?.contentView.errorView(isVisible: false)
            self?.goldData = data
            self?.contentView.stopIndicator()
        }
    }
}
