//
//  ApiManagerRetrier.swift
//  Helbiz
//
//  Created by Janko Milutinovic on 12/6/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Foundation
import Alamofire

class APIManagerRetrier: RequestRetrier {
    
    // MARK: - Vars & Lets
    
    var numberOfRetries = 0
    
    // MARK: - Request Retrier methods
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        if (error.localizedDescription == "The operation couldn’t be completed. Software caused connection abort") {
            completion(true, 1.0) // retry after 1 second
            self.numberOfRetries += 1
        } else if let response = request.task?.response as? HTTPURLResponse, response.statusCode >= 500, self.numberOfRetries < 3 {
            completion(true, 1.0) // retry after 1 second
            self.numberOfRetries += 1
        } else {
            completion(false, 0.0) // don't retry
            self.numberOfRetries = 0
        }
    }
    
}
