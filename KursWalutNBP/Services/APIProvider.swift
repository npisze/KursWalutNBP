//
//  APIProvider.swift
//  KursWalutNBP
//
//  Created by Natalia Hetmańska on 08/09/2018.
//  Copyright © 2018 npisze. All rights reserved.
//

import UIKit

final class APIProvider {
    
    func fetch<T: Decodable>(from url: URL, completion: @escaping (_ error: Error?, _ data: T?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(error, nil)
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(error, nil)
                return
            }
            
            var fetchResponse: T?
            
            // 3) func handle reponse code
            
            // TODO: - ParseError
            if (200...299).contains(response.statusCode) {
                fetchResponse = self.parse(data: data)
            } else { // http code != 2xx
                completion(HttpError.httpResponseCodeError(response.statusCode), nil)
                return
            }
            
            completion(nil, fetchResponse)
            }.resume()
        
    }
    
    // 4) func parse model
    func parse<A: Decodable>(data: Data) -> A? {
        if let actualCurrencies = try? JSONDecoder().decode(A.self, from: data) {
            return actualCurrencies
        } else {
            return nil
        }
    }
}
