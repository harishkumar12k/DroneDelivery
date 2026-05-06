//
//  ItemPriceAndWeightView.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ItemPriceAndWeightView: UIView {

    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var offerInPercent: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productWeight: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDimension: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        initialiseViews()
    }
    
    func initialiseViews() {
        offerInPercent.backgroundColor = .colorBanner
        offerPrice.font = .fontBold(size: 24)
        originalPrice.font = .fontSemiBold(size: 16)
        offerInPercent.font = .fontSemiBold(size: 14)
        productName.font = .fontBold(size: 17)
        productWeight.font = .fontSemiBold(size: 12)
        productRating.font = .fontLight(size: 12)
        productDimension.font = .fontLight(size: 12)
        originalPrice.addStrikeText()
    }
    
}
