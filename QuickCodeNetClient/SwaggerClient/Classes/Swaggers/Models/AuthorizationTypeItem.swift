//
// AuthorizationTypeItem.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct AuthorizationTypeItem: Codable {

    public var authorizationTypeId: Int?
    public var value: Bool?

    public init(authorizationTypeId: Int? = nil, value: Bool? = nil) {
        self.authorizationTypeId = authorizationTypeId
        self.value = value
    }


}