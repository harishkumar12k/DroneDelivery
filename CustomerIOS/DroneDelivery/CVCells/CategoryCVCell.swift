//
//  CategoryCVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 16/03/26.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryBGView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.contentMode = .scaleAspectFit
        DispatchQueue.main.async {
            self.categoryBGView.layer.cornerRadius = self.categoryBGView.frame.size.height/2
            self.categoryBGView.layer.borderWidth = 3
            self.categoryBGView.layer.borderColor = UIColor.colorPrimary.cgColor
        }
    }

}
