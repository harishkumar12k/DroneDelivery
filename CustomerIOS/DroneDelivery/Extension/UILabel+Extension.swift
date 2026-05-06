//
//  UILabel+Extension.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 14/04/26.
//

import UIKit

extension UILabel {
    func addStrikeText(_ textToStrike: String? = nil) {
        guard let text = self.text else { return }
        
        // Start with existing label font and color
        let attributes: [NSAttributedString.Key: Any] = [
            .font: self.font ?? UIFont.systemFont(ofSize: 17),
            .foregroundColor: self.textColor ?? .black
        ]
        
        let attributeString = NSMutableAttributedString(string: text, attributes: attributes)
        
        let range: NSRange
        if let target = textToStrike, let targetRange = text.range(of: target) {
            range = NSRange(targetRange, in: text)
        } else {
            range = NSRange(location: 0, length: attributeString.length)
        }
        
        attributeString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        self.attributedText = attributeString
    }
    
    func addPadding(_ count: Int) {
        guard let currentText = self.text else { return }
        let spaces = String(repeating: " ", count: count)
        self.text = "\(spaces)\(currentText)\(spaces)"
    }
    
}

