//
//  AppLayout.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 26/03/26.
//

struct Tab {
    var iconSelected: String
    var iconDeselevcted: String
    var name: String
    var controller: String
}

struct AddressBar {
    var title: String
    var originalAddress: String
    var cartImage: String
}

struct SearchBar {
    var placeholder: String
    var isHidden: Bool
}

struct AdvertiseBar {
    var images: [String]
    var isHidden: Bool
}

struct CategoryView {
    var title: String
    var categoryList: [Category]
}

struct Category {
    var image: String
    var type: String
}

struct QuickProducts {
    var title: String
    var producst: [HomeProducst]
}

struct QuoteOfDay {
    var quote: String
}

struct HomeProducst {
    var image: String
    var offerPercent: String
    var title: String
    var weight: String
    var offerPrice: String
    var originalPrice: String
}

enum HomeStack {
    case address(AddressBar)
    case search(SearchBar)
    case advertise(AdvertiseBar)
    case category(CategoryView)
    case quickProducts([QuickProducts])
    case quote(QuoteOfDay)
}

class AppLayout {
    
    var tabs: [Tab] = [
        Tab(iconSelected: "house.fill", iconDeselevcted: "house", name: "Home", controller: "HomeVC"),
        Tab(iconSelected: "arrow.up.arrow.down.square.fill", iconDeselevcted: "arrow.up.arrow.down.square", name: "Pick Up/Drop", controller: "PickUpDropVC"),
        Tab(iconSelected: "clock.badge.checkmark.fill", iconDeselevcted: "clock.badge.checkmark", name: "Order History", controller: "OrderHistoryVC"),
        Tab(iconSelected: "person.fill", iconDeselevcted: "person", name: "Profile", controller: "ProfileVC")
    ]
    
    var homeStack: [HomeStack] = [
        .address(AddressBar(title: "Delivered in 2 Mins", originalAddress: "#123, Street1, HSK, Bangalore", cartImage: "cart")),
        .search(SearchBar(placeholder: "Search here...", isHidden: false)),
        .advertise(AdvertiseBar(images: ["", ""], isHidden: false)),
        .category(CategoryView(title: "Category", categoryList: [
            Category(image: "viggies", type: ""),
            Category(image: "fruits", type: ""),
            Category(image: "milkProducts", type: ""),
            Category(image: "meatAndFish", type: ""),
            Category(image: "medicineAndTablets", type: ""),
            Category(image: "cakeAndChocolates", type: ""),
            Category(image: "mobileAndAccessories", type: ""),
            Category(image: "dressAndShoes", type: ""),
            Category(image: "sportsAndGames", type: ""),
            Category(image: "toys", type: ""),
            Category(image: "cosmetics", type: ""),
            Category(image: "petFood", type: "")
        ])),
        .quickProducts([
            QuickProducts(title: "2 Minutes Delivery", producst: []),
            QuickProducts(title: "5 Minutes Delivery", producst: [])
        ]),
        .quote(QuoteOfDay(quote: "All days are not same."))
    ]
    
}
