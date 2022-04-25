//
//  Users.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 22.04.2022.
//

import Foundation

struct User {
    
    
    let login: String?
    let password: String?
}

class Users {
    
    
    var logins: [User] = []
        
    func addUser(name: String, password: String) {
        logins.append(User(login: name, password: password))
    }
}
