//
//  ItemCategoryCV.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class ItemCategoryCV: UIView {

    // MARK: IBOutlets
    @IBOutlet weak var imagesCV: UICollectionView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var categoryCVHeighConstraint: NSLayoutConstraint!
    
    // MARK: Variables
    var cellTapDelegate: CVCellTappedDelegate!
    var imagesArray: [Category] = []
//    let imagesArray = ["viggies", "fruits", "milkProducts", "meatAndFish", "medicineAndTablets", "cakeAndChocolates", "mobileAndAccessories", "dressAndShoes", "sportsAndGames", "toys", "cosmetics", "petFood"]
    
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
        let nib = UINib(nibName: "CategoryCVCell", bundle: nil)
        imagesCV.register(nib, forCellWithReuseIdentifier: "CategoryCVCell")
        imagesCV.dataSource = self
        imagesCV.delegate = self
    }
    
    func addCategories(images: [Category]) {
        imagesArray = images
        let height = 90 * calculateRow(for: imagesArray.count)
        categoryCVHeighConstraint.constant = CGFloat(height)
    }
    
    func calculateRow(for size: Int) -> Int {
        guard size > 0 else { return 0 }
        return ((size - 1) / 3) + 1
    }
    
}

extension ItemCategoryCV: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVCell", for: indexPath) as! CategoryCVCell
        cell.categoryImageView.image = UIImage(named: imagesArray[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTapDelegate.didTapAction(type: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(imagesCV.frame.size.width)/3, height: 90)
    }
    
}
