//
//  ItemsListVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ItemsListVC: UIViewController, BackTappedDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var itemListTV: UITableView!
    @IBOutlet weak var navBar: DDNavTopBar!
    
    // MARK: Variables
    var screenTitle = ""
    let sampleData = Samples.samples()
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self
        navBar.navBarTitleLabel.text = screenTitle
        itemListTV.dataSource = self
        itemListTV.delegate = self
        itemListTV.separatorStyle = .none
        let nib = UINib(nibName: "ItemCategoryTVCell", bundle: nil)
        itemListTV.register(nib, forCellReuseIdentifier: "ItemCategoryTVCell")
    }

}

extension ItemsListVC {
    
    // MARK: Protocol-Delegates
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ItemsListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCategoryTVCell", for: indexPath) as! ItemCategoryTVCell
        cell.selectionStyle = .none
        cell.nameLabel.text = sampleData[indexPath.row].name
        cell.weightLabel.text = sampleData[indexPath.row].weight
        cell.sizeLabel.text = sampleData[indexPath.row].size
        cell.offerPriceLabel.text = "\(sampleData[indexPath.row].currency) \(sampleData[indexPath.row].discountAmount)"
        cell.ratingLabel.text = "\(sampleData[indexPath.row].rating) ratings"
        cell.originalPriceLabel.text = "\(sampleData[indexPath.row].currency) \(sampleData[indexPath.row].price)"
        cell.offerPercentLabel.text = "  \(sampleData[indexPath.row].discountPercent)% OFF  "
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
