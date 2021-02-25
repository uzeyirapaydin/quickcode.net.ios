//
// ResponseOfCustomer.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfCustomer: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfCustomerValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfCustomerValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}