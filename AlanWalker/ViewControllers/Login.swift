//
//  Login.swift
//  AlanWalker
//
//  Created by Hady on 5/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth

class Login: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.layer.cornerRadius = 20
        
    }
    
    @IBOutlet weak var login: UIButton!
    
    @IBAction func logIn(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.showError(error!.localizedDescription)
                }
                else{
                    //verfication to the VCs that this user online to play Youtbe videos
                    Constants.isOnline = true
                    self.transationToVC()
                }
            }
        }
    }
    
    
    func showError(_ message : String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    func validateFields() -> String? {
        
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields!"
        }
        
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            return "please write strong password with at least 8 characters and hold out a special character and numbers!"
        }
        
        return nil
    }
    func transationToVC () {
        let vcDestination = storyboard?.instantiateViewController(identifier: Constants.Storyboard.albumListVC) as! AlbumList
        
        view.window?.rootViewController = vcDestination
        view.window?.becomeKey()
        
    }
    
    
}
