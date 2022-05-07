//
//  Dynamic.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 19.01.2022.
//  Only for Int, String and Array

import Foundation

class Dynamic<T> {


    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        if count != 0 { listener?(value) }
    }
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    var count: Int {
        if let val = value as? Int {
            return val
        }
        if let str = value as? String {
            return str.count
        }
        if let arr = value as? [AnyObject] {
            return arr.count
        }
        return 0
    }
}
