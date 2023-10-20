//
//  FirstCollectionViewCell.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 16.10.2023.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "firstCollectionViewCell"

    let kitchenImageView = ImageView(cornerRadius: 15)
    let kitchenLabel = Label(color: UIColor(named: "headerColor")!, textFont: .boldSystemFont(ofSize: 14), alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubViews(view: kitchenImageView, kitchenLabel)
        constraints()
        backgroundColor = .clear
    }
    
    func configure(_ data: Kitchen) {
        kitchenImageView.image = UIImage(named: data.image)
        kitchenLabel.text = "\(data.title)"
    }
}

// MARK: - Constraints
extension FirstCollectionViewCell {
    private func constraints() {
        
        NSLayoutConstraint.activate([
            kitchenImageView.topAnchor.constraint(equalTo: topAnchor),
            kitchenImageView.leftAnchor.constraint(equalTo: leftAnchor),
            kitchenImageView.rightAnchor.constraint(equalTo: rightAnchor),
            kitchenImageView.heightAnchor.constraint(equalTo: kitchenImageView.widthAnchor),
            kitchenImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            kitchenLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            kitchenLabel.leftAnchor.constraint(equalTo: leftAnchor),
            kitchenLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}
