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
    
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldsDelegates(delegate: self)
        registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let register = self.registerScreen else { return }
        
        if textField.isEqual(register.emailTextField) {
            register.emailTextField.placeholder = ""
        } else if textField.isEqual(register.passwordTextField) {
            register.passwordTextField.placeholder = ""
        } else if textField.isEqual(register.nameTextField) {
            register.nameTextField.placeholder = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let register = self.registerScreen else { return }
        
        if textField.isEqual(register.nameTextField) {
            if textField.text?.count == 0 {
                register.nameTextField.placeholder = "Digite seu nome"
            }
        } else if textField.isEqual(register.emailTextField) {
            if textField.text?.count == 0 {
                register.emailTextField.placeholder = "Digite seu email"
            }
        } else if textField.isEqual(register.passwordTextField) {
            if textField.text?.count == 0 {
                register.passwordTextField.placeholder = "Digite sua senha"
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
        
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { sucess, error in
            
            if error != nil {
                self.alert?.createAlert(titulo: "Erro!", mensagem: "Verifique as informações preenchidas.")
            } else {
                self.alert?.createAlert(titulo: "Parabéns!", mensagem: "Usuário cadastrado com sucesso.")
            }
        })
    }
}
