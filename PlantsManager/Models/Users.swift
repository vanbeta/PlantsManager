//
//  Users.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 22.04.2022.
//

import Foundation

struct User {
    
    let name: String
    let email: String
    let password: String
}

class Users {
    
    
    var logins: [User] = []
        
    func addUser(name: String, email: String, password: String, onResult: (ErrorResult) -> Void ) {
        guard !name.isEmpty     else { onResult(ErrorResult.failure(UserError.emptyName));     return }
        guard !email.isEmpty    else { onResult(ErrorResult.failure(UserError.emptyEmail));    return }
        guard !password.isEmpty else { onResult(ErrorResult.failure(UserError.emptyPassword)); return }
        logins.append(User(name: name, email: email, password: password))
        onResult(ErrorResult.success)
    }
}
