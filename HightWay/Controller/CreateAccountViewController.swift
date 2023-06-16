import UIKit

class CreateAccountViewController: UIViewController {
    
    private var passwordHidden: Bool = true
    
    // MARK: - UI Elemetns
    
    private let backgroundImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Onboarding_screen")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private let mainLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Create Account"
        lb.font = UIFont.specialSemiBold30()
        lb.textColor = .specialOrange
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let userNameField : UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
            string: "User Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.specialOrange]
        )
        field.textColor = .specialOrange
        field.font = .specialSemiBold16()
        field.keyboardType = .default
        field.returnKeyType = .done
        field.layer.borderWidth = 2
        field.heightAnchor.constraint(equalToConstant: 60).isActive = true
        field.layer.cornerRadius = 30
        field.layer.borderColor = CGColor(red: 235/256, green: 175/256, blue: 61/256, alpha: 1)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.tintColor = .specialOrange
        return field
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
        field.keyboardType = .emailAddress
        field.returnKeyType = .done
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
        field.returnKeyType = .done
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
        btn.tintColor = .specialOrange
        return btn
    }()
    
    private let fieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var singUpButton = ActionsButtons(withStyle: .onboardingFilled, withText: "Sing Up")
    
    private lazy var facebookButton = SocialButtons(withStyle: .facebook)
    private lazy var googleButton = SocialButtons(withStyle: .google)
    
    private let socialButtonsStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.contentMode = .center
        stack.spacing = 42
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let bottomLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Already got an account?"
        lb.font = .specialSemiBold16()
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var singInButton = ActionsButtons(withStyle: .singUp, withText: "Sing In")
    
    private let bottomStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let mainBottomStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.contentMode = .center
        stack.spacing = 50
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        configureTextFields()
        configureButtons()
    }
    
    // MARK: - Buttons Methods
    
    @objc func eyeButtonTaped() {
        passwordHidden = !passwordHidden
        if passwordHidden {
            fieldEyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordField.isSecureTextEntry = true
        } else {
            passwordField.isSecureTextEntry = false
            fieldEyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    @objc func singInButtonTaped() {
        self.navigationController?.pushViewController(LogiinViewController(), animated: true)
    }
    
    @objc func singUpButtonTaped() {
        
    }
    
    @objc func facebookButtonTaped() {
        
    }
    
    @objc func googleButtonTaped() {
        
    }
    
    // MARK: - Configure Methods
    
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(mainLabel)
        view.addSubview(fieldsStack)
        fieldsStack.addArrangedSubview(userNameField)
        fieldsStack.addArrangedSubview(emailField)
        fieldsStack.addArrangedSubview(passwordField)
        view.addSubview(singUpButton)
        view.addSubview(socialButtonsStack)
        socialButtonsStack.addArrangedSubview(facebookButton)
        socialButtonsStack.addArrangedSubview(googleButton)
        view.addSubview(bottomStack)
        bottomStack.addArrangedSubview(bottomLabel)
        bottomStack.addArrangedSubview(singInButton)
    }
    
    private func configureTextFields() {
        userNameField.delegate = self
        userNameField.setLeftPaddingPoints(43)
        emailField.delegate = self
        emailField.setLeftPaddingPoints(43)
        passwordField.delegate = self
        passwordField.setLeftPaddingPoints(43)
        passwordField.rightView = fieldEyeButton
        passwordField.clearButtonMode = .never
        passwordField.rightViewMode = .always
        passwordField.rightView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureButtons() {
        singInButton.addTarget(self, action: #selector(singInButtonTaped), for: .touchUpInside)
        singUpButton.addTarget(self, action: #selector(singUpButtonTaped), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(facebookButtonTaped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTaped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 163),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),

            fieldsStack.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 58),
            fieldsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            fieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31.5),
            
            singUpButton.topAnchor.constraint(equalTo: fieldsStack.bottomAnchor, constant: 58),
            singUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            singUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31.5),
            
            socialButtonsStack.topAnchor.constraint(equalTo: singUpButton.bottomAnchor, constant: 38),
            socialButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

// MARK: - UITextField Delegate Methods

extension CreateAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.resignFirstResponder()
            textField.endEditing(true)
            return true
        } else {
            textField.placeholder = "Please enter value"
            return false
        }
    }
}
