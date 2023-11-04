//
//  BaseMSCConfig.swift
//  BaseMSCConfig
//
//  Created by Duc Canh on 24/10/2023.
//

import Foundation

public protocol ConvertFeature {
    associatedtype ExpectedModel: Codable
    func convertDataToSingleObject(with data: Data) -> ExpectedModel?
    func convertDataToArrayOfObject(with data: Data) -> [ExpectedModel]?
}

extension ConvertFeature {
    /// convert a data to a expected object
    /// - Parameter data: data type
    /// - Returns: a expected object
    public func convertDataToSingleObject(with data: Data) -> ExpectedModel? {
        do {
            let decoder = JSONDecoder()
            let newModels = try decoder.decode(ExpectedModel.self, from: data)
            print("----------- begin convert data-----------")
            dump(newModels)
            print("----------- finish convert data-----------")
            return newModels
        } catch {
            print("===> BaseMSCConfig: convert data error", error.localizedDescription)
        }
        return nil
    }
    
    /// convert a data to the array of the expected object
    /// - Parameter data: a data
    /// - Returns: array of the expected object
    public func convertDataToArrayOfObject(with data: Data) -> [ExpectedModel]? {
        do {
            let decoder = JSONDecoder()
            let newModels = try decoder.decode([ExpectedModel].self, from: data)
            print("----------- begin convert data-----------")
            dump(newModels)
            print("----------- finish convert data-----------")
            return newModels
        } catch {
            print("===> BaseMSCConfig: Fail when convert data to array object", error.localizedDescription)
        }
        return nil
    }
}

public protocol ConvertSingleFeature {
    associatedtype Model: Codable
    func convertDictionary(from dictionary: [String: Any]) -> Model?
    func convertJson(from json: String) -> Model?
}

public protocol ConvertArrayFeature {
    associatedtype Model: Codable
    func convertArrayOfDictionary(from arrayDictionary: [[String: Any]]) -> [Model]?
}

public struct ParsingArrayData<T: Codable>: ConvertArrayFeature, ConvertFeature {
    public typealias ExpectedModel = T

    public init() {}
    
    /// convert the array of dictionary type to the expected object
    /// - Parameter arrayDictionary: array of dictionary type
    /// - Returns: array of the expected object
    public func convertArrayOfDictionary(from arrayDictionary: [[String: Any]]) -> [T]? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: arrayDictionary) else {
            print("===> Error: fail when convert string json to data")
            return nil
        }
        return convertDataToArrayOfObject(with: jsonData)
    }
}

public struct ParsingSingleData<T: Codable>: ConvertSingleFeature, ConvertFeature {
    public typealias ExpectedModel = T

    public init() {}
    
    /// convert a dictionary to the expected object
    /// - Parameter dictionary: dictionary type
    /// - Returns: expected object
    public func convertDictionary(from dictionary: [String: Any]) -> T? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dictionary) else {
            print("===> Error: fail when convert string json to data")
            return nil
        }
        return convertDataToSingleObject(with: jsonData)
    }
    
    /// convert a string json to the expected object
    /// - Parameter json: string json
    /// - Returns: expected object
    public func convertJson(from json: String) -> T? {
        guard let jsonData = json.data(using: .utf8) else {
            print("===> Error: fail when convert string json to data")
            return nil
        }
        return convertDataToSingleObject(with: jsonData)
    }
}
