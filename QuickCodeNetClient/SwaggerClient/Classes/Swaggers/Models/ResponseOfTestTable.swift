//
// ResponseOfTestTable.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfTestTable: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfTestTableValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfTestTableValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}