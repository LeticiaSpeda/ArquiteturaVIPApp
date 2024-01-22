import UIKit

@objc protocol LoginRoutingLogic {
    func routeToHome()
    func routeToRegister()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
   
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    func routeToHome() {
        let destinationViewController = HomeViewController()
        navigateToPush(source: viewController!, destination: destinationViewController)
    }
    
    func routeToRegister() {
        let destinationViewController = RegisterViewController()
        navigateToPush(source: viewController!, destination: destinationViewController)
    }
    
    
    // MARK: Navigation
    func navigateToPush(source: LoginViewController, destination: UIViewController) {
        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passDataToModal(source: LoginDataStore, destination: UIViewController) {}
}
