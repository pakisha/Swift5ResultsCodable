//
//  APIDemoViewModel.swift
//  APIManagerDemo
//
//  Created by Pavle Pesic on 4/11/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit
import Alamofire

protocol APIDemoViewModelProtocol {
    var alertMessage: Dynamic<AlertMessage> { get set }
    var isLoaderHidden: Dynamic<Bool> { get set }
    var user: Dynamic<APIDemo.User?> { get set }
    
    func getUser()
    func failTest()
}

class APIDemoViewModel: NSObject, APIDemoViewModelProtocol {
    
    // MARK: - APIDemoViewModelProtocol
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    var user: Dynamic<APIDemo.User?> = Dynamic(nil)
    
    // MARK: - Vars & Lets
    
    private let apiManager = APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier())
    
    // MARK: - Public methods
    
    func getUser() {
        self.isLoaderHidden.value = false
        self.apiManager.call(type: RequestItemsType.getUser) { (res: Swift.Result<APIDemo.User, AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let user):
                self.user.value = user
                break
            case .failure(let message):
                self.alertMessage.value = message
                break
            }
        }
    }
    
    func failTest() {
        self.isLoaderHidden.value = false
        self.apiManager.call(type: RequestItemsType.fail) { (res: Swift.Result<APIDemo.User, AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let user):
                self.user.value = user
                break
            case .failure(let message):
                self.alertMessage.value = message
                break
            }
        }
        
    }
    
    // MARK: - Init
    
    override init() {
        super.init()
    }
    
}
