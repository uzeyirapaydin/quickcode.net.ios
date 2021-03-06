//
// TestTableAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class TestTableAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func testTableDelete(body: TestTable, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        testTableDeleteWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/TestTable/Delete
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func testTableDeleteWithRequestBuilder(body: TestTable) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/TestTable/Delete"
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
    open class func testTableGetItem(_id: Int? = nil, completion: @escaping ((_ data: ResponseOfTestTable?,_ error: Error?) -> Void)) {
        testTableGetItemWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/TestTable/GetItem
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : ""
}}]
     - parameter _id: (query)  (optional)

     - returns: RequestBuilder<ResponseOfTestTable> 
     */
    open class func testTableGetItemWithRequestBuilder(_id: Int? = nil) -> RequestBuilder<ResponseOfTestTable> {
        let path = "/api/TestTable/GetItem"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "Id": _id?.encodeToJSON()
        ])


        let requestBuilder: RequestBuilder<ResponseOfTestTable>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func testTableInsert(body: TestTable, completion: @escaping ((_ data: ResponseOfLong?,_ error: Error?) -> Void)) {
        testTableInsertWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/TestTable/Insert
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfLong> 
     */
    open class func testTableInsertWithRequestBuilder(body: TestTable) -> RequestBuilder<ResponseOfLong> {
        let path = "/api/TestTable/Insert"
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
    open class func testTableList(body: ListRequest, completion: @escaping ((_ data: ResponseOfListOfTestTable?,_ error: Error?) -> Void)) {
        testTableListWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/TestTable/List
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : [ {
    "telefon" : "telefon",
    "name" : "name",
    "id" : 6
  }, {
    "telefon" : "telefon",
    "name" : "name",
    "id" : 6
  } ]
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfListOfTestTable> 
     */
    open class func testTableListWithRequestBuilder(body: ListRequest) -> RequestBuilder<ResponseOfListOfTestTable> {
        let path = "/api/TestTable/List"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfListOfTestTable>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func testTableTotalItemCount(completion: @escaping ((_ data: ResponseOfInteger?,_ error: Error?) -> Void)) {
        testTableTotalItemCountWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/TestTable/TotalItemCount
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : 6
}}]

     - returns: RequestBuilder<ResponseOfInteger> 
     */
    open class func testTableTotalItemCountWithRequestBuilder() -> RequestBuilder<ResponseOfInteger> {
        let path = "/api/TestTable/TotalItemCount"
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
    open class func testTableUpdate(body: TestTable, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        testTableUpdateWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/TestTable/Update
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func testTableUpdateWithRequestBuilder(body: TestTable) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/TestTable/Update"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
