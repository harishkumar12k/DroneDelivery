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
        
    override func awakeFromNib() {
        super.awakeFromNib()
        offerPercentLabel.text = "10".addPercentOffSuffix().addPadding(3)
        offerPercentLabel.backgroundColor = .green
        initialiseViews()
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialiseViews() {
        setShadowAndCorner()
        offerPercentLabel.backgroundColor = .colorBanner
        nameLabel.font = .fontBold(size: 20)
        weightLabel.font = .fontSemiBold(size: 14)
        ratingLabel.font = .fontLight(size: 12)
        sizeLabel.font = .fontLight(size: 12)
        offerPercentLabel.font = .fontSemiBold(size: 14)
        originalPriceLabel.font = .fontRegular(size: 14)
        offerPriceLabel.font = .fontSemiBold(size: 14)
        originalPriceLabel.addStrikeText()
    }
    
}
