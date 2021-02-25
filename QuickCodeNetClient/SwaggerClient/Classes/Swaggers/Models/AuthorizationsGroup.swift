//
// AuthorizationsGroup.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct AuthorizationsGroup: Codable {

    public var _id: Int?
    public var authorizationId: Int?
    public var groupId: Int?
    public var authorizationTypeId: Int?

    public init(_id: Int? = nil, authorizationId: Int? = nil, groupId: Int? = nil, authorizationTypeId: Int? = nil) {
        self._id = _id
        self.authorizationId = authorizationId
        self.groupId = groupId
        self.authorizationTypeId = authorizationTypeId
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case authorizationId
        case groupId
        case authorizationTypeId
    }

}
