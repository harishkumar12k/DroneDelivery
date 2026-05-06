//
//  HomeDelegates.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

protocol CVCellTappedDelegate: AnyObject {
    func didTapAction(type: Int, title: String)
}

extension CVCellTappedDelegate {
    func didTapAction(type: Int, title: String = "") {
        
    }
}

protocol BackTappedDelegate: AnyObject {
    func backAction()
}
