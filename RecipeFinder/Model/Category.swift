//
//  Category.swift
//  RecipeFinder
//
//  Created by Admin on 7/20/22.
//

import Foundation

struct Category : Codable {
   var categories : [Categories]
}

struct Categories : Codable {
    var strCategory : String
    var strCategoryThumb : String
}
