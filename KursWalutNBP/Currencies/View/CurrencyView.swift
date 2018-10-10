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
    
    var indicatorIsAnimating: Bool {
        get {
            return spinnerView.isAnimating
        }
    }
    
    private let spinnerView = SpinnerView()
    private var currenciesTable = UITableView()
    private var labelsView = InfoLabelsView()
    private let errorView = ErrorView()
    
    override func addSubviews() {
        addSubview(labelsView)
        addSubview(currenciesTable)
        addSubview(spinnerView)
        addSubview(errorView)
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

        errorView.snp.makeConstraints { make in
            make.top.equalTo(labelsView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.orange
        errorView.isHidden = true
    }
    
    func errorViewAddRefreshBtn(withTarget target: RefreshButton){
        errorView.addRefreshButton(btnVC: target)
    }
    
    func setUPTable(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        currenciesTable.delegate = delegate
        currenciesTable.dataSource = dataSource
        currenciesTable.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyCell")
        currenciesTable.allowsSelection = false
        currenciesTable.backgroundColor = UIColor.peach
    }
    
    func addRefresh(_ refreshControl: UIRefreshControl) {
        currenciesTable.addSubview(refreshControl)
    }
    
    func reloadTable() {
        currenciesTable.reloadData()
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
    
    func errorView(isVisible: Bool) {
        errorView.isHidden = !isVisible
        currenciesTable.isHidden = isVisible
    }
}
