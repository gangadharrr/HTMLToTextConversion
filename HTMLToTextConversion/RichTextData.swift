//
//  RichTextData.swift
//  HTMLToTextConversion
//
//  Created by Gangadhar C on 8/14/24.
//

import Foundation

struct RichTextData: Codable {
    let name: String
    let value: String
}

extension RichTextData {
    static func fetchJsonData() -> Self? {
        if let url = Bundle.main.url(forResource: "SampleRichText", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(RichTextData.self, from: data)
                return jsonData
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }

        return nil
    }
}
