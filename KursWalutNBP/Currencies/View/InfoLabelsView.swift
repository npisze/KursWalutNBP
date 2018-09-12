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

    private let tradingDateLabel = UILabel()
    private let effectiveDateLabel = UILabel()
    private let currencyCodeLabel = UILabel()
    private let bidLabel = UILabel()
    private let askLabel = UILabel()
    private let labelsStack = UIStackView()
    
    func configureLabels(tradingDate: String?, effectiveDate: String?){
        guard let tDate = tradingDate, let eDate = effectiveDate else {
            tradingDateLabel.text = "Data notowania: nieznana"
            effectiveDateLabel.text = "Data publikacji: nieznana"
            return
        }
        tradingDateLabel.text = "Data notowania: \(tDate)"
        effectiveDateLabel.text = "Data publikacji: \(eDate)"
    }
    
    override func addSubviews() {
//        addSubview(tradingDateLabel)
//        addSubview(effectiveDateLabel)
        addSubview(labelsStack)
    }
    
    override func setupViews() {
        labelsStack.axis = .horizontal
        labelsStack.distribution = .fillEqually
        
        [currencyCodeLabel, bidLabel, askLabel].forEach {
            labelsStack.addArrangedSubview($0)
            $0.font = UIFont.boldSystemFont(ofSize: $0.font.pointSize)  // TODO: - not here
        }
        
//        setupLabel(tradingDateLabel, text: nil)
//        setupLabel(effectiveDateLabel, text: nil)
        setupLabel(currencyCodeLabel, text: "Waluta")
        setupLabel(bidLabel, text: "Kupno")
        setupLabel(askLabel, text: "Sprzedaż")
    }
    
    override func setupConstraints() {
//        tradingDateLabel.snp.makeConstraints { make in
//            make.left.right.equalToSuperview()
//            make.top.equalTo(safeAreaLayoutGuide.snp.top)   //  !!!! iOS 11.0+
//            make.height.equalTo(20)
//        }
//
//        effectiveDateLabel.snp.makeConstraints { make in
//            make.top.equalTo(tradingDateLabel.snp.bottom)
//            make.left.right.equalTo(tradingDateLabel)
//            make.height.equalTo(20)
//        }
        
        labelsStack.snp.makeConstraints { make in
//            make.top.equalTo(effectiveDateLabel.snp.bottom)
//            make.left.right.equalTo(effectiveDateLabel)
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
