//
//  HomeScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 12/03/23.
//

import UIKit

class RegisterScreen: UIView {
    
    lazy var nameTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.placeholder = "Digite seu nome"
        tf.borderStyle = .roundedRect
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 20
        tf.backgroundColor = UIColor.init(red: 134/255, green: 93/255, blue: 255/255, alpha: 1.0)
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.placeholder = "Digite seu email"
        tf.borderStyle = .roundedRect
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 20
        tf.backgroundColor = UIColor.init(red: 134/255, green: 93/255, blue: 255/255, alpha: 1.0)
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.placeholder = "Digite sua senha"
        tf.borderStyle = .roundedRect
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 20
        tf.backgroundColor = UIColor.init(red: 134/255, green: 93/255, blue: 255/255, alpha: 1.0)
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBackground() {
        self.backgroundColor = .white
    }
    
    func configSuperView(){
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    func configTextFieldsDelegates(delegate: UITextFieldDelegate) {
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
        ])
    }
}
