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
    var title: String
}

struct QuickProducts {
    var title: String
    var allProducts: [HomeProduct]
}

struct QuoteOfDay {
    var quote: String
}

struct HomeProduct {
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
        Tab(iconSelected: "home", iconDeselevcted: "home", name: "Home", controller: "HomeVC"),
        Tab(iconSelected: "pickUpDrop", iconDeselevcted: "pickUpDrop", name: "Pick Up/Drop", controller: "PickUpDropVC"),
        Tab(iconSelected: "orderHistory", iconDeselevcted: "orderHistory", name: "Order History", controller: "OrderHistoryVC"),
        Tab(iconSelected: "profile", iconDeselevcted: "profile", name: "Profile", controller: "ProfileVC")
    ]
    
    var twoMinutesData: [HomeProduct] = [
        HomeProduct(image: "", offerPercent: "10", title: "Demo 1", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 2", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 3", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 4", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 5", weight: "100", offerPrice: "150", originalPrice: "200")
        ]
    
    var fiveMinutesData: [HomeProduct] = [
        HomeProduct(image: "", offerPercent: "10", title: "Demo 6", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 7", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 8", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 9", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Demo 10", weight: "100", offerPrice: "150", originalPrice: "200")
        ]
    
    var similarMinutesData: [HomeProduct] = [
        HomeProduct(image: "", offerPercent: "10", title: "Similar 1", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Similar 2", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Similar 3", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Similar 4", weight: "100", offerPrice: "150", originalPrice: "200"),
        HomeProduct(image: "", offerPercent: "10", title: "Similar 5", weight: "100", offerPrice: "150", originalPrice: "200")
        ]
    
    var homeStack: [HomeStack] = []
    
    init() {
        initialiseAdditionalData()
    }
    
    func initialiseAdditionalData() {
        homeStack = [
            .address(AddressBar(title: "Delivered in 2 Mins", originalAddress: "#123, Street1, HSK, Bangalore", cartImage: "cart")),
            .search(SearchBar(placeholder: "Search here...", isHidden: false)),
            .advertise(AdvertiseBar(images: ["", ""], isHidden: false)),
            .category(CategoryView(title: "Category", categoryList: [
                Category(image: "viggies", type: "viggies", title: "Viggies"),
                Category(image: "fruits", type: "fruits", title: "Fruits"),
                Category(image: "milkProducts", type: "milkProducts", title: "Milk Products"),
                Category(image: "meatAndFish", type: "meatAndFish", title: "Meat And Fish"),
                Category(image: "medicineAndTablets", type: "medicineAndTablets", title: "Medicine And Tablets"),
                Category(image: "cakeAndChocolates", type: "cakeAndChocolates", title: "Cake And Chocolates"),
                Category(image: "mobileAndAccessories", type: "mobileAndAccessories", title: "Mobile And Accessories"),
                Category(image: "dressAndShoes", type: "dressAndShoes", title: "Dress And Shoes"),
                Category(image: "sportsAndGames", type: "sportsAndGames", title: "Sports And Games"),
                Category(image: "toys", type: "toys", title: "Toys"),
                Category(image: "cosmetics", type: "cosmetics", title: "Cosmetics"),
                Category(image: "petFood", type: "petFood", title: "Pet Food")
            ])),
            .quickProducts([
                QuickProducts(title: "2 Minutes Delivery", allProducts: twoMinutesData),
                QuickProducts(title: "5 Minutes Delivery", allProducts: fiveMinutesData)
            ]),
            .quote(QuoteOfDay(quote: "All days are not same."))
        ]
    }
    
}
