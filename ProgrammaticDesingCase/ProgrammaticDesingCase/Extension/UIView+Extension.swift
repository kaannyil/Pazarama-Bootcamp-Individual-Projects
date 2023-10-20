//
//  UIView+Extension.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit


extension UIView {
    func addSubViews(view: UIView...)  {
        view.forEach { view in
            addSubview(view)
        }
    }
    
    func pinEdges(superView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leftAnchor.constraint(equalTo: superView.leftAnchor),
            rightAnchor.constraint(equalTo: superView.rightAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
