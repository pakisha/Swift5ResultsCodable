//
//  DynamicArray.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 5/8/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

enum ListenerToFire {
    case Add
    case Remove
    case Default
}

class DynamicArray<T>: DynamicAsync<[T]> {
    
    // MARK: - typealias
    
    typealias RemoveListener = (Int) -> ()
    typealias AddListener = ((Int)) -> ()
    
    // MARK: - Vars & Lets
    
    var removeListener: RemoveListener?
    var appendListener: AddListener?
    
    var listenerToFire = ListenerToFire.Default
    
    override func fire() {
        if listenerToFire == .Default {
            listener?(value)
        }
        self.listenerToFire = .Default
    }
    
    // MARK: - Public methods
    
    func append(_ element: T) {
        self.listenerToFire = .Add
        self.value.append(contentsOf: [element])
        self.appendListener?(value.count)
    }
    
    func append(_ contentsOf: [T]) {
        self.listenerToFire = .Add
        self.value.append(contentsOf: contentsOf)
        self.appendListener?(contentsOf.count)
    }
    
    func remove(_ at: Int) {
        self.listenerToFire = .Remove
        self.value.remove(at: at)
        self.removeListener?(at)
    }
    
    func bindRemoveListener(_ listener: RemoveListener?) {
        self.removeListener = listener
    }
    
    func bindAppendListener(_ listener: AddListener?) {
        self.appendListener = listener
    }
    
}
