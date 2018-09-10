//
//  HttpErrorEnum.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 06/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import Foundation

enum HttpError: Error {
    
    case redirectionError
    case clientError
    case serverError
    case otherError
    
    static func httpResponseCodeError(_ code: Int) -> HttpError{
        switch code {
            case 300...399:
                return .redirectionError
            case 400...499:
                return .clientError
            case 500...599:
                return .serverError
            default:
                return .otherError
        }
    }
}
