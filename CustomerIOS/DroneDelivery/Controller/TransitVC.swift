//
//  TransitVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class TransitVC: UIViewController, BackTappedDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var navBar: DDNavTopBar!
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self

    }

}

extension TransitVC {
    
    // MARK: Protocol-Delegates
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
