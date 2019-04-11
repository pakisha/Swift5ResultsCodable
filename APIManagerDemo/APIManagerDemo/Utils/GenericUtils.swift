//
//  GenericUtils.swift
//  iOSStyleguide
//
//  Created by Petar on 3/6/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

private let queue = DispatchQueue(label: "concurent-worker", attributes: DispatchQueue.Attributes.concurrent)

infix operator -->

func --> (
    backgroundClosure: @escaping () -> (),
    mainClosure: @escaping () -> ())
{
    queue.async {
        backgroundClosure()
        DispatchQueue.main.async(execute: mainClosure)
    }
}

func --> <R> (
    backgroundClosure: @escaping () -> R,
    mainClosure: @escaping (_ result: R) -> ())
{
    queue.async {
        let result = backgroundClosure()
        DispatchQueue.main.async(execute: {
            mainClosure(result)
        })
    }
}

prefix operator -->

prefix func --> (closure: @escaping ()-> ()) {
    DispatchQueue.main.async {
        closure()
    }
}

extension Int {
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
    
    func times( f: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}
