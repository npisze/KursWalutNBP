//
//  Rate.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 28/08/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

struct Rate: Decodable {
    var currency: String?   // nazwa waluty
    var code: String?       // kod waluty
    var bid: Double?        // przeliczony kurs kupna waluty
    var ask: Double?        // przeliczony kurs sprzedaży waluty
}
