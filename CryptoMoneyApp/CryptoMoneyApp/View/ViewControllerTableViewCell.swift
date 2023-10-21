//
//  ViewControllerTableViewCell.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 21.10.2023.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    static let identifier = "viewControllerTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        constraints()

        backgroundColor = .white
    }
    
    func configure(_ data: Crypto) {
        titleLabel.text = data.currency
        subTitleLabel.text = data.price
    }
}

extension ViewControllerTableViewCell {
    private func constraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            subTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
