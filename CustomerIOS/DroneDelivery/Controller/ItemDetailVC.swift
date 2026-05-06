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
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var bgScrollView: UIScrollView!
    @IBOutlet weak var bgScrollContentView: UIView!
    @IBOutlet weak var bgStackView: UIStackView!
    @IBOutlet weak var productImageSliderView: HorizontalImageCV!
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self
        navBar.navBarTitleLabel.text = "Details"
        addView()
        addProductInformationView()
        addView(name: "Similar Products")
        initialiseViews()
    }
    
    func initialiseViews() {
        statusBarView.backgroundColor = .colorPrimary
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
            let view = ItemPriceAndWeightView(frame: CGRect(x: 0, y: 0, width: self.itemDetailSV.frame.width, height: 100))
            view.offerPrice.text = "450".addRupeePrefix()
            view.originalPrice.text = "500".addRupeePrefix()
            view.offerInPercent.text = "10".addPercentOffSuffix().addPadding(3)
            view.productName.text = "Demo Tabs (25mg)"
            view.productWeight.text = "100 gms"
            view.productRating.text = "4.9 ratings"
            view.productDimension.text = "20cm x 15cm x 15cm"
            self.itemDetailSV.addArrangedSubview(view)
        }
    }
    
    // MARK: Add Views
    func addProductInformationView() {
        DispatchQueue.main.async {
            let view = ItemInformationView(frame: CGRect(x: 0, y: 0, width: self.itemDetailSV.frame.width, height: 100))
            view.viewTitle.text = "Product information"
            view.primaryTitle.text = "Brand"
            view.primaryInfo.text = "Demo"
            view.secondaryTitle.text = "Type"
            view.secondaryInfo.text = "Chips"
            view.tertiaryTitle.text = "Flavour"
            view.tertiaryInfo.text = "Salted"
            view.longDescription.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            self.itemDetailSV.addArrangedSubview(view)
        }
    }
    
    func addView(name: String) {
        DispatchQueue.main.async {
            let view = LabelWithCollectionHorizontalView(frame: CGRect(x: 0, y: 0, width: self.itemDetailSV.frame.width, height: 300))
            view.titleLabel.text = name
            view.allProducts = AppLayout().similarMinutesData
            view.horizontalCVHeightConstraint.constant = 200
            self.itemDetailSV.addArrangedSubview(view)
            view.cellTapDelegate = self
        }
    }

}
