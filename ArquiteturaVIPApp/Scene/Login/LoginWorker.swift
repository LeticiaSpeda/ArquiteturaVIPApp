import UIKit

class LoginWorker {
    
    func loginUser(userModel: UserModel, successHandler: @escaping (UserModel?) -> Void, failureHandler: @escaping (Error?) -> Void) {
        
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email, password: userModel.password) { userModel in
            successHandler(userModel)
        } failureHandler: { error in
            failureHandler(error)
        }

  }
}
