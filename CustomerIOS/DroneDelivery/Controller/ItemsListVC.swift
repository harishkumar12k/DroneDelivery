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
        cell.textLabel1.text = sampleData[indexPath.row].name
        cell.textLabel2.text = sampleData[indexPath.row].discountAmount
        cell.textLabel3.text = "\(sampleData[indexPath.row].rating) ratings"
        cell.textLabel4.text = sampleData[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
