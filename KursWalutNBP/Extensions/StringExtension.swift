//
//  StringExtension.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 12/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

extension String {
    
    func asPlDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pl")
        formatter.dateFormat = "yyyy-MM-dd"
        guard let newDate = formatter.date(from: self) else { return "no date" }
        formatter.dateFormat = "d MMMM yyyy"
        let newStringDate = formatter.string(from: newDate)
        return newStringDate
    }
}
