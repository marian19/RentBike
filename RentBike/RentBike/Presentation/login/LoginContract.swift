//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol : class{
    
    func login(email: String, password: String)
}

protocol LoginViewProtocol : class{
    func success()
    func showErrorMsg(msg : String)
}
