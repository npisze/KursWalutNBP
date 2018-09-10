//
//  DoubleExtension.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 04/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

var numberFormatter = NumberFormatter()
extension Double {
    var inCash: String {
        get {
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumSignificantDigits = 2
            let cashValue = numberFormatter.string(from: NSNumber(value: self))!
            return cashValue + " PLN"
        }
    }
}
