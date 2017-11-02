//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol{
    
    weak var view: SignupViewProtocol?
    
    required init(view: SignupViewProtocol) {
        self.view = view
        
    }
    
    // MARK: - SignupPresenterProtocol implementation
    
    func signup(email: String, password: String) {
        
        if Connectivity.isConnectedToInternet {
            
            if (email.isEmail) {
                if password.isValidPassword {
                    
                    let requestValue = UserRequestValues(email: email, password: password)
                    
                    UserDataSource().registerUser(requestValue: requestValue, completion: { token in
                        self.view?.success()
                    })
                    
                }else{
                    view?.showErrorMsg(msg: "Invalid password")
                    
                }
            }else{
                view?.showErrorMsg(msg: "Invalid email")
            }
        }else{
            view?.showErrorMsg(msg: "The internet connection appears to be offline")
        }
    }
}



