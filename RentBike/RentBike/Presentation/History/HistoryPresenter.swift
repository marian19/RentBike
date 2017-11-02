//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol{
    
    weak var view: HistoryViewProtocol?
    
    required init(view: HistoryViewProtocol) {
        self.view = view
    }
    
    // MARK: - HistoryPresenterProtocol implementation
    
    func getHistory() {
        if Connectivity.isConnectedToInternet {
            
            PaymentDataSource().getPaymentList { paymentList in
                self.view?.showHistory(history: paymentList)
            }
        }else{
            view?.showErrorMsg(msg: "The internet connection appears to be offline")
        }
    }
}




