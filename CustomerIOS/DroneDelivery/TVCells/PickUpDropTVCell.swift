//
//  PickUpDropTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class PickUpDropTVCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var statusTextLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
