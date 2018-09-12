//
//  Service.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 04/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

final class DataService {
    
    private let apiProvider = APIProvider()

    func fetchCurrencies(completion: @escaping (_ error: Error?, _ data: Currencies?) -> Void) {
        
        guard let currenciesURL = getPlistUrl(for: "currenciesURL") else { return } // jesli return to error dla plist
        
        apiProvider.fetch(from: currenciesURL) { (error, currencies: [Currencies]?) in
            DispatchQueue.main.async {
                completion(error, currencies?.first)
            }
        }
    }
    
    func fetchGoldData(completion: @escaping (_ error: Error?, _ data: GoldRate?) -> Void){
  
        guard let goldURL = getPlistUrl(for: "goldURL") else { return }
    
        apiProvider.fetch(from: goldURL) { (error, gold: [GoldRate]?) in
            DispatchQueue.main.async {
                completion(error, gold?.first)
            }
        }
    }
    
    private func getPlistUrl(for urlKey: String) -> URL? {
        
        guard let urlPlist = Bundle.main.path(forResource: "urlStrings", ofType: "plist"), let urls = NSDictionary(contentsOfFile: urlPlist) as? [String: String], let urlString = urls[urlKey] else { return nil }
        
        return URL(string: urlString)
    }
}
