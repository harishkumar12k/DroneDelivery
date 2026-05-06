//
//  LabelWithCollectionHorizontalView.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class LabelWithCollectionHorizontalView: UIView {

    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var horizontalCV: UICollectionView!
    @IBOutlet weak var horizontalCVHeightConstraint: NSLayoutConstraint!
    
    // MARK: Variables
    var cellTapDelegate: CVCellTappedDelegate!
    var allProducts: [HomeProduct] = []

    @IBAction func showAllAction(_ sender: UIButton) {
        cellTapDelegate.didTapAction(type: 0, title: titleLabel.text ?? "")
    }
    
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
        let nib = UINib(nibName: "ItemImageAndNameCVCell", bundle: nil) // "MyCellFileName" is the name of your .xib file
        horizontalCV.register(nib, forCellWithReuseIdentifier: "ItemImageAndNameCVCell")
        horizontalCV.dataSource = self
        horizontalCV.delegate = self
    }

}

extension LabelWithCollectionHorizontalView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImageAndNameCVCell", for: indexPath) as! ItemImageAndNameCVCell
        let product = allProducts[indexPath.row]
        cell.nameLabel.text = product.title
        cell.weightLabel.text = product.weight.addSuffix(" gms")
        cell.offerPriceLabel.text = product.offerPrice.addRupeePrefix()
        cell.maxPriceLabel.text = product.originalPrice.addRupeePrefix()
        cell.offerInPercent.text = product.offerPercent.addPercentOffSuffix().addPadding(3)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = allProducts[indexPath.row]
        cellTapDelegate.didTapAction(type: 1, title: product.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: horizontalCV.frame.size.width/3, height: horizontalCV.frame.size.height)
    }
    
}
