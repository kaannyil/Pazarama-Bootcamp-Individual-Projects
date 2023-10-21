//
//  Extension+UIView.swift
//  CryptoMoneyApp
//
//  Created by Kaan Yıldırım on 21.10.2023.
//

import UIKit

extension UIView {
    
    func pinEdges(superView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor),
            rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor),
            bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
