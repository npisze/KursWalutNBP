//
//  DoubleExtension.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 04/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

extension Double {
    var inCash: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let cashValue = numberFormatter.string(from: NSNumber(value: self))!
            return cashValue + " PLN"
        }
    }
}
