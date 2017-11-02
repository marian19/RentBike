//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

protocol RentPresenterProtocol : class{
    
    func rent(placeID: String, name: String,number: String, cvv: String,expiryMonth: String, expiryYear: String)
}

protocol RentViewProtocol : class{
    func success(msg : String)
    func showErrorMsg(msg : String)
}
