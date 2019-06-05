//
//  GoldViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 27/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class GoldViewController: UIViewController, RefreshButton {

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
        setupErrorView()
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
                if (self?.goldData != nil) {
                    self?.alertForError()
                } else {
                    self?.contentView.errorView(isVisible: true)
                }
                return
            }
            self?.contentView.errorView(isVisible: false)
            self?.goldData = data
            self?.contentView.stopIndicator()
        }
    }

    private func alertForError() {
        let alert = UIAlertController(title: "Problem", message: "Nie udało się pobrać danych", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupErrorView(){
        contentView.errorViewAddRefreshBtn(withTarget: self)
    }
    
// MARK: - Error View Refresh Button
    
    func refresh() {
        fetchGoldData()
    }
}
