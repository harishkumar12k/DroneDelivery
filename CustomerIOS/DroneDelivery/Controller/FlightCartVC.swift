//
//  FlightCartVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class FlightCartVC: UIViewController, BackTappedDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var navBar: DDNavTopBar!
    
    // MARK: IBAction
    @IBAction func paymentAction(_ sender: UIButton) {
        transitInfo()
    }
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backActionDelegate = self
        // Do any additional setup after loading the view.
    }

}

extension FlightCartVC {
    
    // MARK: Protocol-Delegates
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: Navigate
    func transitInfo() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "TransitVC") as! TransitVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
