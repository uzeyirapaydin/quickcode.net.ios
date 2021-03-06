//
// PortalAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class PortalAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func portalLogin(body: PortalLoginRequest, completion: @escaping ((_ data: ResponseOfPortalLoginResponse?,_ error: Error?) -> Void)) {
        portalLoginWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /api/Portal/Login
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : ""
}}]
     - parameter body: (body)  

     - returns: RequestBuilder<ResponseOfPortalLoginResponse> 
     */
    open class func portalLoginWithRequestBuilder(body: PortalLoginRequest) -> RequestBuilder<ResponseOfPortalLoginResponse> {
        let path = "/api/Portal/Login"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseOfPortalLoginResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**

     - parameter username: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func portalLogout(username: String? = nil, completion: @escaping ((_ data: ResponseOfBoolean?,_ error: Error?) -> Void)) {
        portalLogoutWithRequestBuilder(username: username).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /api/Portal/Logout
     - 

     - examples: [{contentType=application/json, example={
  "code" : 0,
  "message" : "message",
  "value" : true
}}]
     - parameter username: (query)  (optional)

     - returns: RequestBuilder<ResponseOfBoolean> 
     */
    open class func portalLogoutWithRequestBuilder(username: String? = nil) -> RequestBuilder<ResponseOfBoolean> {
        let path = "/api/Portal/Logout"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "username": username
        ])


        let requestBuilder: RequestBuilder<ResponseOfBoolean>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
