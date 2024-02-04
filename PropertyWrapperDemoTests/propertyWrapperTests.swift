//
//  propertyWrapperTests.swift
//
//  Created by 怦然心动-LM on 2023/5/26.
//

import XCTest

final class propertyWrapperTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
}

// MARK: - Test Normal Structs

extension propertyWrapperTests {
    
    func testNormalDecodableStruct() {
        let json = """
        {
            "isNew": 0
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(NormalDecodableStruct.self, from: data)
            XCTAssertEqual(normalStruct.title, "")
            XCTAssertEqual(normalStruct.isNew, false)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testNormalDecodableStruct2() {
        let json = """
        {
            "isNew": 0
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(NormalDecodableStruct2.self, from: data)
            XCTAssertEqual(normalStruct.title, nil)
            XCTAssertEqual(normalStruct.isNew, nil)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testNormalDecodableStruct3() {
        let json = """
        {
            "isNew": 0
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(NormalDecodableStruct3.self, from: data)
            XCTAssertEqual(normalStruct.title, "")
            XCTAssertEqual(normalStruct.isNew, false)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testNormalDecodableStruct4() {
        let json = """
        {
            "isNew": 0
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(NormalDecodableStruct4.self, from: data)
            XCTAssertEqual(normalStruct.title, "")
            XCTAssertEqual(normalStruct.isNew, false)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
}

// MARK: - Test Wrapper Structs

extension propertyWrapperTests {
    
    func testWrapperDecodableStruct() {
        let json = """
        {
            "isNew": 0
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(WrapperDecodableStruct.self, from: data)
            XCTAssertEqual(normalStruct.title, "")
            XCTAssertEqual(normalStruct.isNew, false)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
}

// MARK: - Test Enum Structs

extension propertyWrapperTests {
    
    func testEnumDecodableStruct() {
        let json = """
        {
            "state": "loading"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(EnumDecodableStruct.self, from: data)
            XCTAssertEqual(normalStruct.state, .prepare)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testEnumDecodableStruct2() {
        let json = """
        {
            "state": "loading"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(EnumDecodableStruct2.self, from: data)
            XCTAssertEqual(normalStruct.state, .prepare)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testEnumDecodableStruct3() {
        let json = """
        {
            "state": "loading"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(EnumDecodableStruct3.self, from: data)
            XCTAssertEqual(normalStruct.state, .prepare)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
    
    func testEnumDecodableStruct4() {
        let json = """
        {
            "state": "loading"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(EnumDecodableStruct4.self, from: data)
            XCTAssertEqual(normalStruct.state, .prepare)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
}

// MARK: - Test Wrapper Enum Structs

extension propertyWrapperTests {
    
    func testWrapperEnumDecodableStruct() {
        let json = """
        {
            "state": "loading"
        }
        """
        
        guard let data = json.data(using: .utf8) else { return }
        
        do {
            let decoder = JSONDecoder()
            let normalStruct = try decoder.decode(WrapperEnumDecodableStruct.self, from: data)
            XCTAssertEqual(normalStruct.state, .prepare)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
}

// MARK: - Test Codable Image

extension propertyWrapperTests {
    
    func testCodableImage() {
        struct AStruct: Codable {
            @CodableImage var image: UIImage?
        }
        
        let image = UIImage(named: "test")
        XCTAssertNotNil(image)
        
        var aStruct = AStruct()
        aStruct.image = image
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(aStruct)
            
            let decoder = JSONDecoder()
            let aDecodableStruct = try decoder.decode(AStruct.self, from: data)
            XCTAssertNotNil(aDecodableStruct.image)
        } catch {
            print(error)
            XCTAssertThrowsError(error)
        }
    }
}
