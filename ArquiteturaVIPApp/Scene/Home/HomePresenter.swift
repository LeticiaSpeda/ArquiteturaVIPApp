import UIKit

protocol HomePresentationLogic {
    func presentSomething(response: Home.Something.Response)
    func presentError(error: Login.Something.ViewError)
}

class HomePresenter: HomePresentationLogic {
   
    weak var viewController: HomeDisplayLogic?
    
    // MARK: Do something
    func presentSomething(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    func presentError(error: Login.Something.ViewError) {
        let viewError = Login.Something.ViewError(error: error)
        viewController?.displayError(error: viewError)
    }
}
