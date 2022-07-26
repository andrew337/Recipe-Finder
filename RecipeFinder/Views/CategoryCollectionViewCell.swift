//
//  CategoryCollectionViewCell.swift
//  RecipeFinder
//
//  Created by Admin on 7/20/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
  
    func set(category : Categories) {
        categoryName.text = category.strCategory
       
            NetworkManager.shared.downloadImage(urlString: category.strCategoryThumb) { [weak self] image in
                DispatchQueue.main.async {
                    self?.categoryImage.image = image
                }
            }
        
    }
    
    
    
    
}
