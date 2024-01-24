import UIKit

protocol RegisterDisplayLogic: AnyObject {
    func displaySomething(viewModel: Register.Something.ViewModel)
}

class RegisterViewController: UIViewController, RegisterDisplayLogic {
    var interactor: RegisterBusinessLogic?
    var router: (NSObjectProtocol & RegisterRoutingLogic & RegisterDataPassing)?
    
    
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
    private func setup() {
        let viewController = self
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
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
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTap = { [weak self] userModel in
            if let self {
                self.registerTap(userModel: userModel)
            }
        }
        return view
    }()

func doSomething() {
    let request = Register.Something.Request()
    interactor?.doSomething(request: request)
}

func displaySomething(viewModel: Register.Something.ViewModel) {}

func registerTap(userModel: UserModel) {}
}
