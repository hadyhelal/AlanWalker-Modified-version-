//
//  RegisterViewmodel.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class RegisterViewmodel {
    let firstnameText = Box("")
    let lastnameText  = Box("")
    let emailText     = Box("")
    let passwordText  = Box("")
    let errorText     = Box("")
    let successAlert  = Box(false)
    let db: FirebaseRegisterProtocol
    
    init( db: FirebaseRegisterProtocol = FirebaseDI() ) {
        self.db = db
    }
    
    func regiserationProcess() {
        let error = validateFields()
        guard error == nil else {
            errorText.value = error!
            return
        }
        
        let firstName = firstnameText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName  = lastnameText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        let email     = emailText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        let password  = passwordText.value.trimmingCharacters(in: .whitespacesAndNewlines)
        
        db.createUser(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let id):
                self.db.saveUserData(firstName: firstName, lastName: lastName, id: id) { [weak self] error in
                    guard let self = self else { return }
                    guard error == nil else {
                        self.errorText.value = error!.localizedDescription
                        return
                    }
                    self.successAlert.value = true
                }
            case .failure(let error):
                self.errorText.value = error.localizedDescription
            }
        }
        

    }
    
    
    private func validateFields() -> String? {
        if firstnameText.value.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameText.value.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailText.value.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordText.value.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields!"
        }
        
        return nil
    }
}
