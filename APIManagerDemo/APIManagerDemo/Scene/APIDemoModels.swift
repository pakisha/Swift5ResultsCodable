//
//  APIDemoModels.swift
//  APIManagerDemo
//
//  Created by Pavle Pesic on 4/11/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

enum APIDemo {
    
    struct User: Codable {
        let fullName: String
        let email: String
        let isPrimeUser: Bool
        let paymentMethods: [String]
    }
    
}
