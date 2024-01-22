import UIKit

protocol LoginBusinessLogic {
  func doSomething(request: Login.Something.Request)
}

protocol LoginDataStore {}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?
  
  // MARK: Do something
  func doSomething(request: Login.Something.Request) {
    worker = LoginWorker()
      worker?.loginUser(userModel: request.userModel, successHandler: { [weak self] userModel in
          
          if let self {
              let response = Login.Something.Response(userModel: userModel ?? UserModel())
              self.presenter?.presentSomething(response: response)
          }
          
      }, failureHandler: { [weak self] error in
          if let self, let error = error, let viewError = Login.Something.ViewError(error: error) {
              self.presenter?.presentError(error: error)
              }
          }
                        
      )}
  }

