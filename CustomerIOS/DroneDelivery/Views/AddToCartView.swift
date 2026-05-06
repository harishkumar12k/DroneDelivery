//
//  AddToCartView.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 14/04/26.
//

import UIKit

class AddToCartView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var addToCartSV: UIStackView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var decreaseCartItem: UIButton!
    @IBOutlet weak var increaseCartItem: UIButton!
    
    var itemCount: Int = 0

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
        contentView.clipsToBounds = true
        DispatchQueue.main.async {
            self.contentView.layer.cornerRadius = self.contentView.frame.size.height/2
            self.addToCartButton.layer.borderWidth = 2
            self.addToCartButton.layer.borderColor = UIColor.colorPrimary.cgColor
        }
        handleCartButtons()
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

}
