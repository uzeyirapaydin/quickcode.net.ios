//
// ResponseOfListOfGtables.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfGtables: Codable {

    public var message: String?
    public var code: Int?
    public var value: [Gtables]?

    public init(message: String? = nil, code: Int? = nil, value: [Gtables]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
