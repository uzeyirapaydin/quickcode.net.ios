//
// ManagementTableAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class ManagementTableAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func managementTableDelete(body: ManagementTable, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        managementTableDeleteWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/ManagementTable/Delete
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func managementTableDeleteWithRequestBuilder(body: ManagementTable) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/ManagementTable/Delete"
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
    open class func managementTableGetItem(_id: Int? = nil, completion: @escaping ((_ data: ResponseOfManagementTable?,_ error: Error?) -> Void)) {
        managementTableGetItemWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/ManagementTable/GetItem
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : ""
}}]
     - parameter _id: (query)  (optional)

     - returns: RequestBuilder<ResponseOfManagementTable> 
     */
    open class func managementTableGetItemWithRequestBuilder(_id: Int? = nil) -> RequestBuilder<ResponseOfManagementTable> {
        let path = "/api/ManagementTable/GetItem"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "Id": _id?.encodeToJSON()
        ])


        let requestBuilder: RequestBuilder<ResponseOfManagementTable>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func managementTableInsert(body: ManagementTable, completion: @escaping ((_ data: ResponseOfLong?,_ error: Error?) -> Void)) {
        managementTableInsertWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/ManagementTable/Insert
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfLong> 
     */
    open class func managementTableInsertWithRequestBuilder(body: ManagementTable) -> RequestBuilder<ResponseOfLong> {
        let path = "/api/ManagementTable/Insert"
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
    open class func managementTableList(body: ListRequest, completion: @escaping ((_ data: ResponseOfListOfManagementTable?,_ error: Error?) -> Void)) {
        managementTableListWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/ManagementTable/List
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : [ {
    "name" : "name",
    "id" : 6
  }, {
    "name" : "name",
    "id" : 6
  } ]
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfListOfManagementTable> 
     */
    open class func managementTableListWithRequestBuilder(body: ListRequest) -> RequestBuilder<ResponseOfListOfManagementTable> {
        let path = "/api/ManagementTable/List"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfListOfManagementTable>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func managementTableTotalItemCount(completion: @escaping ((_ data: ResponseOfInteger?,_ error: Error?) -> Void)) {
        managementTableTotalItemCountWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/ManagementTable/TotalItemCount
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]

     - returns: RequestBuilder<ResponseOfInteger> 
     */
    open class func managementTableTotalItemCountWithRequestBuilder() -> RequestBuilder<ResponseOfInteger> {
        let path = "/api/ManagementTable/TotalItemCount"
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
    open class func managementTableUpdate(body: ManagementTable, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        managementTableUpdateWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/ManagementTable/Update
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func managementTableUpdateWithRequestBuilder(body: ManagementTable) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/ManagementTable/Update"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
