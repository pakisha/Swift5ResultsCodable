//
//  ParameterEncoding.swift
//  Helbiz
//
//  Created by Janko Milutinovic on 7/27/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Alamofire

extension String: ParameterEncoding {
    
    // MARK: - Public Methods
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
