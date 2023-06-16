import UIKit

class WellcomeViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let backgroundImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Onboarding_screen")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let wellcomeLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Wellcome !"
        lb.font = UIFont.specialSemiBold30()
        lb.textColor = .specialOrange
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var loginButton = ActionsButtons(withStyle: .onboardingBordered, withText: "Login")
    private lazy var createAccButton = ActionsButtons(withStyle: .onboardingFilled, withText: "Create Account")
    
    private let descriptionLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Forem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
        lb.textColor = .white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = .specialMedium16()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let mainContentStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        addTargets()
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Buttons Methods
    
    @objc func loginButtonTaped() {
        self.navigationController?.pushViewController(LogiinViewController(), animated: true)
    }
    
    @objc func createAccButtonTaped() {
        
    }
    
    // MARK: - Configure UI
    
    private func addTargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTaped), for: .touchUpInside)
        createAccButton.addTarget(self, action: #selector(createAccButtonTaped), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(wellcomeLabel)
        view.addSubview(mainContentStack)
        mainContentStack.addArrangedSubview(loginButton)
        mainContentStack.addArrangedSubview(createAccButton)
        mainContentStack.addArrangedSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            wellcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 123),
            wellcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainContentStack.topAnchor.constraint(equalTo: wellcomeLabel.bottomAnchor, constant: 214),
            mainContentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31.5),
            mainContentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31.5),
        ])
    }

}

