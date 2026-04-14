//
//  String+Extension.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 14/04/26.
//

import UIKit

extension String {

    func addPadding(_ count: Int) -> String {
        let spaces = String(repeating: " ", count: count)
        return "\(spaces)\(self)\(spaces)"
    }
    
    // Specific rupee prefix
    func addRupeePrefix() -> String {
        return "\(StringConstants.rupeesText) \(self)"
    }
    
    // Specific rupee suffix
    func addRupeeSuffix() -> String {
        return "\(self) \(StringConstants.rupeesText)"
    }
    
    // Specific rupee suffix
    func addPercentOffSuffix() -> String {
        return "\(self)% OFF"
    }
    
    // Generic prefix helper
    func addPrefix(_ prefix: String) -> String {
        return "\(prefix)\(self)"
    }
    
    // Generic suffix helper
    func addSuffix(_ suffix: String) -> String {
        return "\(self)\(suffix)"
    }
    
}
