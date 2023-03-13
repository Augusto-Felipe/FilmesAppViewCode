//
//  HomeScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 12/03/23.
//

import UIKit

protocol RegisterScreenProtocol:AnyObject {
    func registerButtonAction()
}

class RegisterScreen: UIView {
    
    var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
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
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        validateTextFields()
        configBackground()
        configSuperView()
        configNameTextFieldConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configRegisterButtonConstraints()
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
    
    @objc public func registerButtonPressed() {
        self.delegate?.registerButtonAction()
    }
    
    public func validateTextFields() {
        
        let name: String = nameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            self.registerButton.isEnabled = true
            self.registerButton.setTitleColor(.systemBlue, for: .normal)
        } else {
            self.registerButton.isEnabled = false
        }
    }
    
    
    func configNameTextFieldConstraints() {
        self.nameTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    
    func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.nameTextField.snp.leading)
            make.trailing.equalTo(self.nameTextField.snp.trailing)
            make.height.equalTo(self.nameTextField.snp.height)
        }
    }
    
    
    func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.nameTextField.snp.leading)
            make.trailing.equalTo(self.nameTextField.snp.trailing)
            make.height.equalTo(self.nameTextField.snp.height)
        }
    }
    
    
    func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(40)
            make.leading.equalTo(self.nameTextField.snp.leading)
            make.trailing.equalTo(self.nameTextField.snp.trailing)
            make.height.equalTo(self.nameTextField.snp.height)
        }
    }
}
