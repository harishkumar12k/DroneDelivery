//
//  HomeDelegates.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

protocol CVCellTappedDelegate: AnyObject {
    func didTapAction(type: Int)
}

protocol BackTappedDelegate: AnyObject {
    func backAction()
}
