//
// ResponseOfListOfResponseCode.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfResponseCode: Codable {

    public var message: String?
    public var code: Int?
    public var value: [ResponseCode]?

    public init(message: String? = nil, code: Int? = nil, value: [ResponseCode]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}