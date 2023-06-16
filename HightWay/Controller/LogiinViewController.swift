

import UIKit

class LogiinViewController: UIViewController {
    
    private var passwordHidden: Bool = true
    
    // MARK: - UI Elements
    
    private let backgroundImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Onboarding_screen")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let loginLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Login"
        lb.font = UIFont.specialSemiBold30()
        lb.textColor = .specialOrange
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let emailField : UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.specialOrange]
        )
        field.textColor = .specialOrange
        field.font = .specialSemiBold16()
        field.layer.borderWidth = 2
        field.heightAnchor.constraint(equalToConstant: 60).isActive = true
        field.layer.cornerRadius = 30
        field.layer.borderColor = CGColor(red: 235/256, green: 175/256, blue: 61/256, alpha: 1)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.tintColor = .specialOrange
        
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.specialOrange]
        )
        field.textColor = .specialOrange
        field.font = .specialSemiBold16()
        field.isSecureTextEntry = true
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 30
        field.heightAnchor.constraint(equalToConstant: 60).isActive = true
        field.layer.borderColor = CGColor(red: 235/256, green: 175/256, blue: 61/256, alpha: 1)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var fieldEyeButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.addTarget(self, action: #selector(eyeButtonTaped), for: .touchUpInside)
        return btn
    }()
    
    private let fieldsStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var loginButton = ActionsButtons(withStyle: .onboardingFilled, withText: "Login")
    private lazy var forgotPasswordButton = ActionsButtons(withStyle: .forgotPassword, withText: "Forgot Password")
    
    private let buttonsStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var facebookButton = SocialButtons(withStyle: .facebook)
    private lazy var googleButton = SocialButtons(withStyle: .google)
    
    private let socialButtonsStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 42
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let bottomLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Don’t have an account?"
        lb.font = .specialSemiBold16()
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var singUpButton = ActionsButtons(withStyle: .singUp, withText: "Sing Up")
    
    private let bottomStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureTextFields()
        configureButtonsMethods()
        setupConstraints()
        emailField.setLeftPaddingPoints(43.5)
        passwordField.setLeftPaddingPoints(43.5)
    }

    
    // MARK: - Buttons Methods
    
    @objc func eyeButtonTaped() {
        passwordHidden = !passwordHidden
        if passwordHidden {
            passwordField.isSecureTextEntry = true
        } else {
            passwordField.isSecureTextEntry = false
        }
    }
    
    @objc func loginButtonTaped() {
        
    }
    
    @objc func forgotPasswordButtonTaped() {
        
    }
    
    @objc func facebookButtonTaped() {
        
    }
    
    @objc func googleButtonTaped() {
        
    }
    
    // MARK: - Configure Methods
    
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(loginLabel)
        view.addSubview(fieldsStack)
        fieldsStack.addArrangedSubview(emailField)
        fieldsStack.addArrangedSubview(passwordField)
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(loginButton)
        buttonsStack.addArrangedSubview(forgotPasswordButton)
        view.addSubview(socialButtonsStack)
        socialButtonsStack.addArrangedSubview(facebookButton)
        socialButtonsStack.addArrangedSubview(googleButton)
        view.addSubview(bottomStack)
        bottomStack.addArrangedSubview(bottomLabel)
        bottomStack.addArrangedSubview(singUpButton)
    }
    
    private func configureTextFields() {
        emailField.delegate = self
        passwordField.delegate = self
        passwordField.rightView = fieldEyeButton
    }
    
    private func configureButtonsMethods() {
        loginButton.addTarget(self, action: #selector(loginButtonTaped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTaped), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(facebookButtonTaped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTaped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 163),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            
            fieldsStack.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 102),
            fieldsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            fieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31.5),
            
            buttonsStack.topAnchor.constraint(equalTo: fieldsStack.bottomAnchor, constant: 80),
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31.5),
            
            socialButtonsStack.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 30),
            socialButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

// MARK: - TextField Delegate

extension LogiinViewController: UITextFieldDelegate {
    
}
