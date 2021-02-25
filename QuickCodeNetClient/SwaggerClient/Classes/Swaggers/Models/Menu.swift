//
// Menu.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Menu: Codable {

    public var name: String?
    public var text: String?
    public var tooltip: String?
    public var actionName: String?
    public var orderNo: Int?
    public var parentName: String?
    public var itemType: String?

    public init(name: String? = nil, text: String? = nil, tooltip: String? = nil, actionName: String? = nil, orderNo: Int? = nil, parentName: String? = nil, itemType: String? = nil) {
        self.name = name
        self.text = text
        self.tooltip = tooltip
        self.actionName = actionName
        self.orderNo = orderNo
        self.parentName = parentName
        self.itemType = itemType
    }


}