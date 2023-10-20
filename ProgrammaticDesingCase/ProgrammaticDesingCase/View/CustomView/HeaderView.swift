//
//  HeaderView.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit

class HeaderView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor(named: "headerColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.setTitleColor(UIColor(named: "buttonColor"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeaderComponent(header: String) {
        label.text = header
        configure()
    }
    
    private func configure() {
        addSubViews(view: label, button)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
