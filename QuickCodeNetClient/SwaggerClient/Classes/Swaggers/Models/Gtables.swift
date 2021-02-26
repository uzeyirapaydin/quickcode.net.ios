//
// Gtables.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Gtables: Codable {

    public var _id: Int?
    public var tableName: String?
    public var headerText: String?
    public var headerInfoText: String?

    public init(_id: Int? = nil, tableName: String? = nil, headerText: String? = nil, headerInfoText: String? = nil) {
        self._id = _id
        self.tableName = tableName
        self.headerText = headerText
        self.headerInfoText = headerInfoText
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case tableName
        case headerText
        case headerInfoText
    }

}
