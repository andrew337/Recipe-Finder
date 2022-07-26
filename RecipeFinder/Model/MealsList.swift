//
//  MealsList.swift
//  RecipeFinder
//
//  Created by Admin on 7/21/22.
//

import Foundation

struct MealsList : Codable {
    var meals : [Meals]
}

struct Meals : Codable {
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
}
