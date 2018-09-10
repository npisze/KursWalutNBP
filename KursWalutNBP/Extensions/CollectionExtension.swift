//
//  CollectionExtension.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 08/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
