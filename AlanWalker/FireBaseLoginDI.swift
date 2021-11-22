//
//  FireBaseLoginDI.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol FireBaseLoginProtocol {
    func logInUser(email: String, password: String , completion: @escaping (Result<AuthDataResult,Error>) -> Void )
}

class FireBaseLoginDI: FireBaseLoginProtocol {
    
    func logInUser(email: String, password: String , completion: @escaping (Result<AuthDataResult,Error>) -> Void ) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let result = result else {
                return
            }
            completion(.success(result))
        }
    }
}
