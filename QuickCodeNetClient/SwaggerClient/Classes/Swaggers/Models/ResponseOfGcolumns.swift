//
// ResponseOfGcolumns.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfGcolumns: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfGcolumnsValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfGcolumnsValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}