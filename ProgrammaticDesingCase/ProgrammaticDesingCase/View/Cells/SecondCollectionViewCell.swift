//
//  SecondCollectionViewCell.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 17.10.2023.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "secondCollectionViewCell"
    
    let mostPopularImageView = ImageView(cornerRadius: 15)
    
    let mostPopularNameLabel = Label(color: UIColor(named: "headerColor")!, 
                                     textFont: UIFont.boldSystemFont(ofSize: 18), alignment: .left)
    
    let mostPopularPlaceTypeLabel = Label(color: .systemGray2, 
                                          textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    let mostPopularFoodTypeLabel = Label(color: .systemGray2, 
                                         textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    let mostPopularRatingStarImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "star.fill")
        imageview.tintColor = UIColor(named: "buttonColor")
        return imageview
    }()
    
    let mostPopularRatingPointLabel = Label(color: UIColor(named: "buttonColor")!, 
                                            textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubViews(view: mostPopularImageView, mostPopularNameLabel, mostPopularPlaceTypeLabel,
                    mostPopularFoodTypeLabel, mostPopularRatingStarImageView, mostPopularRatingPointLabel)
        constraints()
        backgroundColor = .clear
    }
    
    func configure(_ data: PopularRestaurants) {
        mostPopularImageView.image = UIImage(named: data.image)
        mostPopularNameLabel.text = "\(data.name)"
        mostPopularPlaceTypeLabel.text = "\(data.placeType)"
        mostPopularFoodTypeLabel.text = "\(data.foodType)"
        mostPopularRatingPointLabel.text = "\(data.ratingPoint)"
    }
    
}

// MARK: - Constraints
extension SecondCollectionViewCell {
    private func constraints() {
        
        NSLayoutConstraint.activate([
            mostPopularImageView.topAnchor.constraint(
                equalTo: topAnchor),
            mostPopularImageView.leftAnchor.constraint(
                equalTo: leftAnchor),
            mostPopularImageView.rightAnchor.constraint(
                equalTo: rightAnchor),
            mostPopularImageView.heightAnchor.constraint(
                equalTo: mostPopularImageView.widthAnchor, multiplier: 9/16),
            mostPopularImageView.centerXAnchor.constraint(
                equalTo: centerXAnchor),
            
            mostPopularNameLabel.topAnchor.constraint(
                equalTo: mostPopularImageView.bottomAnchor, constant: 10),
            mostPopularNameLabel.leftAnchor.constraint(
                equalTo: leftAnchor),
            mostPopularNameLabel.rightAnchor.constraint(
                equalTo: rightAnchor),
            
            mostPopularPlaceTypeLabel.leftAnchor.constraint(
                equalTo: mostPopularNameLabel.leftAnchor),
            mostPopularPlaceTypeLabel.topAnchor.constraint(
                equalTo: mostPopularNameLabel.bottomAnchor, constant: 5),
            
            mostPopularFoodTypeLabel.centerYAnchor.constraint(
                equalTo: mostPopularPlaceTypeLabel.centerYAnchor),
            mostPopularFoodTypeLabel.leftAnchor.constraint(
                equalTo: mostPopularPlaceTypeLabel.rightAnchor, constant: 10),
            
            mostPopularRatingStarImageView.centerYAnchor.constraint(
                equalTo: mostPopularPlaceTypeLabel.centerYAnchor),
            mostPopularRatingStarImageView.leftAnchor.constraint(
                equalTo: mostPopularFoodTypeLabel.rightAnchor, constant: 10),
            mostPopularRatingStarImageView.widthAnchor.constraint(equalToConstant: 15),
            mostPopularRatingStarImageView.heightAnchor.constraint(equalToConstant: 15),
            
            mostPopularRatingPointLabel.centerYAnchor.constraint(
                equalTo: mostPopularPlaceTypeLabel.centerYAnchor),
            mostPopularRatingPointLabel.leftAnchor.constraint(
                equalTo: mostPopularRatingStarImageView.rightAnchor, constant: 2),
        ])
    }
}
