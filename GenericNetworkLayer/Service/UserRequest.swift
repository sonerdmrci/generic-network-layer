//
//  UserRequest.swift
//  GenericNetworkLayer
//
//  Created by Soner Demirci on 5.01.2024.
//

import Foundation

protocol UserRequestDelegate {
    func getUser(completion: @escaping (Result<[UserModel], NetworkError>) -> Void)
}

final class UserRequest: UserRequestDelegate {
    
    static let shared = UserRequest()
    
    private init() {}
    
    func getUser(completion: @escaping (Result<[UserModel], NetworkError>) -> Void) {
        let endPoint = EndPoint.getUser
        NetworkManager.shared.request(endPoint, completion: completion)
    }
}
