//
//  SwiftPerson.swift
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

import Foundation

@objc class SwiftPerson: NSObject {
    @objc let name: String
    @objc private(set) var age: Int
    
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    @objc func introduce() {
        print("Hi, I'm \(name), a Swift person aged \(age).")
    }
}
