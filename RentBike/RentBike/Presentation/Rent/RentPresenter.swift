//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

class RentPresenter: RentPresenterProtocol{
    
    weak var view: RentViewProtocol?
    
    required init(view: RentViewProtocol) {
        self.view = view
    }
    
    // MARK: - RentPresenterProtocol implementation
    
    func rent(placeID: String, name: String,number: String, cvv: String,expiryMonth: String, expiryYear: String){
        //
        if Connectivity.isConnectedToInternet {
            
            if (!name.isBlank && !number.isBlank && !cvv.isBlank && !expiryYear.isBlank && !expiryMonth.isBlank) {
                let requestValue = CreatePaymentRequestValues(placeId: placeID, number: number, name: name, cvv: cvv, expiryMonth: expiryMonth, expiryYear: expiryYear)
                PaymentDataSource().createPayment(requestValue: requestValue) { succesMsg in
                    
                    self.view?.success(msg: succesMsg)
                }
            }else{
                view?.showErrorMsg(msg: "Invalid Data")
            }
            
        }else{
            view?.showErrorMsg(msg: "The internet connection appears to be offline")
        }
    }
}



