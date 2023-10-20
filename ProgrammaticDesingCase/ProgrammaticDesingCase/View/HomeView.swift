//
//  ProgrammaticView.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 16.10.2023.
//

import UIKit

class HomeView: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Food"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let firstCollectionView = CollectionView(collectionViewCell: FirstCollectionViewCell.self,
                                             identifier: FirstCollectionViewCell.identifier,
                                             widthRatio: 4.0, heightRatio: 1.4)
    
    let firstTableView = TableView(tableViewCell: FirstTableViewCell.self,
                                   identifier: FirstTableViewCell.identifier)
    
    let secondCollectionView = CollectionView(collectionViewCell: SecondCollectionViewCell.self,
                                              identifier: SecondCollectionViewCell.identifier,
                                              widthRatio: 1.6, heightRatio: 0.83)
    
    let secondTableView = TableView(tableViewCell: SecondTableViewCell.self,
                                    identifier: SecondTableViewCell.identifier)
    
    let data = ManuelData()
    let mostPopularHeaderView = HeaderView()
    let headerHeight: CGFloat = 80
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        mostPopularHeader()
        
        navigationItem.title = "Good Morning Kaan!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        constraintsUpdate()
    }

    // MARK: - Page Functions
    private func mostPopularHeader() {
        mostPopularHeaderView.translatesAutoresizingMaskIntoConstraints = false
        mostPopularHeaderView.setHeaderComponent(header: "Most Popular")
    }
    
    private func configure() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews(view: searchBar, firstCollectionView, firstTableView,
                                mostPopularHeaderView, secondCollectionView, secondTableView)
        constraints()
        delegates()
        
        let barButton = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), 
                                        style: .plain, target: self, action: #selector(buttonClicked))
        barButton.tintColor = UIColor(named: "headerColor")
        navigationItem.rightBarButtonItem = barButton
        
        view.backgroundColor = .white
    }
    @objc func buttonClicked() {
        print("Go to Basket.")
    }
    
    private func delegates() {
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
}

// MARK: - TableViews
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case firstTableView:
            return data.popularRestaurants.count
        case secondTableView:
            return data.recentItems.count
        default:
            fatalError("Unknown TableView")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case firstTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier,
                                                     for: indexPath) as! FirstTableViewCell
            let data = data.popularRestaurants[indexPath.row]
            cell.configure(data)
            return cell
        case secondTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier,
                                                     for: indexPath) as! SecondTableViewCell
            let data = data.recentItems[indexPath.row]
            cell.configure(data)
            return cell
        default:
            fatalError("Unknown TableView")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        
        switch tableView {
        case firstTableView:
            headerView.setHeaderComponent(header: "Popular Restaurants")
            return headerView
        case secondTableView:
            headerView.setHeaderComponent(header: "Recent Restaurants")
            return headerView
        default:
            fatalError("Unknown viewForHeaderInSection")
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case firstTableView:
            return UIScreen.main.bounds.width / 1.3
        case secondTableView:
            return UIScreen.main.bounds.width / 3.5
        default:
            fatalError("Unknown heightForRowAt")
        }
    }
}

// MARK: - CollectionViews
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case firstCollectionView:
            return data.kitchen.count
        case secondCollectionView:
            return data.mostPopular.count
        default:
            fatalError("Unknown CollectionView")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case firstCollectionView:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FirstCollectionViewCell.identifier,
                for: indexPath) as! FirstCollectionViewCell
            
            let data = data.kitchen[indexPath.row]
            cell.configure(data)
            return cell
        case secondCollectionView:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SecondCollectionViewCell.identifier,
                for: indexPath) as! SecondCollectionViewCell
            
            let data = data.mostPopular[indexPath.row]
            cell.configure(data)
            return cell
        default:
           fatalError("Unknown CollectionView")
        }
    }
}

// MARK: - Constraints
extension HomeView {
    private func constraintsUpdate() {
        NSLayoutConstraint.activate([
            firstTableView.heightAnchor.constraint(
                equalToConstant: firstTableView.contentSize.height),
            secondTableView.heightAnchor.constraint(
                equalToConstant: secondTableView.contentSize.height)
        ])
        
        DispatchQueue.main.async {
            let calculatedHeight = self.secondTableView.frame.maxY - self.contentView.frame.minY
            self.contentView.heightAnchor.constraint(equalToConstant: calculatedHeight).isActive = true
        }
    }
    
    private func constraints() {
        
        scrollView.pinEdges(superView: view)
        contentView.pinEdges(superView: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(
                equalTo: scrollView.widthAnchor),
            
            searchBar.topAnchor.constraint(
                equalTo: contentView.topAnchor,constant: 10),
            searchBar.leftAnchor.constraint(
                equalTo: contentView.leftAnchor, constant: 10),
            searchBar.rightAnchor.constraint(
                equalTo: contentView.rightAnchor, constant: -10),
            searchBar.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            
            firstCollectionView.topAnchor.constraint(
                equalTo: searchBar.bottomAnchor, constant: 20),
            firstCollectionView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            firstCollectionView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
            firstCollectionView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            firstCollectionView.heightAnchor.constraint(
                equalTo: contentView.widthAnchor, multiplier: 1 / 4 * 1.4),
            
            firstTableView.topAnchor.constraint(
                equalTo: firstCollectionView.bottomAnchor),
            firstTableView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            firstTableView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
            firstTableView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            firstTableView.heightAnchor.constraint(
                equalToConstant: 10000),
            
            mostPopularHeaderView.topAnchor.constraint(
                equalTo: firstTableView.bottomAnchor),
            mostPopularHeaderView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            mostPopularHeaderView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
            mostPopularHeaderView.heightAnchor.constraint(
                equalToConstant: headerHeight),
            
            secondCollectionView.topAnchor.constraint(
                equalTo: mostPopularHeaderView.bottomAnchor),
            secondCollectionView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            secondCollectionView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
            secondCollectionView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            secondCollectionView.heightAnchor.constraint(
                equalTo: contentView.widthAnchor, multiplier: 1 / 1.6 * 0.83),
            
            secondTableView.topAnchor.constraint(
                equalTo: secondCollectionView.bottomAnchor),
            secondTableView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            secondTableView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
            secondTableView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor),
            secondTableView.heightAnchor.constraint(
                equalToConstant: 10000)
        ])
    }
}
