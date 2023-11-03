//
//  CryptoViewModelClone.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 23.10.2023.
//

import Foundation
import RxSwift

class CryptoViewModelClone {
    
    let cryptos: PublishSubject<[Crypto]> = PublishSubject()
    let loading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    
    func requestData() {
        
        loading.onNext(true)
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            
            switch result {
            case .success(let crypto):
                self.cryptos.onNext(crypto)
            case .failure(let error):
                switch error {
                case .urlError:
                    print("URL Error !")
                case .serverError:
                    print("Server Error !")
                case .decodingError:
                    print("Decoding Error !")
                }
            }
        }
    }
}
