//
//  NewTableViewController.swift
//  RecipeFinder
//
//  Created by Admin on 7/21/22.
//

import UIKit

class NewTableViewController: UITableViewController {
    
    var categoryName : String
    var mealsList = [Meals]()
    var product : Meals?
    
    init(categoryName : String) {
        self.categoryName = categoryName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(categoryName)
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mealsCell")

        
        NetworkManager.shared.loadMeals(category_name: categoryName) { [weak self] newMeals in
           // print(newMeals.meals)
            DispatchQueue.main.async {
                self?.mealsList = newMeals.meals
                self?.tableView.reloadData()
                
            }
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealsCell", for: indexPath)
        cell.textLabel?.text = mealsList[indexPath.row].strMeal
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let product = mealsList[indexPath.row]
        let vc = DetailOfMealViewController(mealID: product.idMeal)
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
 

}
