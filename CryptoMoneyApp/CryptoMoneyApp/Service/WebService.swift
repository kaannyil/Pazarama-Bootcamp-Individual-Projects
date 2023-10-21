//
//  WebService.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 21.10.2023.
//

import Foundation

enum CryptoError: Error {
    case serverError
    case decodingError
    case urlError
}


class WebService {
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.serverError))
            } else if let data {
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList {
                    completion(.success(cryptoList))
                } else {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
