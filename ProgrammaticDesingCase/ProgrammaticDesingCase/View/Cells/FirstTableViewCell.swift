//
//  ProgrammaticTableViewCell.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 16.10.2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    static let identifier = "firstTableViewCell"

    let popularImageView = ImageView(cornerRadius: 0)
    
    let popularNameLabel = Label(color: UIColor(named: "headerColor")!,
                                     textFont: UIFont.boldSystemFont(ofSize: 18), alignment: .left)
    
    let popularRatingStarImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "star.fill")
        imageview.tintColor = UIColor(named: "buttonColor")
        return imageview
    }()
    
    let popularRatingPointLabel = Label(color: .systemGray2, 
                                        textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)

    let popularRatingCountLabel = Label(color: .systemGray2, 
                                        textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)

    let popularPlaceTypeLabel = Label(color: .systemGray2, 
                                      textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    let popularFoodTypeLabel = Label(color: .systemGray2, 
                                     textFont: UIFont.boldSystemFont(ofSize: 13), alignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubViews(view: popularImageView, popularNameLabel, popularRatingStarImageView,
                    popularRatingPointLabel, popularRatingCountLabel, popularPlaceTypeLabel,
                    popularFoodTypeLabel)
        constraints()
        backgroundColor = .clear
    }
    
    func configure(_ data: PopularRestaurants) {
        popularImageView.image = UIImage(named: data.image)
        popularNameLabel.text = "\(data.name)"
        popularRatingPointLabel.text = "\(data.ratingPoint)"
        popularRatingCountLabel.text = "(\(data.ratingCount) Ratings)"
        popularPlaceTypeLabel.text = "\(data.placeType)"
        popularFoodTypeLabel.text = "\(data.foodType)"
    }

}

// MARK: - Constraints
extension FirstTableViewCell {
    private func constraints() {
        NSLayoutConstraint.activate([
            popularImageView.topAnchor.constraint(
                equalTo: topAnchor),
            popularImageView.leftAnchor.constraint(
                equalTo: leftAnchor),
            popularImageView.rightAnchor.constraint(
                equalTo: rightAnchor),
            popularImageView.heightAnchor.constraint(
                equalTo: widthAnchor, multiplier: 9/16),

            popularNameLabel.topAnchor.constraint(
                equalTo: popularImageView.bottomAnchor, constant: 10),
            popularNameLabel.leftAnchor.constraint(
                equalTo: leftAnchor, constant: 16),
            popularNameLabel.rightAnchor.constraint(
                equalTo: rightAnchor, constant: -16),
        
            popularRatingStarImageView.leftAnchor.constraint(
                equalTo: popularNameLabel.leftAnchor),
            popularRatingStarImageView.topAnchor.constraint(
                equalTo: popularNameLabel.bottomAnchor, constant: 5),
            popularRatingStarImageView.widthAnchor.constraint(
                equalToConstant: 15),
            popularRatingStarImageView.heightAnchor.constraint(
                equalToConstant: 15),
            
            popularRatingPointLabel.centerYAnchor.constraint(
                equalTo: popularRatingStarImageView.centerYAnchor),
            popularRatingPointLabel.leftAnchor.constraint(
                equalTo: popularRatingStarImageView.rightAnchor, constant: 3),
            
            popularRatingCountLabel.centerYAnchor.constraint(
                equalTo: popularRatingStarImageView.centerYAnchor),
            popularRatingCountLabel.leftAnchor.constraint(
                equalTo: popularRatingPointLabel.rightAnchor, constant: 3),
            
            popularPlaceTypeLabel.centerYAnchor.constraint(
                equalTo: popularRatingStarImageView.centerYAnchor),
            popularPlaceTypeLabel.leftAnchor.constraint(
                equalTo: popularRatingCountLabel.rightAnchor, constant: 10),
            
            popularFoodTypeLabel.centerYAnchor.constraint(
                equalTo: popularRatingStarImageView.centerYAnchor),
            popularFoodTypeLabel.leftAnchor.constraint(
                equalTo: popularPlaceTypeLabel.rightAnchor, constant: 10)
        ])
    }
}
