//
// ResponseOfGcolumnTypes.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfGcolumnTypes: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfGcolumnTypesValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfGcolumnTypesValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
