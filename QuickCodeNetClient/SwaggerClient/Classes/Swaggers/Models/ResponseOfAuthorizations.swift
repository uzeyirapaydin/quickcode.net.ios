//
// ResponseOfAuthorizations.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfAuthorizations: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfAuthorizationsValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfAuthorizationsValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
