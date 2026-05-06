//
//  ProfileTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class ProfileTVCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var bgTitleView: UIView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgTitleView.layer.borderColor = UIColor.colorText2.cgColor
        bgTitleView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
