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
    worker?.loginUser()
    
    let response = Login.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
