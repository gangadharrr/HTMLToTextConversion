//
//  HTMLText.swift
//  HTMLToTextConversion
//
//  Created by Gangadhar C on 8/14/24.
//

import Foundation
import UIKit
import SwiftUI

struct AttributedText: UIViewRepresentable {
    private let htmlString: String

    init(_ htmlString: String) {
        self.htmlString = htmlString
    }

    func makeUIView(context: Context) -> UITextView {
        let uiTextView = UITextView()

        // Make it transparent so that background Views can shine through.
        uiTextView.backgroundColor = .clear

        // For text visualisation only, no editing.
        uiTextView.isEditable = false        
        uiTextView.isScrollEnabled = false
        uiTextView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(.blue),
            NSAttributedString.Key.underlineColor: UIColor(.blue)
                                         
        ]
        uiTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
        uiTextView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        uiTextView.setContentCompressionResistancePriority(.required, for: .vertical)
        uiTextView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        return uiTextView
    }

    func updateUIView(_ uiTextView: UITextView, context: Context) {
        uiTextView.attributedText = htmlToAttributedString(htmlString)
    }
    
    
    private func htmlToAttributedString(_ htmlString: String) -> NSMutableAttributedString {
        if let htmlData = htmlString.data(using: .utf8) {
            if let attributedString = try? NSMutableAttributedString(
                data: htmlData,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil) {
                
                let attributes = [
                    
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0),
                    NSAttributedString.Key.foregroundColor: UIColor(.test)
                    ]
                
                attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
                return attributedString
            }
        }
        return .init(attributedString: .init())
    }
}

extension AttributedText {
    
}
