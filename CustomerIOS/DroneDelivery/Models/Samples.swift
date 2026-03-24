//
//  Samples.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 13/03/26.
//

struct Samples {
    
    static func samples() -> [ItemDetail] {
        var items: [ItemDetail] = []
        for index in 0...5 {
            let item = ItemDetail(id: Double(index), name: "Name \(index + 1)", price: "122", mrp: "222", currency: "$", discountPercent: "45%", discountAmount: "100", weight: "100 grams", size: "19x30", rating: 4.9, baseImageUrl: "https://st2.depositphotos.com/12822122/42029/i/450/depositphotos_420292042-stock-photo-asian-girls-holding-sale-shopping.jpg", imageSetUrls: [])
            items.append(item)
        }
        return items
    }
 
    static func orderHistory() -> [OrderHistory] {
        var items: [OrderHistory] = []
        for index in 0...5 {
            let item = OrderHistory(id: Double(index), delivaryStatus: 1, isPickUpAndDrop: false, elapsedTime: 10, imageSetUrls: [], orderedDate: "2026-03-03 10:30 PM", deliveredDate: "2026-03-03 10:33 PM")
            items.append(item)
        }
        return items
    }
    
    static func pickUpDrop() -> [PickUpDropModel] {
        var sample: [PickUpDropModel] = []
        sample.append(PickUpDropModel(orderis: 1, statusText: "Drone Take OFF from Drone Hub", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "In Transit to Pick Up location", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Arrived and waiting for package", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Analysing the weight of product", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Examining surrounding to Take-OFF", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Drone Transit to Drop Location", isSuccess: true))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Arrived and delivered the package", isSuccess: false))
        sample.append(PickUpDropModel(orderis: 1, statusText: "Return to Drone Hub", isSuccess: false))
        return sample
    }
    
    static func profile() -> [String] {
        var sample: [String] = ["Your Pick-Up Addresses", "Your Drop Addresses", "Open Source Licenses", "Help & Support", "Terms & Conditions", "Privacy Policies", "About"]
        return sample
    }
    
}
