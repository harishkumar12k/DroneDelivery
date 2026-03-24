//
//  ProfileVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var profileTV: UITableView!
    
    // MARK: Variables
    var screenTitle = ""
    let sampleData = Samples.profile()
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTV.dataSource = self
        profileTV.delegate = self
        let nib = UINib(nibName: "ProfileTVCell", bundle: nil)
        profileTV.register(nib, forCellReuseIdentifier: "ProfileTVCell")
    }
    
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVCell", for: indexPath) as! ProfileTVCell
        let data = sampleData[indexPath.row]
        cell.profileTitleLabel.text = data
        return cell
    }
    
}
