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
    case nameAlreadyExist
}

extension UserError: LocalizedError {
    
    
    var errorDescription: String? {
        switch self {
        case .emptyEmail:
            return NSLocalizedString("Field email is empty", comment: "")
        case .emptyPassword:
            return NSLocalizedString("Field password is empty", comment: "")
        case .emptyName:
            return NSLocalizedString("Field name is empty", comment: "")
        case .notFoundEmail:
            return NSLocalizedString("email not found", comment: "")
        case .notFoundPassword:
            return NSLocalizedString("Wrong password", comment: "")
        case .nameAlreadyExist:
            return NSLocalizedString("Name already exist, try another name", comment: "")
        }
    }
}
