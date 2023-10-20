//
//  CollectionView.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit

class CollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (collectionViewCell: UICollectionViewCell.Type, identifier: String, widthRatio: Double, heightRatio: Double){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let sizeWidth = UIScreen.main.bounds.width / widthRatio
        layout.itemSize = CGSize(width: sizeWidth, height: sizeWidth * heightRatio)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        self.init(frame: .zero, collectionViewLayout: layout)
        
        register(collectionViewCell, forCellWithReuseIdentifier: identifier)
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
    }
}
