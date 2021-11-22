//
//  RegisterVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class RegisterVC: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    var didSuccessRegister = false
    lazy var viewModel: RegisterViewmodel = {
        return RegisterViewmodel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        dismissKeyBoard()
        viewModel.successAlert.bind { [weak self] success in
            if success { self?.showSuccessAlert(text: "You have been registerd successfully")}
        }
        viewModel.firstnameText.bind { [weak self] firstName in
            self?.firstNameTextField.text = firstName
        }
        viewModel.lastnameText.bind { [weak self] lastName in
            self?.lastNameTextField.text = lastName
        }
        viewModel.emailText.bind { [weak self] email in
            self?.emailTextField.text = email
        }
        viewModel.passwordText.bind { [weak self] password in
            self?.passwordTextField.text = password
        }
        viewModel.errorText.bind { [weak self] errorText in
            self?.errorLabel.text  = errorText
            self?.errorLabel.alpha = 1
        }
    }
    
    func configureVC(){
        registerBtn.layer.cornerRadius = 20
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func register(_ sender: Any) {
        errorLabel.alpha = 0
        viewModel.firstnameText.value = firstNameTextField.text!
        viewModel.lastnameText.value  = lastNameTextField.text!
        viewModel.emailText.value     = emailTextField.text!
        viewModel.passwordText.value  = passwordTextField.text!
        viewModel.regiserationProcess()
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
