//
//  OrderHistoryTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class OrderHistoryTVCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var itemImageView1: UIImageView!
    @IBOutlet weak var itemImageView2: UIImageView!
    @IBOutlet weak var itemImageView3: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
