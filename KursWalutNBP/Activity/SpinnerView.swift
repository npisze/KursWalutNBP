//
//  SpinnerView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 18/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class SpinnerView: BaseView {
    
    private let activityIndicator = UIActivityIndicatorView()
    
    override func addSubviews() {
        addSubview(activityIndicator)
    }
    
    override func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.init(red: 1, green: 0.87, blue: 0.68, alpha: 0.5)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = .orange
        activityIndicator.hidesWhenStopped = true
    }
    
    func start(){
            activityIndicator.startAnimating()
    }
    
    func stop() {
            activityIndicator.stopAnimating()
    }
}
