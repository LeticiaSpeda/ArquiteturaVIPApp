import UIKit

final class RegisterView: UIView {
    
    //MARK: - Closures
    var onRegisterTap: ((_ email: String, _ passwdord: String) -> Void)?
    
    //MARK: - Properts
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.enableViewCode()
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "informe seu email de registro",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.6)]
        )
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 12, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.enableViewCode()
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.enableViewCode()
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "informe sua senha de registro",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.6)]
        )
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 12, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        textField.enableViewCode()
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.4)
        button.enableViewCode()
        button.addTarget(self, action: #selector(openButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.4)
        button.enableViewCode()
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Actions
    @objc func openButtonTap() {}
    
    @objc func registerButtonTap() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            let userModel = UserModel(email: email, password: password)
            self.onRegisterTap?(email, password)
        }
    }
    
    //MARK: - Helpers
    func setupHierarchy() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(registerButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            setupEmailLabelConstraints() +
            setupEmailTextFieldConstraints() +
            setupPasswordLabelConstraints() +
            setupPasswordTextFieldConstraints() +
            setupEnterButtonConstraints() +
            setupRegisterButtonConstraints()
        )
    }
    
    private func setupEmailLabelConstraints() -> [NSLayoutConstraint] {
        [
            emailLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 40
            ),
            emailLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            emailLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -12),
        ]
    }
    
    private func setupPasswordLabelConstraints() -> [NSLayoutConstraint] {
        [
            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: 36
            ),
            passwordLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            passwordLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -12),
        ]
    }
    
    
    private func setupEmailTextFieldConstraints() -> [NSLayoutConstraint] {
        [
            emailTextField.topAnchor.constraint(
                equalTo: emailLabel.bottomAnchor,
                constant: 12
            ),
            emailTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -12),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ]
    }
    
    private func setupPasswordTextFieldConstraints() -> [NSLayoutConstraint] {
        [
            passwordTextField.topAnchor.constraint(
                equalTo: passwordLabel.bottomAnchor,
                constant: 12
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -12),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        ]
    }
    
    private func setupEnterButtonConstraints() -> [NSLayoutConstraint] {
        [
            enterButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: 40
            ),
            enterButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            enterButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            )
        ]
    }
    
    private func setupRegisterButtonConstraints() -> [NSLayoutConstraint] {
        [
            registerButton.topAnchor.constraint(
                equalTo: enterButton.bottomAnchor,
                constant: 10
            ),
            registerButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            registerButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            )
        ]
    }
    
    func setupStyle() {
        backgroundColor = .systemMint
    }
    
}
