//
//  CurrencyView.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 12/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class CurrencyView: BaseView {
    
    private let spinnerView = SpinnerView()
    private var currenciesTable = UITableView()
    private var labelsView = InfoLabelsView()
    
    func setUPTable(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        currenciesTable.delegate = delegate
        currenciesTable.dataSource = dataSource
        currenciesTable.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyCell")
        currenciesTable.allowsSelection = false
    }
    
    func reloadTable() {
        currenciesTable.reloadData()
    }

    override func addSubviews() {
        addSubview(labelsView)
        addSubview(currenciesTable)
        addSubview(spinnerView)
    }
    
    override func setupConstraints() {
        labelsView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
        }
        currenciesTable.snp.makeConstraints { make in
            make.top.equalTo(labelsView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
        spinnerView.snp.makeConstraints { make in
            make.edges.equalTo(currenciesTable)
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.orange
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
}
