//
//  Users.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 22.04.2022.
//

import Foundation

struct User: Codable {
    
    let name: String
    let email: String
    let password: String
}

class UsersDataManager {
    
    
    private let userDefaults = UserDefaults.standard
    private let usersKey = "newUserList"
    
    var users: [User] = []
    
    init() {
        self.users = fetchUsers()
    }
        
    func addUser(user: User, onResult: (ErrorResult) -> Void ) {
        guard !user.name.isEmpty     else { onResult(ErrorResult.failure(UserError.emptyName));     return }
        guard !user.email.isEmpty    else { onResult(ErrorResult.failure(UserError.emptyEmail));    return }
        guard !user.password.isEmpty else { onResult(ErrorResult.failure(UserError.emptyPassword)); return }
        
        users.append(user)
        guard let data = try? JSONEncoder().encode(users) else { return }
        userDefaults.set(data, forKey: usersKey)
        users = fetchUsers()
        
        onResult(ErrorResult.success)
    }
    
    func fetchUsers() -> [User] {
        guard let data = userDefaults.object(forKey: usersKey) as? Data else { return [] }
        guard let model = try? JSONDecoder().decode([User].self, from: data) else { return [] }

        return model
    }
}
