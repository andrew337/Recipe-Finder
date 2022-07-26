//
//  DetailOfMeal.swift
//  RecipeFinder
//
//  Created by Admin on 7/26/22.
//

import UIKit

class DetailOfMealViewController: UIViewController {
    
    let mealImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "testPic")
        return imageView
    }()
    
    let nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let instructionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    let ingredientsTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    
    var mealID : String
    
    
    init(mealID : String) {
        self.mealID = mealID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        
        NetworkManager.shared.loadMeal(meal_id: mealID) { [weak self] mealDetails in
            
            DispatchQueue.main.async {
                
                let meal = mealDetails.meals[0]
                
                self?.nameLabel.text = meal.strMeal
                self?.instructionTextView.text = meal.strInstructions
                self?.ingredientsTextView.text = self?.configureIngredients(ingredientList: meal.ingredients)
                
                NetworkManager.shared.downloadImage(urlString: meal.strMealThumb) { [weak self] image in
                    DispatchQueue.main.async {
                        self?.mealImage.image = image
                    }
                }
                
            }
        }
        
    }
    
    func configureIngredients(ingredientList : [ingredient]) -> String {
        
        var listOfIngredients = "Ingredients: \n"
        
        for ingredientList in ingredientList {
            listOfIngredients += "\(ingredientList.name) \(ingredientList.measurement)\n"
        }
        
        return listOfIngredients
    }
    
    
    
    func configure() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(nameLabel)
        view.addSubview(mealImage)
        view.addSubview(instructionTextView)
        view.addSubview(ingredientsTextView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            mealImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            mealImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mealImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mealImage.heightAnchor.constraint(equalToConstant: 180),
            
            instructionTextView.topAnchor.constraint(equalTo: mealImage.bottomAnchor, constant: 10),
            instructionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            instructionTextView.heightAnchor.constraint(equalToConstant: 180),
            instructionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            ingredientsTextView.topAnchor.constraint(equalTo: instructionTextView.bottomAnchor, constant: 10),
            ingredientsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            ingredientsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ingredientsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
}
