//
//  UserError.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 26.04.2022.
//

import Foundation

enum ErrorResult {
    
    
    case success
    case failure(Error)
}

enum UserError {
    
    
    case emptyEmail
    case emptyPassword
    case emptyName
    case notFoundEmail
    case notFoundPassword
}

extension UserError: LocalizedError {
    
    
    var errorDescription: String? {
        switch self {
        case .emptyEmail:
            return NSLocalizedString("Заполните поле email", comment: "")
        case .emptyPassword:
            return NSLocalizedString("Заполните поле password", comment: "")
        case .emptyName:
            return NSLocalizedString("Заполните поле name", comment: "")
        case .notFoundEmail:
            return NSLocalizedString("email не найден", comment: "")
        case .notFoundPassword:
            return NSLocalizedString("Неправильный пароль", comment: "")
        }
    }
}
