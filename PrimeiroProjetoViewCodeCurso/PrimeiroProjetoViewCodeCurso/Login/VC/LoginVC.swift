//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 07/03/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    var auth: Auth?
    
    override func loadView() {
        loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegates(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Field validation
        guard let login = self.loginScreen else { return }
        
        let email: String = login.getEmail()
        let password: String = login.getPassword()
        
        if !email.isEmpty && !password.isEmpty {
            login.loginButton.isEnabled = true
        } else {
            login.loginButton.isEnabled = false
        }
        
        // Restore placeholder
        if textField.isEqual(login.emailTextField) {
            if textField.text?.count == 0 {
                login.emailTextField.placeholder = "Digite seu email"
            }
        } else if textField.isEqual(login.passwordTextField) {
            if textField.text?.count == 0 {
                login.passwordTextField.placeholder = "Digite sua senha"
            }
        }
    }
    
    // Delete placeholder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let login = self.loginScreen else { return }
        
        if textField.isEqual(login.emailTextField) {
            login.emailTextField.placeholder = ""
        } else if textField.isEqual(login.passwordTextField) {
            login.passwordTextField.placeholder = ""
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func registerButtonAction() {
        print(#function)
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func loginButtonAction() {
        
        guard let login = self.loginScreen else { return }
        
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            
            if error != nil {
                print("Dados incorretos")
            } else {
                
                if usuario == nil {
                    print("Tivemos um problema inesperado. Tente novamente mais tarde.")
                } else {
                    print("Parabéns, usuário logado com sucesso.")
                }
            }
        })
        
    }
    
}

