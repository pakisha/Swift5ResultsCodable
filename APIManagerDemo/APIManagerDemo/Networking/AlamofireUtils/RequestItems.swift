//
//  RequestItems.swift
//  Helbiz
//
//  Created by Pavle Pesic on 5/7/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

enum RequestItemsType {
    
    // MARK: Events
    
    case events(_: String)
    
    // MARK: User
    
    case getUser
    case updateUser
    case fail
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
            case .dev: return "https://private-ab878b-mediumsoa.apiary-mock.com/"
            case .production: return "https://private-ab878b-mediumsoa.apiary-mock.com/"
            case .stage: return "https://private-ab878b-mediumsoa.apiary-mock.com/"
        }
    }
    
    var version: String {
        return "/v0_1"
    }
    
    var path: String {
        switch self {
        case .events(_):
            return "event"
        case .getUser:
            return "user"
        case .updateUser:
            return "user"
        case .fail:
            return "fail"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .updateUser:
            return .post
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
}
