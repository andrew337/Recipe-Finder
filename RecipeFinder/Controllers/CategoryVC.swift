//
//  CategoryVC.swift
//  RecipeFinder
//
//  Created by Admin on 7/20/22.
//

import UIKit

class CategoryVC: UICollectionViewController {
    
    var categories = [Categories]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    
        NetworkManager.shared.loadCategories { [weak self] category in
            DispatchQueue.main.async {
                self?.categories = category.categories
                //print(category.categories[0].strCategoryThumb)
                self?.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else {  fatalError("Unable to dequeue cell")}
        
        cell.categoryImage.layer.borderColor = UIColor(white: 8, alpha: 0.3).cgColor
        cell.categoryImage.layer.borderWidth = 2
        cell.categoryImage.layer.cornerRadius = 8
        cell.layer.cornerRadius = 7
        let currentCategory = categories[indexPath.row]
        cell.set(category: currentCategory)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nameOfCategory = categories[indexPath.item].strCategory
        let vc = NewTableViewController(categoryName: nameOfCategory)
        vc.title = nameOfCategory
        navigationController?.pushViewController(vc, animated: true)
    }
}
