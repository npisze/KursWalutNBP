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

    private let goldLabel = UILabel()
    
    override func addSubviews() {
        addSubview(goldLabel)
    }
    
    override func setupViews() {
        backgroundColor = UIColor.white
        goldLabel.backgroundColor = UIColor.clear
        goldLabel.numberOfLines = 0
        goldLabel.textAlignment = NSTextAlignment.center
        goldLabel.text = "There seems to be a problem."
    }
    
    override func setupConstraints() {
        goldLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateGoldLabel(value: Double?, data: String?) {
        guard let value = value, let data = data else { return }
        goldLabel.text = "Aktualna cena 1 g złota, \nopublikowana dnia: \n\(data.asPlDate())\n wynosi: \(value.inCash)"
    }
}
