//
// ResponseOfSbBackupScripts.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseOfSbBackupScripts: Codable {

    public var message: String?
    public var code: Int?
    public var value: OneOfResponseOfSbBackupScriptsValue?

    public init(message: String? = nil, code: Int? = nil, value: OneOfResponseOfSbBackupScriptsValue? = nil) {
        self.message = message
        self.code = code
        self.value = value
    }


}
