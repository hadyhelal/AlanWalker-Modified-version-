//
//  Register.swift
//  AlanWalker
//
//  Created by Hady on 5/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class Register: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register.layer.cornerRadius = 20
    }
    
    @IBOutlet weak var register: UIButton!

    @IBAction func register(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            showError(error!)
            print("---------------Not Nil;------------")
        }
        else {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.showError(error!.localizedDescription)
                }
                else {
                    
                    let dp = Firestore.firestore()
                    dp.collection("users").addDocument(data: ["firstName" : firstName , "lastName": lastName , "uid" : result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError(error!.localizedDescription)
                        }
                        else{
                            Constants.isOnline = true
                            self.transationToVC()
                        }
                    }
                }
            }
        }
    }
    
    func showError(_ message : String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields!"
        }
        
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            return "please write strong password with at least 8 characters and hold out a special character and numbers!"
        }
        
        return nil
    }
    
    func transationToVC () {
        let vcDestination = storyboard?.instantiateViewController(identifier: Constants.Storyboard.retisterVC) as! NewComers
        
        self.view.window?.rootViewController = vcDestination
        self.view.window?.makeKeyAndVisible()
        
    }
}
