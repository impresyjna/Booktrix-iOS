//
//  ApiRequester.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Alamofire
import JSONCodable

enum ApiResponse<T> {
    case success(T)
    case failure(Error?)
}

struct HTTPError: LocalizedError {
    let message: String
    let code: Int
    
    var localizedDescription: String {
        return message
    }
    
    init(code: Int = 0, message: String = ""){
        self.message = message
        self.code = code
    }
}

struct Adapter: RequestAdapter {
    fileprivate let storage: KeychainStorage
    
    init(keychain: KeychainStorage) {
        self.storage = keychain
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var mutable = urlRequest
        
        if let token = storage.getUser()?.token {
            mutable.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        return mutable
    }
}

final class ApiRequester {
    fileprivate let manager: SessionManager
    
    init(manager: SessionManager = .default) {
        self.manager = manager
        manager.adapter = Adapter(keychain: .init())
    }
    
    func request<T:JSONDecodable>(request: Request, params: RequestParams? = nil, completion: @escaping (ApiResponse<T>) -> ()) {
        manager.request(request.url, method: request.method, parameters: params?.params, encoding: JSONEncoding(), headers: nil)
            .validate(statusCode: 200...422)
            .responseJSON { result in
                guard let object = result.value
                    .flatMap({ $0 as? [String: Any] })
                    .flatMap({ try? T(object: $0) })
                    else {
                        completion(.failure(HTTPError(code: result.response?.statusCode ?? 500)))
                        return
                }
                
                completion(.success(object))
        }
    }
    
    func request<T:JSONDecodable>(request: Request, params: RequestParams? = nil, completion: @escaping (ApiResponse<[T]>) -> ()) {
        manager.request(request.url, method: request.method, parameters: params?.params, encoding: JSONEncoding(), headers: nil)
            .validate()
            .responseJSON { result in
                
                guard let objects = result.value
                    .flatMap({ $0 as? [[String: Any]] })
                    .flatMap({ try? [T](JSONArray: $0) })
                    else {
                        completion(.failure(result.error))
                        return
                }
                
                completion(.success(objects))
        }
    }
    
    func request(request: Request, params: RequestParams? = nil, completion: @escaping (ApiResponse<Void>) -> ()) {
        manager.request(request.url, method: request.method, parameters: params?.params, encoding: JSONEncoding(), headers: nil)
            .validate()
            .responseJSON { result in
                
                if let error = result.error {
                    completion(.failure(error))
                    return
                }
                
                completion(.success(()))
        }
    }
}

