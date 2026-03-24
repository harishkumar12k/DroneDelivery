//
//  ItemCategoryTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class ItemCategoryTVCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    @IBOutlet weak var textLabel4: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    // MARK: IBAction
    @IBAction func addToFlight(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
