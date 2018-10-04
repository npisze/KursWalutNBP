//
//  ErrorView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 13/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class ErrorView: BaseView {
    
    let errorLabel = UILabel()
    let refreshBtn = UIButton()
    
    func addRefreshButton(btnVC: RefreshButton) {
        addSubview(refreshBtn)
        
        refreshBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(errorLabel.snp.bottom)
            make.height.equalTo(50)
        }
        
        refreshBtn.setTitle("Refresh", for: .normal)
        refreshBtn.setTitleColor(.orange, for: .normal)
        refreshBtn.setTitleColor(UIColor.brown, for: .highlighted)
        refreshBtn.addTarget(btnVC, action: #selector(RefreshButton.refresh), for: .touchUpInside)
    }
    
    override func addSubviews() {
        addSubview(errorLabel)
    }
    
    override func setupConstraints() {
        errorLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.init(red: 1, green: 0.87, blue: 0.68, alpha: 1)
        alpha = 1.0
        
        errorLabel.text = "There seems to be a problem."
        errorLabel.textColor = UIColor.black
        errorLabel.textAlignment = .center
    }
}
