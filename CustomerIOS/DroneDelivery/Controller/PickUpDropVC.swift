//
//  PickUpDropVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class PickUpDropVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var pickUpDropTV: UITableView!
    
    // MARK: Variables
    var screenTitle = ""
    let sampleData = Samples.pickUpDrop()
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        pickUpDropTV.dataSource = self
        pickUpDropTV.delegate = self
        let nib = UINib(nibName: "PickUpDropTVCell", bundle: nil)
        pickUpDropTV.register(nib, forCellReuseIdentifier: "PickUpDropTVCell")
    }
    
}

extension PickUpDropVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpDropTVCell", for: indexPath) as! PickUpDropTVCell
        let data = sampleData[indexPath.row]
        cell.statusTextLabel.text = data.statusText
        if data.isSuccess {
            cell.statusImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            cell.statusImageView.image = UIImage(systemName: "circle")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
