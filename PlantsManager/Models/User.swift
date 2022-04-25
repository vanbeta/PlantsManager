//
//  User.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 18.01.2022.
//
//
import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
        User(login: "admin", password: "admin")
    ]
}

