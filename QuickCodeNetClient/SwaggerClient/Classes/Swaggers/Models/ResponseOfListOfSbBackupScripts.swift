//
// ResponseOfListOfSbBackupScripts.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfListOfSbBackupScripts: Codable {

    public var message: String?
    public var code: Int?
    public var value: [SbBackupScripts]?

    public init(message: String? = nil, code: Int? = nil, value: [SbBackupScripts]? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
