//
//  PopularRestaurants.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 17.10.2023.
//

import Foundation

class PopularRestaurants {
    let image: String
    let name: String
    let ratingPoint: Double
    let ratingCount: Int
    let placeType: String
    let foodType: String
    
    init(image: String, name: String, ratingPoint: Double, ratingCount: Int, placeType: String, foodType: String) {
        self.image = image
        self.name = name
        self.ratingPoint = ratingPoint
        self.ratingCount = ratingCount
        self.placeType = placeType
        self.foodType = foodType
    }
}
