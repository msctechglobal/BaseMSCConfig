//
//  BaseMSCConfig.swift
//  BaseMSCConfig
//
//  Created by Duc Canh on 24/10/2023.
//

import Foundation

public protocol ConvertSingleFeature {
    associatedtype Model: Codable
    func convertDictionary(from data: Any) -> Model?
}

public protocol ConvertArrayFeature {
    associatedtype Model: Codable
    func convertArrayOfDictionary(from data: Any) -> [Model]?
}

public struct ParsingArrayData<T: Codable>: ConvertArrayFeature {

    public init() {}

    public func convertArrayOfDictionary(from data: Any) -> [T]? {
        convertData(with: data)
    }
    
    /// Convert data to array object
    /// - Parameter data: any type
    /// - Returns: array object
    private func convertData(with data: Any) -> [T]? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            let newModels = try decode.decode([T].self, from: jsonData)
            print("----------- begin convert data-----------")
            dump(newModels)
            print("----------- finish convert data-----------")
            return newModels
        } catch {
            print("===> BaseMSCConfig: convert data error", error.localizedDescription)
        }
        return nil
    }
}

public struct ParsingSingleData<T: Codable>: ConvertSingleFeature {

    public init() {}

    /// convert data to object
    /// - Parameter data: any type
    /// - Returns: object
    public func convertDictionary(from data: Any) -> T? {
        return convertData(with: data)
    }

    private func convertData(with data: Any) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            let newModels = try decode.decode(T.self, from: jsonData)
            print("----------- begin convert data-----------")
            dump(newModels)
            print("----------- finish convert data-----------")
            return newModels
        } catch {
            print("===> BaseMSCConfig: convert data error", error.localizedDescription)
        }
        return nil
    }

}
