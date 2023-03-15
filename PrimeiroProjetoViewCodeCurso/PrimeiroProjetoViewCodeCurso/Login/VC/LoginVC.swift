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
        print(#function)
        
        // Field validation
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            loginScreen?.loginButton.isEnabled = true
        } else {
            loginScreen?.loginButton.isEnabled = false
        }
        
        // Restore placeholder
        if textField.isEqual(loginScreen?.emailTextField) {
            if textField.text?.count == 0 {
                loginScreen?.emailTextField.placeholder = "Digite seu email"
            }
        } else if textField.isEqual(loginScreen?.passwordTextField) {
            if textField.text?.count == 0 {
                loginScreen?.passwordTextField.placeholder = "Digite sua senha"
            }
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(loginScreen?.emailTextField) {
            loginScreen?.emailTextField.placeholder = ""
        } else if textField.isEqual(loginScreen?.passwordTextField) {
            loginScreen?.passwordTextField.placeholder = ""
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

