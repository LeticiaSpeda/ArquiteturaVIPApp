import Foundation

protocol UserManagerProtocol  {
    func login(email: String, password: String, successHandler: @escaping(UserModel) -> Void, failureHandler: @escaping(Error) -> Void)
    
    func register(email: String, password: String, successHandler: @escaping(UserModel) -> Void, failureHandler: @escaping(Error) -> Void)
}

final class UserManager: UserManagerProtocol {
    private let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func login(email: String, password: String, successHandler: @escaping (UserModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String, password: String, successHandler: @escaping (UserModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
}
