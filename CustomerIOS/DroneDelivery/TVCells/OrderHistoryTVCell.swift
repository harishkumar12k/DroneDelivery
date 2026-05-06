//
//  OrderHistoryTVCell.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

import UIKit

class OrderHistoryTVCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var itemImageView1: UIImageView!
    @IBOutlet weak var itemImageView2: UIImageView!
    @IBOutlet weak var itemImageView3: UIImageView!
    @IBOutlet weak var orderAgainButton: UIButton!
    @IBOutlet weak var raiseIssueButton: UIButton!
    @IBOutlet weak var rateOrderButton: UIButton!
    @IBOutlet weak var additionalItemCountLabel: UILabel!
    
    var imagesList: [String] = ["testImage01", "testImage02", "testImage03", "testImage04"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialiseViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialiseViews() {
        setShadowAndCorner()
        textLabel1.font = .fontBold(size: 17)
        textLabel2.font = .fontLight(size: 12)
        additionalItemCountLabel.font = .fontLight(size: 12)
        orderAgainButton.titleLabel?.font = .fontSemiBold(size: 15)
        raiseIssueButton.titleLabel?.font = .fontSemiBold(size: 15)
        rateOrderButton.titleLabel?.font = .fontSemiBold(size: 15)
        orderAgainButton.setTitleColor(.colorText2, for: .normal)
        raiseIssueButton.setTitleColor(.colorText2, for: .normal)
        rateOrderButton.setTitleColor(.colorText2, for: .normal)
        additionalItemCountLabel.textColor = .colorText2
        if imagesList.count > 3 {
            additionalItemCountLabel.text = "\(imagesList.count - 3)+ more"
        } else {
            additionalItemCountLabel.text = ""
        }
        setImages()
    }
    
    func setShadowAndCorner() {
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.borderWidth = 0.5
        shadowView.layer.borderColor = UIColor.lightGray.cgColor
        bgView.layer.cornerRadius = 10
        itemImageView1.layer.cornerRadius = itemImageView1.frame.height/2
        itemImageView2.layer.cornerRadius = itemImageView2.frame.height/2
        itemImageView3.layer.cornerRadius = itemImageView3.frame.height/2
        itemImageView1.layer.borderWidth = 0.5
        itemImageView1.layer.borderColor = UIColor.colorText2.cgColor
        itemImageView2.layer.borderWidth = 0.5
        itemImageView2.layer.borderColor = UIColor.colorText2.cgColor
        itemImageView3.layer.borderWidth = 0.5
        itemImageView3.layer.borderColor = UIColor.colorText2.cgColor
    }
    
    func setImages() {
        for (index, image) in imagesList.enumerated() {
            if index == 0 {
                itemImageView1.image = UIImage(named: image)
            } else if index == 1 {
                itemImageView2.image = UIImage(named: image)
            } else if index == 2 {
                itemImageView3.image = UIImage(named: image)
            }
        }
    }
    
}
