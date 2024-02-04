//
//  NormalSamples.swift
//  PropertyWrapperDemo
//
//  Created by 怦然心动-LM on 2023/12/20.
//

import Foundation

// MARK: - Normal Decodable Struct

struct NormalDecodableStruct: Decodable {
    var title: String = ""
    var isNew: Bool = false
}

struct NormalDecodableStruct2: Decodable {
    var title: String?
    var isNew: Bool?
}

struct NormalDecodableStruct3: Decodable {
    var title: String = ""
    var isNew: Bool = false
    
    enum CodingKeys: CodingKey {
        case title
        case isNew
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.isNew = try container.decodeIfPresent(Bool.self, forKey: .isNew) ?? false
    }
}

struct NormalDecodableStruct4: Decodable {
    var title: String = ""
    var isNew: Bool = false
    
    enum CodingKeys: CodingKey {
        case title
        case isNew
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? ""
        self.isNew = (try? container.decode(Bool.self, forKey: .isNew)) ?? false
    }
}

// MARK: - Enum Decodable Struct

struct EnumDecodableStruct: Decodable {
    enum State: String, Codable {
        case prepare, playing
    }
    var state: State = .prepare
}

struct EnumDecodableStruct2: Decodable {
    enum State: String, Codable {
        case prepare, playing
    }
    var state: State = .prepare
    
    enum CodingKeys: CodingKey {
        case state
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decodeIfPresent(State.self, forKey: .state) ?? .prepare
    }
}

struct EnumDecodableStruct3: Decodable {
    enum State: String, Codable {
        case prepare, playing
    }
    var state: State = .prepare
    
    enum CodingKeys: CodingKey {
        case state
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = (try? container.decode(State.self, forKey: .state)) ?? .prepare
    }
}

struct EnumDecodableStruct4: Decodable {
    enum State: String, Codable {
        case prepare, playing
        
        init(rawValue: String) {
            switch rawValue {
            case "prepare": self = .prepare
            case "playing": self = .playing
            default: self = .prepare
            }
        }
    }
    var state: State = .prepare
}
