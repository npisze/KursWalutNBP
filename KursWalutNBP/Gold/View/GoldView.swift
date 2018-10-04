//
//  GoldView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 02/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class GoldView: BaseView {

    private let spinnerView = SpinnerView()
    private let goldLabel = UILabel()
    private let errorView = ErrorView()
    
    override func addSubviews() {
        addSubview(goldLabel)
        addSubview(spinnerView)
        addSubview(errorView)
    }
    
    override func setupViews() {
        backgroundColor = UIColor.init(red: 1, green: 0.87, blue: 0.68, alpha: 1)//UIColor.white
        
        goldLabel.backgroundColor = UIColor.clear
        goldLabel.numberOfLines = 0
        goldLabel.textAlignment = NSTextAlignment.center
        
        errorView.isHidden = true
    }
    
    override func setupConstraints() {
        goldLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        spinnerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func errorViewAddRefreshBtn(withTarget target: RefreshButton){
        errorView.addRefreshButton(btnVC: target)
    }
    
    func updateGoldLabel(value: Double?, data: String?) {
        guard let value = value, let data = data else { return }
        goldLabel.text = "Aktualna cena 1 g złota, \nopublikowana dnia: \n\(data.asPlDate())\n wynosi: \(value.inCash)"
    }
    
    func startIndicator(){
        DispatchQueue.main.async { [weak self] in
            self?.spinnerView.start()
        }
    }
    
    func stopIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.spinnerView.stop()
            self?.spinnerView.removeFromSuperview()
        }
    }
    
    func errorView(isVisible: Bool) {
        errorView.isHidden = !isVisible
        goldLabel.isHidden = isVisible
    }
}
