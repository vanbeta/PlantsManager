//
//  LoginViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation

class LoginViewModel {
    
    
    weak var coordinator: AppCoordinator?
    weak var model: UsersDataManager?
    var showError = Dynamic("")
    
    func setModel(model: UsersDataManager) {
        self.model = model
    }
    
    func checkAccessWorker(email: String, password: String, onResult: (ErrorResult) -> Void ) {
        guard let model = model else { return }
        self.model?.updateUsers()
        
        guard !email.isEmpty    else { onResult(ErrorResult.failure(UserError.emptyEmail))    ; return }
        guard !password.isEmpty else { onResult(ErrorResult.failure(UserError.emptyPassword)) ; return }
        
        guard model.users.contains(where: { $0.email == email }) else {
            onResult(ErrorResult.failure(UserError.notFoundEmail))
            return
        }
        guard model.users.first(where: {$0.password == password }) != nil else{
            onResult(ErrorResult.failure(UserError.notFoundPassword))
            return
        }
        onResult(ErrorResult.success)
    }
}

extension LoginViewModel: LoginViewModelDelegate {
    
    
    var getShowError: Dynamic<String> { showError }
    
    func checkAccess(email: String, password: String) {
        checkAccessWorker(email: email, password: password) { errorResult in
            switch errorResult {
            case .success:
                model?.setCurrentUser(currentUser: email)
                coordinator?.showMainScreen()
//                 тут обновить а не в координаторе
            case .failure(let error):
                showError.value = error.localizedDescription
            }
        }
    }
    
    func btnCreareAccountWasPressed() {
        coordinator?.showCreateAccount()
    }
}

