//
//  Meal.swift
//  RecipeFinder
//
//  Created by Admin on 7/22/22.
//

import Foundation

struct ingredient : Equatable {
    let measurement : String
    let name : String
}
struct Meal : Decodable {
    var meals : [meals]
}
struct meals : Decodable {
        let strMeal : String
        let strMealThumb : String
        let idMeal : String
    
    var ingredients : [ingredient]
    
        var strInstructions : String
        var strIngredient1 : String?
        var strIngredient2 : String?
        var strIngredient3 : String?
        var strIngredient4 : String?
        var strIngredient5 : String?
        var strIngredient6 : String?
        var strIngredient7 : String?
        var strIngredient8 : String?
        var strIngredient9 : String?
        var strIngredient10 : String?
        var strIngredient11 : String?
        var strIngredient12 : String?
        var strIngredient13 : String?
        var strIngredient14 : String?
        var strIngredient15 : String?
        var strIngredient16 : String?
        var strIngredient17 : String?
        var strIngredient18 : String?
        var strIngredient19 : String?
        var strIngredient20 : String?
        var strMeasure1 : String?
        var strMeasure2 : String?
        var strMeasure3 : String?
        var strMeasure4 : String?
        var strMeasure5 : String?
        var strMeasure6 : String?
        var strMeasure7 : String?
        var strMeasure8 : String?
        var strMeasure9 : String?
        var strMeasure10 : String?
        var strMeasure11 : String?
        var strMeasure12 : String?
        var strMeasure13 : String?
        var strMeasure14 : String?
        var strMeasure15 : String?
        var strMeasure16 : String?
        var strMeasure17 : String?
        var strMeasure18 : String?
        var strMeasure19 : String?
        var strMeasure20 : String?
    
    enum Keys : CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
        case strInstructions
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        
        var tempIngredients : [ingredient] = []
        let emptyIngredient = ingredient(measurement: "", name: "")
        
        let ingredient1 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient1)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure1)) ?? "")
        if ingredient1 != emptyIngredient { tempIngredients.append(ingredient1) }
        
        let ingredient2 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient2)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure2)) ?? "")
        if ingredient2 != emptyIngredient { tempIngredients.append(ingredient2) }
        
        let ingredient3 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient3)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure3)) ?? "")
        if ingredient3 != emptyIngredient { tempIngredients.append(ingredient3) }
        
        let ingredient4 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient4)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure4)) ?? "")
        if ingredient4 != emptyIngredient { tempIngredients.append(ingredient4) }
        
        let ingredient5 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient5)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure5)) ?? "")
        if ingredient5 != emptyIngredient { tempIngredients.append(ingredient5) }
        
        let ingredient6 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient6)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure6)) ?? "")
        if ingredient6 != emptyIngredient { tempIngredients.append(ingredient6) }
        
        let ingredient7 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient7)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure7)) ?? "")
        if ingredient7 != emptyIngredient { tempIngredients.append(ingredient7) }
        
        let ingredient8 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient8)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure8)) ?? "")
        if ingredient8 != emptyIngredient { tempIngredients.append(ingredient8) }
        
        let ingredient9 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient9)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure9)) ?? "")
        if ingredient9 != emptyIngredient { tempIngredients.append(ingredient9) }
        
        let ingredient10 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient10)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure10)) ?? "")
        if ingredient10 != emptyIngredient { tempIngredients.append(ingredient10) }
        
        let ingredient11 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient11)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure11)) ?? "")
        if ingredient11 != emptyIngredient { tempIngredients.append(ingredient11) }
        
        let ingredient12 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient12)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure12)) ?? "")
        if ingredient12 != emptyIngredient { tempIngredients.append(ingredient12) }
        
        let ingredient13 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient13)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure13)) ?? "")
        if ingredient13 != emptyIngredient { tempIngredients.append(ingredient13) }
        
        let ingredient14 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient14)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure14)) ?? "")
        if ingredient14 != emptyIngredient { tempIngredients.append(ingredient14) }
        
        let ingredient15 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient15)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure15)) ?? "")
        if ingredient15 != emptyIngredient { tempIngredients.append(ingredient15) }
        
        let ingredient16 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient16)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure16)) ?? "")
        if ingredient16 != emptyIngredient { tempIngredients.append(ingredient16) }
        
        let ingredient17 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient17)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure17)) ?? "")
        if ingredient17 != emptyIngredient { tempIngredients.append(ingredient17) }
        
        let ingredient18 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient18)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure18)) ?? "")
        if ingredient18 != emptyIngredient { tempIngredients.append(ingredient18) }
        
        let ingredient19 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient19)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure19)) ?? "")
        if ingredient19 != emptyIngredient { tempIngredients.append(ingredient19) }
        
        let ingredient20 = ingredient(
                    measurement: (try? container.decode(String.self, forKey: .strIngredient20)) ?? "",
                    name: (try? container.decode(String.self, forKey: .strMeasure20)) ?? "")
        if ingredient20 != emptyIngredient { tempIngredients.append(ingredient20) }
        
        ingredients = tempIngredients
    }
}
