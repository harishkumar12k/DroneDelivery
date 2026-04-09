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
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var pickUpDropView: UIView!
    @IBOutlet weak var pickUpLabel: UILabel!
    @IBOutlet weak var pickUpAddressLabel: UILabel!
    @IBOutlet weak var dropToLabel: UILabel!
    @IBOutlet weak var dropToAddressLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityTV: UITableView!
    
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
        initialiseViews()
    }
    
    func initialiseViews() {
        self.view.backgroundColor = .colorText1
        statusBarView.backgroundColor = .colorPrimary
        pickUpDropView.backgroundColor = .colorPrimary
        pickUpLabel.textColor = .colorText1
        pickUpAddressLabel.textColor = .colorText1
        dropToLabel.textColor = .colorText1
        dropToAddressLabel.textColor = .colorText1
        noteLabel.textColor = .colorPrimary
        activityTitleLabel.textColor = .colorText2
        pickUpLabel.font = .fontRegular(size: 17)
        pickUpAddressLabel.font = .fontLight(size: 12)
        dropToLabel.font = .fontRegular(size: 17)
        dropToAddressLabel.font = .fontLight(size: 12)
        noteLabel.font = .fontLight(size: 17)
        activityTitleLabel.font = .fontBold(size: 17)
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
