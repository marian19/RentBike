//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

protocol SignupPresenterProtocol : class{
    
    func signup(email: String, password: String)
}

protocol SignupViewProtocol : class{
    func success()
    func showErrorMsg(msg : String)
}
