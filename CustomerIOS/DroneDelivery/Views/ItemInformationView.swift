//
//  ItemInformationView.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 14/04/26.
//

import UIKit

class ItemInformationView: UIView {

    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var primaryTitle: UILabel!
    @IBOutlet weak var primaryInfo: UILabel!
    @IBOutlet weak var secondaryTitle: UILabel!
    @IBOutlet weak var secondaryInfo: UILabel!
    @IBOutlet weak var tertiaryTitle: UILabel!
    @IBOutlet weak var tertiaryInfo: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    
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
        initialiseViews()
    }
    
    func initialiseViews() {
        viewTitle.font = .fontBold(size: 20)
        primaryTitle.font = .fontSemiBold(size: 14)
        primaryInfo.font = .fontRegular(size: 14)
        secondaryTitle.font = .fontSemiBold(size: 14)
        secondaryInfo.font = .fontRegular(size: 14)
        tertiaryTitle.font = .fontSemiBold(size: 14)
        tertiaryInfo.font = .fontRegular(size: 14)
        longDescription.font = .fontLight(size: 14)
    }
    
}
