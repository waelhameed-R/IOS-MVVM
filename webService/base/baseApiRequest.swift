//
//  baseApiRequest.swift
//  app
//
//  Created by wael hameed on 2/10/22.
//

import UIKit
import Foundation
import Alamofire

// MARK:- HTTP HEADERS
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType    = "Content-Type"
    case acceptType     = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

// MARK:- base Object
public class BaseObject:Codable{}

// MARK:- base request
public protocol BaseApiRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var requestBodyObject: BaseObject?{ get }
    var data:Data? {get}
    var requestPath: String {get}
    func request() -> URLRequest
}

// MARK:- request method
public enum RequestHttpMethod{
    case Get
    case Post
    case Put
    case Delete
}

// MARK:- Environment
public enum Environment{
    case Prod
    case Dev
    case UAT
}

extension BaseApiRequest{
    // MARK:- current Environment
    var enviroment: Environment {
        return Environment.Dev
    }
    
    // MARK:- request
    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        
        // MARK:- ADD HEADER TOKEN
        if let token = UIApplication.getToken() {
            request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        }

        let lng = UserDefaults.standard.value(forKey: "local") as? String ?? ""
        request.setValue(lng, forHTTPHeaderField: "x-localization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if(requestBodyObject != nil){
                let jsonEncoder = JSONEncoder()
                do {
                    request.httpBody = try jsonEncoder.encode(requestBodyObject)
                } catch {
                    print(error)
                }
            }
            break
        case .Put:
            
            if data != nil {
                request.httpMethod = "PUT"
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
                request.httpBody = data

                break
            }else{
                request.httpMethod = "PUT"
                break
            }
            
        case .Delete:
            request.httpMethod = "Delete"
            break
            
        case .none:
            print("non")
        
        }
        return request
    }
    
    // MARK:- base URL
    var baseUrl: String {
        switch enviroment {
        case .Prod:
            return "url"
        case .Dev:
            return "url"
        default:
            return "url"
        }
    }
}
