//
//  ItemImageAndNameCVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ItemImageAndNameCVCell: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var offerPriceLabel: UILabel!
    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var offerInPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.bgView.layer.cornerRadius = 5
            self.bgView.layer.borderWidth = 0.5
            self.bgView.layer.borderColor = UIColor.black.cgColor
            self.shadowView.layer.cornerRadius = 5
            self.shadowView.layer.shadowColor = UIColor.black.cgColor
            self.shadowView.layer.shadowRadius = 4
            self.shadowView.layer.shadowOpacity = 0.5
            self.shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)

        }
        initialiseViews()
    }
    
    func initialiseViews() {
        nameLabel.font = .fontSemiBold(size: 14)
        weightLabel.font = .fontLight(size: 12)
        offerPriceLabel.font = .fontLight(size: 12)
        maxPriceLabel.font = .fontLight(size: 12)
        offerInPercent.font = .fontSemiBold(size: 12)
        offerInPercent.backgroundColor = .colorBanner
        maxPriceLabel.addStrikeText()
    }

}
