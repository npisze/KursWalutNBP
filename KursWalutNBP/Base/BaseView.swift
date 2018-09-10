//
//  BaseView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 10/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {}
    
    func setupConstraints() {}
    
    func setupViews() {}
}
