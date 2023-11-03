//
//  ViewControllerClone.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 23.10.2023.
//

import UIKit
import RxSwift

class ViewControllerClone: UIViewController {

    let indicator = UIActivityIndicatorView()
    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    let viewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.requestData()
    }
    
    func setupObservable() {
        viewModel
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { crypto in
                self.cryptoList = crypto
                
            }.disposed(by: disposeBag)
        
        
        viewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
        
        viewModel
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { loading in
                if loading {
                    // StartAnimating
                } else {
                    // Stop Animating
                }
            }.disposed(by: disposeBag)
        
        viewModel
            .loading
            .bind(to: self.indicator.rx.isAnimating)
            .disposed(by: disposeBag)
            
    }
}
