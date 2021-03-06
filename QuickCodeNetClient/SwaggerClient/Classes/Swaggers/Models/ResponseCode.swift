//
// ResponseCode.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseCode: Codable {

    public var code: Int?
    public var message: String?
    public var messageDetail: String?

    public init(code: Int? = nil, message: String? = nil, messageDetail: String? = nil) {
        self.code = code
        self.message = message
        self.messageDetail = messageDetail
    }


}
