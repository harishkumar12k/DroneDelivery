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
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var mapView: UIView!
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self

        initialiseViews()
    }
    
    func initialiseViews() {
        statusBarView.backgroundColor = .colorPrimary
    }

}

extension TransitVC {
    
    // MARK: Protocol-Delegates
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
