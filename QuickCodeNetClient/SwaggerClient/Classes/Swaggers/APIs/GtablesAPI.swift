//
// GtablesAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class GtablesAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func gtablesDelete(body: Gtables, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        gtablesDeleteWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/Gtables/Delete
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func gtablesDeleteWithRequestBuilder(body: Gtables) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/Gtables/Delete"
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
    open class func gtablesGetItem(_id: Int? = nil, completion: @escaping ((_ data: ResponseOfGtables?,_ error: Error?) -> Void)) {
        gtablesGetItemWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/Gtables/GetItem
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : ""
}}]
     - parameter _id: (query)  (optional)

     - returns: RequestBuilder<ResponseOfGtables> 
     */
    open class func gtablesGetItemWithRequestBuilder(_id: Int? = nil) -> RequestBuilder<ResponseOfGtables> {
        let path = "/api/Gtables/GetItem"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "Id": _id?.encodeToJSON()
        ])


        let requestBuilder: RequestBuilder<ResponseOfGtables>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func gtablesInsert(body: Gtables, completion: @escaping ((_ data: ResponseOfLong?,_ error: Error?) -> Void)) {
        gtablesInsertWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/Gtables/Insert
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfLong> 
     */
    open class func gtablesInsertWithRequestBuilder(body: Gtables) -> RequestBuilder<ResponseOfLong> {
        let path = "/api/Gtables/Insert"
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
    open class func gtablesList(body: ListRequest, completion: @escaping ((_ data: ResponseOfListOfGtables?,_ error: Error?) -> Void)) {
        gtablesListWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/Gtables/List
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : [ {
    "id" : 6,
    "tableName" : "tableName"
  }, {
    "id" : 6,
    "tableName" : "tableName"
  } ]
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfListOfGtables> 
     */
    open class func gtablesListWithRequestBuilder(body: ListRequest) -> RequestBuilder<ResponseOfListOfGtables> {
        let path = "/api/Gtables/List"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfListOfGtables>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func gtablesTotalItemCount(completion: @escaping ((_ data: ResponseOfInteger?,_ error: Error?) -> Void)) {
        gtablesTotalItemCountWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/Gtables/TotalItemCount
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]

     - returns: RequestBuilder<ResponseOfInteger> 
     */
    open class func gtablesTotalItemCountWithRequestBuilder() -> RequestBuilder<ResponseOfInteger> {
        let path = "/api/Gtables/TotalItemCount"
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
    open class func gtablesUpdate(body: Gtables, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        gtablesUpdateWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/Gtables/Update
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func gtablesUpdateWithRequestBuilder(body: Gtables) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/Gtables/Update"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
