import UIKit

final class ActionsButtons: UIButton {
    
    enum ButtonStyle {
        case onboardingBordered
        case onboardingFilled
        case mainBlack
        case forgotPassword
        case singUp
    }
    
    private let style: ButtonStyle
    private let text: String
    
    init(withStyle style: ButtonStyle, withText text: String) {
        self.style = style
        self.text = text
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        setTitle(text, for: .normal)
        self.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        
        if style != .forgotPassword && style != .singUp {
            layer.cornerRadius = 30
            heightAnchor.constraint(equalToConstant: 60).isActive = true
            titleLabel?.font = .specialSemiBold20()
            titleLabel?.textAlignment = .center
        } else {
            titleLabel?.font = .specialSemiBold16()
            setTitleColor(.specialOrange, for: .normal)
        }
        
        switch style {
        case .onboardingBordered:
            setTitleColor(.specialOrange, for: .normal)
            backgroundColor = .clear
            layer.borderWidth = 2
            layer.borderColor = CGColor(red: 235/256, green: 175/256, blue: 61/256, alpha: 1)
        case .onboardingFilled:
            setTitleColor(.white, for: .normal)
            backgroundColor = .specialOrange
        case .mainBlack:
            setTitleColor(.white, for: .normal)
            backgroundColor = .black
        default: print("error")
        }
    }
    
    @objc func btnClicked (_ sender:UIButton) {
        self.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.alpha = 1.0
        }
    }
}
