//
//  DefaultValuePropertyWrapper.swift
//  StudyDemos
//
//  Created by 怦然心动-LM on 2023/5/26.
//

import Foundation

// MARK: - DefaultValue Protocol

protocol DefaultValue {
    associatedtype Result: Codable
    
    static var defaultValue: Result { get }
}

extension String: DefaultValue {
    static let defaultValue = ""
}

extension Bool: DefaultValue {
    static let defaultValue = false
    
    struct True: DefaultValue {
        static let defaultValue = true
    }
    
    struct False: DefaultValue {
        static let defaultValue = false
    }
}

extension Int: DefaultValue {
    static let defaultValue = 0
}

extension Float: DefaultValue {
    static let defaultValue: Float = 0
}

extension Double: DefaultValue {
    static let defaultValue: Double = 0
}

extension Array: DefaultValue where Element: Codable {
    static var defaultValue: Array<Element> { [] }
}

extension Dictionary: DefaultValue where Key: Codable, Value: Codable {
    static var defaultValue: Dictionary<Key, Value> { [:] }
}

// MARK: - @propertyWrapper

@propertyWrapper
struct Default<T: DefaultValue> {
    var wrappedValue: T.Result
}

extension Default: Codable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Result.self)) ?? T.defaultValue
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

extension KeyedDecodingContainer {
    
    func decode<T>(_ type: Default<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}

extension UnkeyedDecodingContainer {
    
    mutating func decode<T>(_ type: Default<T>.Type) throws -> Default<T> where T : DefaultValue {
        try decodeIfPresent(type) ?? Default(wrappedValue: T.defaultValue)
    }
}
