//
// ResponseOfListOfAuthorizations.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfAuthorizations: Codable {

    public var message: String?
    public var code: Int?
    public var value: [Authorizations]?

    public init(message: String? = nil, code: Int? = nil, value: [Authorizations]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}