//
//  CodableImage.swift
//  AIChatB-iOS
//
//  Created by 怦然心动-LM on 2023/4/23.
//

import Foundation
import UIKit

@propertyWrapper
struct CodableImage: Codable {

    var wrappedValue: UIImage? = nil
    
    init(wrappedValue: UIImage? = nil) {
        self.wrappedValue = wrappedValue
    }
    
    enum CodingKeys: String, CodingKey {
        case wrappedValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode(Data.self, forKey: CodingKeys.wrappedValue)
        guard let image = UIImage(data: data) else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.wrappedValue, in: container, debugDescription: "Decoding image failed!")
        }
        self.wrappedValue = image
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let data = wrappedValue?.pngData() {
            try container.encode(data, forKey: CodingKeys.wrappedValue)
        } else if let data = wrappedValue?.jpegData(compressionQuality: 1.0) {
            try container.encode(data, forKey: CodingKeys.wrappedValue)
        } else {
            try container.encodeNil(forKey: CodingKeys.wrappedValue)
        }
    }
}
