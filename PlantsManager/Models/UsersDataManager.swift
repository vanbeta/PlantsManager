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
    
    private var currentUser = ""
    private var currentUserKey = "currentUser"
    private let userDefaults = UserDefaults.standard

    
    init() {
        self.currentUser = fetchCurrentUser()
    }
        // переписать тут добавление юзера
    
    func addUser(user: User, onResult: (ErrorResult) -> Void ) {
        guard !user.name.isEmpty     else { onResult(ErrorResult.failure(UserError.emptyName));       return }
        guard !user.email.isEmpty    else { onResult(ErrorResult.failure(UserError.emptyEmail));      return }
        guard !user.password.isEmpty else { onResult(ErrorResult.failure(UserError.emptyPassword));   return }
        guard !users.contains(where: { $0.name == user.name })
                                     else {onResult(ErrorResult.failure(UserError.nameAlreadyExist)); return }

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
    
//    func removeUser() {
//
//        // удалить все
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
//        if let users = try? context.fetch(fetchRequest) {
//            for user in users {
//                context.delete(user)
//            }
//        }
//
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        print(fetchUsers())
//
//    }
    
    func setCurrentUser(currentUser: String) {
        guard let data = try? JSONEncoder().encode(currentUser) else { return }
        userDefaults.set(data, forKey: currentUserKey)
        self.currentUser = fetchCurrentUser()
    }
    
    func fetchCurrentUser() -> String {
        guard let data = userDefaults.object(forKey: currentUserKey) as? Data else { return "" }
        guard let model = try? JSONDecoder().decode(String.self, from: data) else { return "" }
        return model
    }
    
    func getCurrentUser() -> String{
        return currentUser
    }
    
    func logOutUser() {
        setCurrentUser(currentUser: "")
    }
}
