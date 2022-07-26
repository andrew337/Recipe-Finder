//
//  PhotoDetailImageCell.swift
//  RecipeFinder
//
//  Created by Admin on 7/22/22.
//

import UIKit

class PhotoDetailImageCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView : UIImageView!
    
    
    func set(mealImageString : String) {
       
            NetworkManager.shared.downloadImage(urlString: mealImageString) { [weak self] image in
                DispatchQueue.main.async {
                    print(mealImageString)
                    self?.photoImageView.image = image
                }
            }
        
    }

}
