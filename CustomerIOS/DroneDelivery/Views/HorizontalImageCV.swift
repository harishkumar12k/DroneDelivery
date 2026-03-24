//
//  HorizontalImageCV.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class HorizontalImageCV: UIView {

    // MARK: IBOutlets
    @IBOutlet weak var imagesCV: UICollectionView!
    @IBOutlet var contentView: UIView!
    
    // MARK: Variables
    let imagesArray = ["testImage01", "testImage02", "testImage03", "testImage04", "testImage05"]
    
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
        let nib = UINib(nibName: "SliderImageCVCell", bundle: nil)
        imagesCV.register(nib, forCellWithReuseIdentifier: "SliderImageCVCell")
        imagesCV.dataSource = self
        imagesCV.delegate = self
    }
    
}

extension HorizontalImageCV: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderImageCVCell", for: indexPath) as! SliderImageCVCell
        cell.sliderImageView.image = UIImage(named: imagesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return imagesCV.frame.size
    }
    
}
