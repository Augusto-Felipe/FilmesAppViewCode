//
//  HomeVC.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 10/03/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldsDelegates(delegate: self)
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}
