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
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNumberLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
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
        initialiseViews()
    }
    
    func initialiseViews() {
        statusBarView.backgroundColor = .colorPrimary
        profileInfoView.backgroundColor = .colorPrimary
        userNameLabel.textColor = .colorText1
        userNumberLabel.textColor = .colorText1
        logoutButton.backgroundColor = .colorSupport1
        logoutButton.setTitleColor(.colorText1, for: .normal)
        appVersionLabel.textColor = .colorText2
        userNameLabel.font = .fontBold(size: 17)
        userNumberLabel.font = .fontRegular(size: 17)
        logoutButton.titleLabel?.font = .fontRegular(size: 15)
        appVersionLabel.font = .fontLight(size: 17)
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
