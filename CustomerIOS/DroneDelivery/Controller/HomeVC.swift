//
//  HomeVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class HomeVC: UIViewController, CVCellTappedDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var productsSV: UIStackView!
    
    // MARK: IBAction
    @IBAction func cartAction(_ sender: UIButton) {
        gotoCart()
    }
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        if productsSV != nil {
            addCategoryView()
            addView(name: "2 Minutes delivery")
            addView(name: "5 Minutes delivery")
            addSingleLabelView(quote: "All days are not same.")
        }
    }
    
}

extension HomeVC {
    
    // MARK: Protocol-Delegates
    func didTapAction(type: Int) {
        if type == 0 {
            gotoItemsList()
        } else {
            gotoItemDetail()
        }
    }
    
    // MARK: Navigate
    func gotoCart() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "FlightCartVC") as! FlightCartVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func gotoItemsList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemsListVC = storyboard.instantiateViewController(withIdentifier: "ItemsListVC") as! ItemsListVC
        itemsListVC.screenTitle = "Category"
        navigationController?.pushViewController(itemsListVC, animated: true)
    }
    
    func gotoItemDetail() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }

    // MARK: Add Views
    func addCategoryView() {
        DispatchQueue.main.async {
            let view = ItemCategoryCV(frame: CGRect(x: 0, y: 0, width: self.productsSV.frame.width, height: 300))
            self.productsSV.addArrangedSubview(view)
            view.cellTapDelegate = self
        }
    }
    
    func addView(name: String) {
        DispatchQueue.main.async {
            let view = LabelWithCollectionHorizontalView(frame: CGRect(x: 0, y: 0, width: self.productsSV.frame.width, height: 200))
            view.titleLabel.text = name
            view.horizontalCVHeightConstraint.constant = 250
            self.productsSV.addArrangedSubview(view)
            view.cellTapDelegate = self
        }
    }
    
    func addSingleLabelView(quote: String) {
        DispatchQueue.main.async {
            let view = SingleLabelView(frame: CGRect(x: 0, y: 0, width: self.productsSV.frame.width, height: 0))
            view.titleLabel.text = quote
            self.productsSV.addArrangedSubview(view)
        }
    }
    
}
