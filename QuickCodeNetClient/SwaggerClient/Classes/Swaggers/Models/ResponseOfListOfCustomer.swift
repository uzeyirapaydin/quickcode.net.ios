//
// ResponseOfListOfCustomer.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfCustomer: Codable {

    public var message: String?
    public var code: Int?
    public var value: [Customer]?

    public init(message: String? = nil, code: Int? = nil, value: [Customer]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
