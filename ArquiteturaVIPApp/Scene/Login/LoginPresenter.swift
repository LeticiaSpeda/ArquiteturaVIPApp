
import UIKit

protocol LoginPresentationLogic {
    func presentSomething(response: Login.Something.Response)
    func presentError(error: Login.Something.ViewError)
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Login.Something.Response)
    {
        let viewModel = Login.Something.ViewModel(userModel: UserModel())
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentError(error: Login.Something.ViewError) {
        let viewModel = Login.Something.ViewError(error: error)
        viewController?.displayError(error: viewModel)
    }
}
