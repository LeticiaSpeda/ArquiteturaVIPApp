import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displaySomething(viewModel: Login.Something.ViewModel)
    func displayError(error: Login.Something.ViewError)
}

class LoginViewController: UIViewController, LoginDisplayLogic, ViewCode {
    
    //MARK: - Properties
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.onEnterTap = { [weak self] userModel in
            if let self {
                self.loginTap(userModel: userModel)
            }
            
            view.onRegisterTap = { [weak self] in
                if let self {
                    self.registerTap()
                }
            }
        }
        return view
    }()
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    func setupStyle() {
        title = "Login"
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func displayError(error: Login.Something.ViewError) {
        let errorMessage = error.error.localizedDescription
        let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default
                                     ))
        self.present(alert, animated: true)
    }
    
    // MARK: View lifecycle
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        doSomething()
    }
    
    func doSomething() {}
    
    func displaySomething(viewModel: Login.Something.ViewModel) {}
    
    func loginTap(userModel: UserModel) {
        let request = Login.Something.Request(userModel: userModel)
        interactor?.doSomething(request: request)
    }
    
    func registerTap() {
        router?.routeToRegister()
    }
}

