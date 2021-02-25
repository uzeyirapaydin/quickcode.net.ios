//
// WebApiLogs.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct WebApiLogs: Codable {

    public var logId: Int?
    public var hostIp: String?
    public var hostName: String?
    public var clientIp: String?
    public var controllerName: String?
    public var actionName: String?
    public var requestData: String?
    public var responseData: String?
    public var httpStatusCode: String?
    public var elapsedTime: Int64?
    public var requestDatetime: String?
    public var logDatetime: Date?
    public var deviceId: String?
    public var deviceOs: String?
    public var deviceVersion: String?
    public var firebaseId: String?
    public var versionCode: String?

    public init(logId: Int? = nil, hostIp: String? = nil, hostName: String? = nil, clientIp: String? = nil, controllerName: String? = nil, actionName: String? = nil, requestData: String? = nil, responseData: String? = nil, httpStatusCode: String? = nil, elapsedTime: Int64? = nil, requestDatetime: String? = nil, logDatetime: Date? = nil, deviceId: String? = nil, deviceOs: String? = nil, deviceVersion: String? = nil, firebaseId: String? = nil, versionCode: String? = nil) {
        self.logId = logId
        self.hostIp = hostIp
        self.hostName = hostName
        self.clientIp = clientIp
        self.controllerName = controllerName
        self.actionName = actionName
        self.requestData = requestData
        self.responseData = responseData
        self.httpStatusCode = httpStatusCode
        self.elapsedTime = elapsedTime
        self.requestDatetime = requestDatetime
        self.logDatetime = logDatetime
        self.deviceId = deviceId
        self.deviceOs = deviceOs
        self.deviceVersion = deviceVersion
        self.firebaseId = firebaseId
        self.versionCode = versionCode
    }


}
