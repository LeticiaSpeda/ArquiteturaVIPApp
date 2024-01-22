import UIKit

enum Login {
    
    // MARK: Use cases
    enum Something {
        struct Request {
            var userModel: UserModel
        }
        
        struct Response {
            var userModel: UserModel
        }
        
        struct ViewModel {
            var userModel: UserModel
        }
        
        struct ViewError: Error {
            var error: Error
        }
    }
}
