//
//  ItemCategoryTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class ItemCategoryTVCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var offerPercentLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var offerPriceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var addToCartSV: UIStackView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var decreaseCartItem: UIButton!
    @IBOutlet weak var increaseCartItem: UIButton!
    
    // MARK: IBAction
    @IBAction func addToFlight(_ sender: UIButton) {
        itemCount = 1
        handleCartButtons()
    }
    
    @IBAction func increaseItem(_ sender: UIButton) {
        itemCount += 1
        handleCartButtons()
    }
    
    @IBAction func decreaseItem(_ sender: UIButton) {
        itemCount -= 1
        handleCartButtons()
    }
    
    var itemCount: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        offerPercentLabel.text = "10% OFF"
        offerPercentLabel.backgroundColor = .green
        setShadowAndCorner()
        handleCartButtons()
    }
    
    func setShadowAndCorner() {
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.borderWidth = 0.5
        shadowView.layer.borderColor = UIColor.lightGray.cgColor
        bgView.layer.cornerRadius = 10
        addToCartSV.layer.cornerRadius = addToCartSV.frame.size.height/2
        addToCartButton.layer.borderWidth = 2
        addToCartButton.layer.borderColor = UIColor.colorPrimary.cgColor
    }
    
    func handleCartButtons() {
        if itemCount == 0 {
            DispatchQueue.main.async {
                self.addToCartButton.isUserInteractionEnabled = true
                self.decreaseCartItem.isHidden = true
                self.increaseCartItem.isHidden = true
                self.addToCartButton.setTitle("Add to flight", for: .normal)
                self.addToCartButton.backgroundColor = .colorPrimary
                self.addToCartButton.setTitleColor(.white, for: .normal)
            }
        } else {
            DispatchQueue.main.async {
                self.addToCartButton.isUserInteractionEnabled = false
                self.decreaseCartItem.isHidden = false
                self.increaseCartItem.isHidden = false
                self.addToCartButton.setTitle("\(self.itemCount)", for: .normal)
                self.addToCartButton.backgroundColor = UIColor.white
                self.addToCartButton.setTitleColor(.colorPrimary, for: .normal)
            }
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
