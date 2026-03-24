//
//  DDNavTopBar.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class DDNavTopBar: UIView {

    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var navBarTitleLabel: UILabel!
    
    // MARK: IBAction
    @IBAction func backAction(_ sender: UIButton) {
        backActionDelegate.backAction()
    }
    
    // MARK: Variables
    var backActionDelegate: BackTappedDelegate!
    
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
