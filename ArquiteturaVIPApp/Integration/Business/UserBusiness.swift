import Foundation

protocol UserBusinessProtocol {
    func login(email: String, password: String, completionHadler: @escaping(Result<UserModel, Error>) -> Void)
    func register(email: String, password: String, completionHadler: @escaping(Result<UserModel, Error>) -> Void)
}

final class UserBusiness: UserBusinessProtocol {
    private let provider = UserProvider()
    
    func login(email: String, password: String, completionHadler: @escaping(Result<UserModel, Error>) -> Void) {
        provider.login(parameters: getParams( email, password)) { result in
            switch result {
            case .success(let userModel):
                completionHadler(.success(userModel))
            case .failure(let error):
                completionHadler(.failure(error))
            }
        }
    }
    
    func register(email: String, password: String, completionHadler: @escaping(Result<UserModel, Error>) -> Void) {
        provider.register(parameters: getParams(email, password)) { result in
            switch result {
            case .success(let userModel):
                completionHadler(.success(userModel))
            case .failure(let error):
                completionHadler(.failure(error))
            }
        }
    }
    
    private func getParams(_ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel: userModel]]
        return params
    }
}
