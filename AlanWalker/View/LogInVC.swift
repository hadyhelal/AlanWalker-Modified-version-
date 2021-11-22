//
//  LogIn.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var login: UIButton!
    
    private lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 20
        dismissKeyBoard()
        viewModel.emailText.bind { [weak self] mail in
            self?.emailTextField.text = mail
        }
        viewModel.passwordText.bind { [weak self] password in
            self?.passwordTextField.text = password
        }
        viewModel.errorText.bind { [weak self] errorText in
            self?.errorLabel.text  = errorText
            self?.errorLabel.alpha = 1
            
        }
        viewModel.successLogin.bind { [weak self] success in
            if success { self?.showSuccessAlert(text: "LoggedIn successfully!") }
        }
        
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        errorLabel.alpha = 0
        viewModel.emailText.value    = emailTextField.text!
        viewModel.passwordText.value = passwordTextField.text!
        viewModel.loginProcess()
    }
    
    func showSuccessAlert(text: String){
        let alret  = UIAlertController(title: "Success!", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alret.addAction(action)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.present(alret, animated: true, completion: nil)
        }
    }
    
}
