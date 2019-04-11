//
//  AlertMessage.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/19/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

class AlertMessage: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}
