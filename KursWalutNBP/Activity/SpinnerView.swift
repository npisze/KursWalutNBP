//
//  SpinnerView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 18/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class SpinnerView: BaseView {
    
    var isAnimating: Bool {
        get {
            return activityIndicator.isAnimating
        }
    }
    
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
        backgroundColor = UIColor.peach
        activityIndicator.style = .whiteLarge
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
