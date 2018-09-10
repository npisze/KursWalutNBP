//
//  Currencies.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 28/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

struct Currencies: Decodable {
    var table: String
    var no: String
    var tradingDate: String     // TradingDate – data notowania
    var effectiveDate: String   // EffectiveDate – data publikacji
    var rates: [Rate]
}
