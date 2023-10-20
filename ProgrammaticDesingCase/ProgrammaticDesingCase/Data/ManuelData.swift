//
//  Data.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 18.10.2023.
//

import Foundation

class ManuelData {
    
    var kitchen:            [Kitchen] = []
    var popularRestaurants: [PopularRestaurants] = []
    var mostPopular:        [PopularRestaurants] = []
    var recentItems:        [PopularRestaurants] = []
    
    
    init() {
        kitchenData()
        popularRestaurantsData()
        mostPopularData()
        recentItemsData()
    }
    
    func kitchenData() {
        kitchen = [
            .init(image: "akdeniz", title: "Mediterrenian"),
            .init(image: "hint", title: "Indian"),
            .init(image: "italyan", title: "Italian"),
            .init(image: "srilanka", title: "Sri Lankan"),
            .init(image: "uzakdogu", title: "Far Eastern"),
        ]
    }
    func popularRestaurantsData() {
        popularRestaurants = [
            .init(image: "pizza", name: "Minute by Tuk Tuk", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "cafe", name: "Cafè de Noir", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "patisserie", name: "Bakes by Tella", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
        ]
    }
    func mostPopularData() {
        mostPopular = [
            .init(image: "pizza", name: "Minute by Tuk Tuk", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "cafe", name: "Cafè de Noir", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "patisserie", name: "Bakes by Tella", ratingPoint: 4.9,
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food")
        ]
    }
    func recentItemsData() {
        recentItems = [
            .init(image: "akdeniz", name: "Minute by Tuk Tuk", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "hint", name: "Cafè de Noir", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food"),
            .init(image: "italyan", name: "Bakes by Tella", ratingPoint: 4.9, 
                  ratingCount: 124, placeType: "Cafè", foodType: "Western Food")
        ]
    }
    
    
}
