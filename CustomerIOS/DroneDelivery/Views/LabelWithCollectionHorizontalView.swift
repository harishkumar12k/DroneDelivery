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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImageAndNameCVCell", for: indexPath) as! ItemImageAndNameCVCell
        cell.nameLabel.text = "Item \(indexPath.row), Item \(indexPath.row), Item \(indexPath.row), Item \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTapDelegate.didTapAction(type: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: horizontalCV.frame.size.width/3, height: 240)
    }
    
}
