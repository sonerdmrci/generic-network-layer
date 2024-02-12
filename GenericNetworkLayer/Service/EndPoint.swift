//
//  EndPoint.swift
//  GenericNetworkLayer
//
//  Created by Soner Demirci on 5.01.2024.
//

import Foundation
// https://jsonplaceholder.typicode.com/users

// BaseUrl -> https://jsonplaceholder.typicode.com

// Endpoint -> /users

/*
  1- HTTPMethod (Get, Post, Delete, Patch)
  
  2- EndPoint (BaseURL + Path + headers + request )
  
  3- Network    Error
*/

enum NetworkError: String, Error {
    case unableToComplateError
    case invalidResponse
    case invalidData
    case authError
    case unknownError
    case decodingError
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol EndPointDelegate {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest
}

enum EndPoint{
    case getUser
    case postUser
    case updateUser
    case getAnimal
}

extension EndPoint: EndPointDelegate {
    var baseURL: String {
        "https://jsonplaceholder.typicode.com"
    }
    
    var path: String { //self dedigimizde yukardaki caseleri temsil edecek
        switch self {
        case .getUser:
            return "/users"
        case .postUser:
            return "/postUser"
        case .updateUser:
            return "/updateUser"
        case .getAnimal:
            return "/getAnimal"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAnimal:
            return .get
        case .getUser:
            return .get
        case .postUser:
            return .post
        case .updateUser:
            return .post
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var component = URLComponents(string: baseURL) else { fatalError("BaseURL Error")}
        component.path = path
        guard let url = component.url else { fatalError("URL Error From Component")}
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = header {
            header.forEach { key, value in
                request.setValue(key, forHTTPHeaderField: value)
            }
        }
        return request
    }
    
    
}
