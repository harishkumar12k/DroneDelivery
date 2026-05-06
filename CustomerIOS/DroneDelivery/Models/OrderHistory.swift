//
//  OrderHistory.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

struct OrderHistory {
    
    var id: Double
    var delivaryStatus: Int // Failed, Canceled, Delivered
    var isPickUpAndDrop: Bool
    var elapsedTime: Float
    var imageSetUrls: [String]
    var orderedDate: String
    var deliveredDate: String

}
