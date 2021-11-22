//
//  FirebaseDI.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol FirebaseRegisterProtocol {
    func createUser(email: String, password: String, completion: @escaping (Result<String,Error>) -> Void)
    func saveUserData(firstName: String, lastName: String, id: String, completion : @escaping (_ error: Error?) ->Void)
}

class FirebaseDI: FirebaseRegisterProtocol{
    
    let db = Firestore.firestore()
    
    func createUser(email: String, password: String, completion: @escaping (Result<String,Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard error == nil , let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user.uid))
        }
    }
    
    func saveUserData(firstName: String, lastName: String, id: String, completion : @escaping (_ error: Error?) ->Void) {
        db.collection("users").addDocument(data: ["firstName" : firstName , "lastName": lastName , "uid" : id]) { er in
            guard er == nil else {
                completion(er)
                return
            }
            completion(nil)
        }
    }
    
}
