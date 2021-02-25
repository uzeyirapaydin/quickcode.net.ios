//
// AuthorizationsGroupAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class AuthorizationsGroupAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupDelete(body: AuthorizationsGroup, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        authorizationsGroupDeleteWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/AuthorizationsGroup/Delete
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func authorizationsGroupDeleteWithRequestBuilder(body: AuthorizationsGroup) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/AuthorizationsGroup/Delete"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter _id: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupGetItem(_id: Int? = nil, completion: @escaping ((_ data: ResponseOfAuthorizationsGroup?,_ error: Error?) -> Void)) {
        authorizationsGroupGetItemWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/AuthorizationsGroup/GetItem
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : ""
}}]
     - parameter _id: (query)  (optional)

     - returns: RequestBuilder<ResponseOfAuthorizationsGroup> 
     */
    open class func authorizationsGroupGetItemWithRequestBuilder(_id: Int? = nil) -> RequestBuilder<ResponseOfAuthorizationsGroup> {
        let path = "/api/AuthorizationsGroup/GetItem"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "Id": _id?.encodeToJSON()
        ])


        let requestBuilder: RequestBuilder<ResponseOfAuthorizationsGroup>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupInsert(body: AuthorizationsGroup, completion: @escaping ((_ data: ResponseOfLong?,_ error: Error?) -> Void)) {
        authorizationsGroupInsertWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/AuthorizationsGroup/Insert
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfLong> 
     */
    open class func authorizationsGroupInsertWithRequestBuilder(body: AuthorizationsGroup) -> RequestBuilder<ResponseOfLong> {
        let path = "/api/AuthorizationsGroup/Insert"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfLong>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupList(body: ListRequest, completion: @escaping ((_ data: ResponseOfListOfAuthorizationsGroup?,_ error: Error?) -> Void)) {
        authorizationsGroupListWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/AuthorizationsGroup/List
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : [ {
    "authorizationTypeId" : 5,
    "authorizationId" : 1,
    "groupId" : 5,
    "id" : 6
  }, {
    "authorizationTypeId" : 5,
    "authorizationId" : 1,
    "groupId" : 5,
    "id" : 6
  } ]
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfListOfAuthorizationsGroup> 
     */
    open class func authorizationsGroupListWithRequestBuilder(body: ListRequest) -> RequestBuilder<ResponseOfListOfAuthorizationsGroup> {
        let path = "/api/AuthorizationsGroup/List"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfListOfAuthorizationsGroup>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupTotalItemCount(completion: @escaping ((_ data: ResponseOfInteger?,_ error: Error?) -> Void)) {
        authorizationsGroupTotalItemCountWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/AuthorizationsGroup/TotalItemCount
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]

     - returns: RequestBuilder<ResponseOfInteger> 
     */
    open class func authorizationsGroupTotalItemCountWithRequestBuilder() -> RequestBuilder<ResponseOfInteger> {
        let path = "/api/AuthorizationsGroup/TotalItemCount"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfInteger>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authorizationsGroupUpdate(body: AuthorizationsGroup, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        authorizationsGroupUpdateWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/AuthorizationsGroup/Update
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func authorizationsGroupUpdateWithRequestBuilder(body: AuthorizationsGroup) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/AuthorizationsGroup/Update"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}