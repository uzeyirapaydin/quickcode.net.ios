//
// ResponseOfListOfTestTable.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfTestTable: Codable {

    public var message: String?
    public var code: Int?
    public var value: [TestTable]?

    public init(message: String? = nil, code: Int? = nil, value: [TestTable]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
