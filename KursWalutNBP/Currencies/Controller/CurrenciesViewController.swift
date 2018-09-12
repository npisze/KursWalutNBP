//
//  CurrenciesViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 08/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class CurrenciesViewController: UIViewController {

    private var currenciesTable = UITableView()
    private var labelsView = InfoLabelsView()
    
    private var actualCurrencies: Currencies? {
        didSet {
            self.navigationItem.changeTitle(to: "Data notowania: \(actualCurrencies?.tradingDate ?? "nieznana")\nData publikacji: \(actualCurrencies?.effectiveDate ?? "nieznana")")
           // labelsView.configureLabels(tradingDate: actualCurrencies?.tradingDate, effectiveDate: actualCurrencies?.effectiveDate)
            currenciesTable.reloadData()
        }
    }
    private let service = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        fetchCurrenciesData()
    }

    private func setUpViews() {
        view.addSubview(labelsView)
        labelsView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
        }

        currenciesTable.delegate = self
        currenciesTable.dataSource = self
        currenciesTable.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyCell")
        view.addSubview(currenciesTable)

        currenciesTable.snp.makeConstraints { make in
            make.top.equalTo(labelsView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    private func fetchCurrenciesData() {
        // TODO: - start Activity indicator
        
        service.fetchCurrencies { [weak self] (error, currencies) in
            guard let data = currencies else { return }
            self?.actualCurrencies = data
        }
        
        // TODO: - stop Activity indicator
    }
}

// MARK: - Table View

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return actualCurrencies?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyTableViewCell
        guard let actualCurrencies = actualCurrencies, let rates = actualCurrencies.rates[safe: indexPath.row] else {
            return cell
        }
        
        cell.currencyCode = rates.code
        cell.askValue = rates.ask
        cell.bidValue = rates.bid
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CurrencyTableViewCell.cellHeight()
    }
}
