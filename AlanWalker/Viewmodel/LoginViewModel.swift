//
//  LoginViewModel.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseAuth

class LoginViewModel {
    let emailText    = Box("")
    let passwordText = Box("")
    let errorText    = Box("")
    let successLogin = Box(false)
    let db: FireBaseLoginProtocol
    
    init( db: FireBaseLoginProtocol = FireBaseLoginDI()) {
        self.db = db
    }
    
    func loginProcess(){
        let error = validateFields()
        guard error == nil else {
            errorText.value = error!
            return
        }
        let email    = emailText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        db.logInUser(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.successLogin.value = true
            case .failure(let error):
                self.errorText.value = error.localizedDescription
            }
        }
    }
    
    private func validateFields() -> String? {
        if  emailText.value.trimmingCharacters(in: .whitespacesAndNewlines)    == "" ||
            passwordText.value.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            return "Please fill in all fields!"
        }
        return nil
    }
    
}
