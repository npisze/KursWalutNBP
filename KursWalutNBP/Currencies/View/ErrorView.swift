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
        errorLabel.text = "There seems to be a problem."
        errorLabel.textColor = UIColor.black
        errorLabel.textAlignment = .center
    }
}
