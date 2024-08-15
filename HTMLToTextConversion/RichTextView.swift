//
//  RichTextView.swift
//  HTMLToTextConversion
//
//  Created by Gangadhar C on 8/14/24.
//

import SwiftUI

struct RichTextView: View {
    @State var richTextData: RichTextData? = .fetchJsonData()
    var body: some View {
        if let richTextData {
            AttributedText(richTextData.value)
        } else {
            Text("Error")
        }
        
    }
}

enum OutlineColorAttribute : AttributedStringKey {
    typealias Value = Color
    static let name = "OutlineColor"
}
#Preview {
    RichTextView()
}
