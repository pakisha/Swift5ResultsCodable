//
//  DynamicAsync.swift
//  EncoreJets
//
//  Created by Pavle Pesic on 5/23/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Foundation

class DynamicAsync<T>: Dynamic<T> {
    
    // MARK: - Ovverides
    
    override func fire() {
        -->{ self.listener?(self.value) }
    }
    
    // MARK: - Initialization
    
    override init(_ v: T) {
        super.init(v)
    }
}
