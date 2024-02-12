//
//  ViewController.swift
//  GenericNetworkLayer
//
//  Created by Soner Demirci on 5.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    
    private func getUser(){
        UserRequest.shared.getUser { result in
            switch result {
                
            case .success(let succes):
                print(succes.map({ $0.name}))
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}

