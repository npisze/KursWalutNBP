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

    override func addSubviews() {
        addSubview(errorLabel)
    }
    
    override func setupConstraints() {
        errorLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
