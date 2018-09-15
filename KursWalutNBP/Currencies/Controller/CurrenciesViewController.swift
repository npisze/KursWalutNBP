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

    lazy var contentView: CurrencyView = {
        return CurrencyView(frame: .zero)
    }()
    
    override func loadView() {
        view = contentView
    }

    private var actualCurrencies: Currencies? {
        didSet {
            navigationItem.changeTitle(to: "Data notowania: \(actualCurrencies?.tradingDate.asPlDate() ?? "nieznana")\nData publikacji: \(actualCurrencies?.effectiveDate.asPlDate() ?? "nieznana")")
            contentView.reloadTable()
        }
    }
    private let service = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        fetchCurrenciesData()
    }
    
    private func setUpTable() {
        contentView.setUPTable(delegate: self, dataSource: self)
    }
    
    private func fetchCurrenciesData() {
        // TODO: - start Activity indicator
        
        service.fetchCurrencies { [weak self] (error, currencies) in
            guard let data = currencies else { return } // TODO: - "Something went wrong" View if error
            self?.actualCurrencies = data
        }
        
        // TODO: - stop Activity indicator
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}

// MARK: - Table View

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numOfSections: Int = actualCurrencies?.rates.count ?? 0
        if numOfSections > 0 {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView = nil
        } else {
            let noDataView = ErrorView()
            tableView.backgroundView = noDataView
            tableView.separatorStyle = .none
        }
        return numOfSections
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
