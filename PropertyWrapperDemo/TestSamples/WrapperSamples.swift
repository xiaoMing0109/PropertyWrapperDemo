//
//  WrapperSamples.swift
//  PropertyWrapperDemo
//
//  Created by 怦然心动-LM on 2023/12/20.
//

import Foundation

struct WrapperDecodableStruct: Decodable {
    @Default<String> var title: String = ""
    @Default<Bool> var isNew: Bool = false
}

struct WrapperEnumDecodableStruct: Decodable {
    enum State: String, Codable {
        case prepare, playing
    }
    @Default<State> var state: State = .prepare
}

extension WrapperEnumDecodableStruct.State: DefaultValue {
    static let defaultValue: WrapperEnumDecodableStruct.State = .prepare
}
