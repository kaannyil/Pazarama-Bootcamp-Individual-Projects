//
//  ViewController.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ViewControllerTableViewCell.self, 
                           forCellReuseIdentifier: ViewControllerTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    let cryptoViewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        constraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBindings()
        cryptoViewModel.requestData()
    }
    
    private func setupBindings() {
        
        cryptoViewModel
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.cryptoList = cryptos
                self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        cryptoViewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
        cryptoViewModel
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
                
                if bool {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }.disposed(by: disposeBag)
        
        
        /* // Üstteki kodla aynı işleve sahip
        cryptoViewModel
            .loading
            .bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag) */
    }
}

// MARK: - Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewControllerTableViewCell.identifier, 
                                                       for: indexPath) as? ViewControllerTableViewCell else {
            return UITableViewCell()
        }
        
        let data = cryptoList[indexPath.row]
        cell.configure(data)
        
        return cell
    }
    
}

// MARK: - Constraints
extension ViewController {
    func constraints() {
        tableView.pinEdges(superView: view)
        tableView.pinEdges(superView: view)
    }
}

