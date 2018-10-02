//
//  CurrenciesViewController.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 08/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit
import SnapKit

class CurrenciesViewController: UIViewController, RefreshButton {

    lazy var refreshControl: UIRefreshControl = {
        return UIRefreshControl()
    }()
    
    lazy var contentView: CurrencyView = {
        return CurrencyView(frame: .zero)
    }()

    private var actualCurrencies: Currencies? {
        didSet {
            guard let tradingDate = actualCurrencies?.tradingDate, let effectiveDate = actualCurrencies?.effectiveDate else { return }
            navigationItem.changeTitle(to: "Data notowania: \(tradingDate.asPlDate())\nData publikacji: \(effectiveDate.asPlDate())")
            contentView.reloadTable()
        }
    }
    
    private let service = DataService()
    
    override func loadView() {
        view = contentView
        setupErrorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setUpTable()
        fetchCurrenciesData()
    }
    
    private func setupErrorView(){
        contentView.errorViewAddRefreshBtn(withTarget: self)
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refrechData(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.orange
        
    }

    @objc func refrechData(_ refreshControl: UIRefreshControl) {
        service.fetchCurrencies { [weak self] (error, currencies) in
            guard let data = currencies else {
                refreshControl.endRefreshing()
                self?.contentView.errorView(isVisible: true)
                return
            }
            self?.contentView.errorView(isVisible: false)
            self?.actualCurrencies = data
            refreshControl.endRefreshing()
        }
    }
    
    private func setUpTable() {
        contentView.setUPTable(delegate: self, dataSource: self)
        contentView.addRefresh(refreshControl)
    }
    
    private func fetchCurrenciesData() {
        contentView.startIndicator()
        service.fetchCurrencies { [weak self] (error, currencies) in
            guard let data = currencies else {
                self?.contentView.errorView(isVisible: true)
                self?.contentView.stopIndicator()
                return
            }
            self?.contentView.errorView(isVisible: false)
            self?.actualCurrencies = data
            self?.contentView.stopIndicator()
        }
    }

// MARK: - Error View Refresh Button
    
    func refresh() {
        fetchCurrenciesData()
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
//            let noDataView = ErrorView()
//            tableView.backgroundView = noDataView
//            tableView.separatorStyle = .none
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
