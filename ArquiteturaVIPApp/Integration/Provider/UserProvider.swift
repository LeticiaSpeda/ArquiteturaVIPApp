import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable: Any], completionHadler: @escaping(Result<UserModel, Error>) -> Void)
    
    func register(parameters: [AnyHashable: Any], completionHadler: @escaping(Result<UserModel, Error>) -> Void)
}

final class UserProvider: UserProviderProtocol {
    private lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHadler: @escaping (Result<UserModel, Error>) -> Void) {
        guard let body = parameters[Constants.ParametersKeys.body] as? NSDictionary,
              let userModel = body[Constants.ParametersKeys.userModel] as? UserModel else {
            return
        }
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHadler(.failure(error))
            } else {
                completionHadler(.success(userModel))
            }
        }
    }
    
    func register(parameters: [AnyHashable : Any], completionHadler: @escaping (Result<UserModel, Error>) -> Void) {
        guard let body = parameters[Constants.ParametersKeys.body] as? NSDictionary,
              let userModel = body[Constants.ParametersKeys.userModel] as? UserModel else {
            return
        }
        
        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHadler(.failure(error))
            } else {
                completionHadler(.success(userModel))
            }
        }
    }
}
