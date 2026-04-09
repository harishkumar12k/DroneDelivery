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
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var addressAndSearchView: UIStackView!
    @IBOutlet weak var searchInternalView: UIView!
    @IBOutlet weak var bgScrollView: UIScrollView!
    @IBOutlet weak var bgScrollContentView: UIView!
    @IBOutlet weak var scrollableStackView: UIStackView!
    @IBOutlet weak var advertiseView: HorizontalImageCV!
    
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
        initialiseViews()
    }
    
    func initialiseViews() {
        DispatchQueue.main.async {
            self.searchInternalView.layer.cornerRadius = self.searchInternalView.frame.height/2
        }
        statusBarView.backgroundColor = .colorPrimary
        addressAndSearchView.backgroundColor = .colorPrimary
        addressView.backgroundColor = .colorPrimary
        addressTitle.textColor = .colorText1
        fullAddress.textColor = .colorText1
        cartButton.tintColor = .colorText1
        searchView.backgroundColor = .colorPrimary
        searchInternalView.backgroundColor = .colorPrimary200
        searchBar.textColor = .colorText1
        searchBar.tintColor = .colorText1
        searchBar.attributedPlaceholder = NSAttributedString(
            string: "Search here...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorText1]
        )
        addressTitle.font = .fontRegular(size: 17)
        fullAddress.font = .fontLight(size: 12)
        searchBar.font = .fontRegular(size: 12)
    }
    
}

extension HomeVC {
    
    // MARK: Protocol-Delegates
    func didTapAction(type: Int, title: String) {
        if type == 0 {
            gotoItemsList(title: title)
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
    
    func gotoItemsList(title: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemsListVC = storyboard.instantiateViewController(withIdentifier: "ItemsListVC") as! ItemsListVC
        itemsListVC.screenTitle = title
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
