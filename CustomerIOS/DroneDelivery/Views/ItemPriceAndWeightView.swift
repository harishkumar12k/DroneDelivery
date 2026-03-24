//
//  ItemPriceAndWeightView.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class ItemPriceAndWeightView: UIView {

    // MARK: IBOutlets
    @IBOutlet weak var InfoText1: UILabel!
    @IBOutlet weak var InfoText2: UILabel!
    @IBOutlet weak var InfoText3: UILabel!
    @IBOutlet weak var InfoText4: UILabel!
    @IBOutlet weak var InfoText5: UILabel!
    @IBOutlet weak var InfoText6: UILabel!
    @IBOutlet weak var InfoText7: UILabel!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Further setup can go here
    }

}
