//
// ResponseOfListOfWebApiLogs.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfWebApiLogs: Codable {

    public var message: String?
    public var code: Int?
    public var value: [WebApiLogs]?

    public init(message: String? = nil, code: Int? = nil, value: [WebApiLogs]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
