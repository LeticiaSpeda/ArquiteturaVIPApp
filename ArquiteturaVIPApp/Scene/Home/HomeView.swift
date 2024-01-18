import UIKit

final class HomeView: UIView, ViewCode {
    //MARK: - Properts
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem Vindo ao App Login VIP"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.enableViewCode()
        return label
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Helpers
    func setupHierarchy() {
        addSubview(welcomeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
