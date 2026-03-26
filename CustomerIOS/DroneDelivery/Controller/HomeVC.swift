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
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var fullAddress: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var advertisingView: UIView!
    @IBOutlet weak var searchBar: UITextField!
    
    // MARK: IBAction
    @IBAction func cartAction(_ sender: UIButton) {
        gotoCart()
    }
    
    var homeStack = AppLayout().homeStack
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        for stack in homeStack {
            switch stack {
            case .address(let addressData):
                print("Rendering for \(addressData)")
            case .search(let searchData):
                print("Rendering for \(searchData)")
                searchBar.placeholder = searchData.placeholder
                if searchData.isHidden {
                    searchView.removeFromSuperview()
                }
            case .advertise(let advertiseData):
                print("Rendering for \(advertiseData)")
                if advertiseData.isHidden {
                    advertisingView.removeFromSuperview()
                }
            case .category(let categoryData):
                print("Rendering for \(categoryData)")
                if productsSV != nil {
                    addCategoryView(images: categoryData.categoryList)
                }
            case .quickProducts(let products):
                if productsSV != nil {
                    for product in products {
                        addView(name: product.title)
                    }
                }
                print("Rendering for \(products)")
            case .quote(let quoteData):
                addSingleLabelView(quote: quoteData.quote)
            }
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
    func addCategoryView(images: [Category]) {
        DispatchQueue.main.async {
            let view = ItemCategoryCV(frame: CGRect(x: 0, y: 0, width: self.productsSV.frame.width, height: 300))
            view.addCategories(images: images)
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
