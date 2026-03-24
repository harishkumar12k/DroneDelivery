//
//  ItemDetailVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ItemDetailVC: UIViewController, BackTappedDelegate, CVCellTappedDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var itemDetailSV: UIStackView!
    @IBOutlet weak var navBar: DDNavTopBar!

    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self
        addView()
        addView(name: "Similar Products")
    }
    
}

extension ItemDetailVC {
    
    // MARK: Protocol-Delegates
    func didTapAction(type: Int) {
        
    }
    
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: Add Views
    func addView() {
        DispatchQueue.main.async {
            let view = ItemPriceAndWeightView(frame: CGRect(x: 0, y: 0, width: self.itemDetailSV.frame.width, height: 200))
            view.InfoText1.text = "Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1Text 1"
            view.InfoText2.text = "Text 2"
            view.InfoText3.text = "Text 3"
            view.InfoText4.text = "Text 4"
            view.InfoText5.text = "Text 5"
            view.InfoText6.text = "Text 6"
            view.InfoText7.text = "A string is a series of characters, such as Swift, that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that works with strings."
            self.itemDetailSV.addArrangedSubview(view)
        }
    }
    
    func addView(name: String) {
        DispatchQueue.main.async {
            let view = LabelWithCollectionHorizontalView(frame: CGRect(x: 0, y: 0, width: self.itemDetailSV.frame.width, height: 200))
            view.titleLabel.text = name
            view.horizontalCVHeightConstraint.constant = 200
            self.itemDetailSV.addArrangedSubview(view)
            view.cellTapDelegate = self
        }
    }

}
