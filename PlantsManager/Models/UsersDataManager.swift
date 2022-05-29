//
//  Users.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 22.04.2022.
//

import Foundation
import UIKit
import CoreData

struct User {
    
    
    var email: String
    var name: String
    var password: String
}

class UsersDataManager {

    
    var users: [Users] = []
    
    private var currentUserEmail = Dynamic("")
    private var currentUserKey = "currentUser"
    private let userDefaults = UserDefaults.standard

    
    init() {
        currentUserEmail.value = fetchCurrentUser()
        users = fetchUsers()
    }
    
    var getCurrentUserEmail: Dynamic<String> { self.currentUserEmail }
    
    func addUser(user: User, onResult: (ErrorResult) -> Void ) {
        guard !user.name.isEmpty     else { onResult(ErrorResult.failure(UserError.emptyName));         return }
        guard !user.email.isEmpty    else { onResult(ErrorResult.failure(UserError.emptyEmail));        return }
        guard !user.password.isEmpty else { onResult(ErrorResult.failure(UserError.emptyPassword));     return }
        guard !users.contains(where: { $0.email == user.email })
                                     else { onResult(ErrorResult.failure(UserError.emailAlreadyExist)); return }

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: context) else { return }
   
        let taskObject = Users(entity: entity, insertInto: context)
        taskObject.email = user.email
        taskObject.name = user.name
        taskObject.password = user.password
                
        do {
            try context.save()
            self.users = fetchUsers()
            onResult(ErrorResult.success)
        } catch let error as NSError {
            onResult(ErrorResult.failure(error))
        }
    }
   
    func fetchUsers() -> [Users] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()

        do {
            let data = try context.fetch(fetchRequest)
            return data
        } catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    func updateUsers() {
        self.users = fetchUsers()
    }
    
    func setCurrentUser(currentUser: String) {
        guard let data = try? JSONEncoder().encode(currentUser) else { return }
        userDefaults.set(data, forKey: currentUserKey)
        self.currentUserEmail.value = fetchCurrentUser()
    }
    
    func fetchCurrentUser() -> String {
        guard let data = userDefaults.object(forKey: currentUserKey) as? Data else { return "" }
        guard let model = try? JSONDecoder().decode(String.self, from: data) else { return "" }
        return model
    }
        
    func logOutUser() {
        setCurrentUser(currentUser: "")
    }
}
