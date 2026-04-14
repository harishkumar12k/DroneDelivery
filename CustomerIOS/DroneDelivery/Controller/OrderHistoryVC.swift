//
//  OrderHistoryVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class OrderHistoryVC: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var orderHistoryListTV: UITableView!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var bgTitleLabelView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Variables
    var screenTitle = ""
    let sampleData = Samples.orderHistory()
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        orderHistoryListTV.dataSource = self
        orderHistoryListTV.delegate = self
        orderHistoryListTV.separatorStyle = .none
        let nib = UINib(nibName: "OrderHistoryTVCell", bundle: nil)
        orderHistoryListTV.register(nib, forCellReuseIdentifier: "OrderHistoryTVCell")
        initialiseViews()
    }
    
    func initialiseViews() {
        statusBarView.backgroundColor = .colorPrimary
        bgTitleLabelView.backgroundColor = .colorPrimary
        titleLabel.textColor = .colorText1
        titleLabel.font = .fontBold(size: 17)
    }

}

extension OrderHistoryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTVCell", for: indexPath) as! OrderHistoryTVCell
        cell.selectionStyle = .none
        let data = sampleData[indexPath.row]
        if data.isPickUpAndDrop == true {
            cell.textLabel1.text = "Package PickUp and Delivered in \(data.elapsedTime) Mins"
        } else {
            cell.textLabel1.text = "Package Delivered in \(data.elapsedTime) Mins"
        }
        cell.textLabel2.text = "Ordered on \(data.orderedDate)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
