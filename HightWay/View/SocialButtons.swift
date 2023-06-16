import UIKit

final class SocialButtons: UIButton {
    
    enum ButtonStyle {
        case facebook
        case google
    }
    
    private let style: ButtonStyle
    
    init(withStyle style: ButtonStyle) {
        self.style = style
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 60).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(nil, for: .normal)
        layer.cornerRadius = 30
        layer.borderWidth = 2
        layer.borderColor = CGColor(red: 235/256, green: 175/256, blue: 61/256, alpha: 1)
        self.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        backgroundColor = .white
        
        switch style {
        case .facebook:
            setImage(UIImage(named: "facebook"), for: .normal)
        case .google:
            setImage(UIImage(named: "google"), for: .normal)
        }
    }
    
    @objc func btnClicked (_ sender:UIButton) {
        self.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.alpha = 1.0
        }
    }
}
