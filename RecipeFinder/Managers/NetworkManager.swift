//
//  NetworkManager.swift
//  RecipeFinder
//
//  Created by Admin on 7/20/22.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func loadCategories( _ completion : @escaping (Category) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        guard let url = URL(string: urlString) else {
            print(ErrorString.invalidData)
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, error in
            if let _ = error {
                print(ErrorString.invalidData)
            }
           guard let data = data else {
               print(ErrorString.invalidData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Category.self, from: data)
                completion(results)
            } catch {
                print(ErrorString.unableToComplete)
                return
            }
        }
        task.resume()
    }
    
    func loadMeals(category_name : String, _ completion : @escaping (MealsList) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category_name)"
        
        guard let url = URL(string: urlString) else {
            print(ErrorString.invalidData)
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, error in
            if let _ = error {
                print(ErrorString.invalidData)
            }
           guard let data = data else {
               print(ErrorString.invalidData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(MealsList.self, from: data)
                completion(results)
            } catch {
                print(ErrorString.unableToComplete)
                return
            }
        }
        task.resume()
    }
    
   func downloadImage(urlString : String,_ completion : @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            print(ErrorString.invalidData)
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, error in
            guard error == nil else {
                print(ErrorString.invalidData)
                completion(nil)
                return
            }
            guard let data = data else {
                print(ErrorString.invalidData)
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
    
    func loadMeal(meal_id : String, _ completion : @escaping (Meal) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal_id)"
        
        guard let url = URL(string: urlString) else {
            print(ErrorString.invalidData)
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, error in
            if let _ = error {
                print(ErrorString.invalidData)
            }
           guard let data = data else {
               print(ErrorString.invalidData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Meal.self, from: data)
               
                completion(results)
            } catch {
                print("Something happened")
                print(ErrorString.unableToComplete)
                return
            }
        }
        task.resume()
    }
}
