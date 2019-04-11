//
//  EndPointType.swift
//  Helbiz
//
//  Created by Pavle Pesic on 5/6/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Alamofire

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}
