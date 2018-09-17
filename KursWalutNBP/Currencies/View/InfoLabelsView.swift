//
//  InfoLabelsView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 09/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class InfoLabelsView: BaseView {

    private let currencyCodeLabel = UILabel()
    private let bidLabel = UILabel()
    private let askLabel = UILabel()
    private let labelsStack = UIStackView()
    
    override func addSubviews() {
        addSubview(labelsStack)
    }
    
    override func setupViews() {
        labelsStack.axis = .horizontal
        labelsStack.distribution = .fillEqually
        
        [currencyCodeLabel, bidLabel, askLabel].forEach {
            labelsStack.addArrangedSubview($0)
            $0.bold()
        }
        
        setupLabel(currencyCodeLabel, text: "Waluta")
        setupLabel(bidLabel, text: "Kupno")
        setupLabel(askLabel, text: "Sprzedaż")
    }
    
    override func setupConstraints() {
        labelsStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)   //  !!!! iOS 11.0+
            make.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setupLabel(_ label: UILabel, text: String?) {
        label.textAlignment = .center
        label.backgroundColor = UIColor.orange
        label.text = text
    }
}
