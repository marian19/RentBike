//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

protocol HistoryPresenterProtocol : class{
    func getHistory()
}

protocol HistoryViewProtocol : class{
    func showHistory(history: [Payment])
    func showErrorMsg(msg : String)
}
