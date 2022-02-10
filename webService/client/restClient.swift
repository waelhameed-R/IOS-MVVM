//
//  restClient.swift
//  app
//
//  Created by wael hameed on 2/10/22.
//

import Foundation
import Alamofire
import CryptoKit
import CommonCrypto

//MARK: - Session Manager -
class s {
    static func returnSession() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 400
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration)
    }
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}


// MARK:- API Call
public protocol IServiceHandler {
    /// ....
}

public class RestClient: IServiceHandler {
   
    static let sharedInstance:RestClient = RestClient.init()
    
    private static var alamofireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let alamofireManager = Session(configuration: configuration)
        return alamofireManager
    }()
    
    private init() {}
    
    private func sendRequest<T:Codable>(_ request:BaseApiRequest,_ type :T.Type ,successHandler:@escaping(T)->(),failHandler:@escaping(String)->()){
        
        URLCache.shared.removeAllCachedResponses()
        
        RestClient.alamofireManager?.request(request.request()).responseDecodable  { (response:AFDataResponse<T>)  in
            switch response.result {
                case .success(let responseEventList):
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        successHandler(responseEventList)
                    }
            case .failure( _):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    if let data = response.data {
                        let json = String(data: data, encoding: String.Encoding.utf8)
                        failHandler(json ?? "something wrong")
                    }else{
                        failHandler("errorNetowrk")
                    }
                }
            }
        }
    }
}
