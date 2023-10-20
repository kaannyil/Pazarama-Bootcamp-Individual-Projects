//
//  SecondTableViewCell.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 17.10.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    static let identifier = "secondTableViewCell"

    let recentImageView = ImageView(cornerRadius: 15)

    let recentNameLabel = Label(color: UIColor(named: "headerColor")!, 
                                textFont: UIFont.boldSystemFont(ofSize: 18), alignment: .left)
    
    let recentPlaceTypeLabel = Label(color: .systemGray2, 
                                     textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)

    let recentFoodTypeLabel = Label(color: .systemGray2, 
                                    textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    let recentRatingStarImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "star.fill")
        imageview.tintColor = UIColor(named: "buttonColor")
        return imageview
    }()

    let recentRatingPointLabel = Label(color: .systemGray2, 
                                       textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)

    let recentRatingCountLabel = Label(color: .systemGray2, 
                                       textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubViews(view: recentImageView, recentNameLabel, recentPlaceTypeLabel,
                    recentFoodTypeLabel, recentRatingStarImageView, recentRatingPointLabel,
                    recentRatingCountLabel)
        constraints()
        backgroundColor = .clear
    }
    
    func configure(_ data: PopularRestaurants) {
        recentImageView.image = UIImage(named: data.image)
        recentNameLabel.text = "\(data.name)"
        recentPlaceTypeLabel.text = "\(data.placeType)"
        recentFoodTypeLabel.text = "\(data.foodType)"
        recentRatingPointLabel.text = "\(data.ratingPoint)"
        recentRatingCountLabel.text = "(\(data.ratingCount) Ratings)"
    }
}

extension SecondTableViewCell {
    private func constraints() {
        
        NSLayoutConstraint.activate([
            recentImageView.leftAnchor.constraint(
                equalTo: leftAnchor, constant: 16),
            recentImageView.topAnchor.constraint(
                equalTo: topAnchor, constant: 10),
            recentImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -10),
            recentImageView.widthAnchor.constraint(
                equalTo: recentImageView.heightAnchor),
            
            recentNameLabel.topAnchor.constraint(
                equalTo: recentImageView.topAnchor),
            recentNameLabel.leftAnchor.constraint(
                equalTo: recentImageView.rightAnchor, constant: 16),
            recentNameLabel.rightAnchor.constraint(
                equalTo: rightAnchor, constant: -16),
            
            recentPlaceTypeLabel.topAnchor.constraint(
                equalTo: recentNameLabel.bottomAnchor, constant: 10),
            recentPlaceTypeLabel.leftAnchor.constraint(
                equalTo: recentNameLabel.leftAnchor),
            
            recentFoodTypeLabel.leftAnchor.constraint(
                equalTo: recentPlaceTypeLabel.rightAnchor, constant: 10),
            recentFoodTypeLabel.centerYAnchor.constraint(
                equalTo: recentPlaceTypeLabel.centerYAnchor),
            
            recentRatingStarImageView.topAnchor.constraint(
                equalTo: recentPlaceTypeLabel.bottomAnchor, constant: 10),
            recentRatingStarImageView.leftAnchor.constraint(
                equalTo: recentNameLabel.leftAnchor),
            recentRatingStarImageView.widthAnchor.constraint(
                equalToConstant: 15),
            recentRatingStarImageView.heightAnchor.constraint(
                equalToConstant: 15),
            
            recentRatingPointLabel.leftAnchor.constraint(
                equalTo: recentRatingStarImageView.rightAnchor, constant: 2),
            recentRatingPointLabel.centerYAnchor.constraint(
                equalTo: recentRatingStarImageView.centerYAnchor),
            
            recentRatingCountLabel.leftAnchor.constraint(
                equalTo: recentRatingPointLabel.rightAnchor, constant: 2),
            recentRatingCountLabel.centerYAnchor.constraint(
                equalTo: recentRatingStarImageView.centerYAnchor),
        ])
    }
}
