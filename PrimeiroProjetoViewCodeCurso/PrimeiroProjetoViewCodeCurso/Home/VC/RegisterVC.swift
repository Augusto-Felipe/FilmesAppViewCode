//
//  HomeVC.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 10/03/23.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldsDelegates(delegate: self)
        registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.isEqual(registerScreen?.emailTextField) {
            registerScreen?.emailTextField.placeholder = ""
        } else if textField.isEqual(registerScreen?.passwordTextField) {
            registerScreen?.passwordTextField.placeholder = ""
        } else if textField.isEqual(registerScreen?.nameTextField) {
            registerScreen?.nameTextField.placeholder = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField.isEqual(registerScreen?.nameTextField) {
            if textField.text?.count == 0 {
                registerScreen?.nameTextField.placeholder = "Digite seu nome"
            }
        } else if textField.isEqual(registerScreen?.emailTextField) {
            if textField.text?.count == 0 {
                registerScreen?.emailTextField.placeholder = "Digite seu email"
            }
        } else if textField.isEqual(registerScreen?.passwordTextField) {
            if textField.text?.count == 0 {
                registerScreen?.passwordTextField.placeholder = "Digite sua senha"
            }
        }
        
        registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}


extension RegisterVC: RegisterScreenProtocol {
    
    func registerButtonAction() {
        
        let email: String = registerScreen?.emailTextField.text ?? ""
        let password: String = registerScreen?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: password, completion: { sucess, error in
            
            if error != nil {
                print(error!)
            } else {
                print("Cadastrado com sucesso.")
            }
        })
    }
}
