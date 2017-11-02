//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//
import Foundation
import SwiftyJSON

struct CreditCard {
    let number : String?
    let name : String?
    let cvv : String?
    let expiryMonth : String?
    let expiryYear : String?
    
    init(json: JSON) {
        number = json[DataConstants.PaymentData.number].stringValue
        name = json[DataConstants.PaymentData.name].stringValue
        cvv = json[DataConstants.PaymentData.cvv].stringValue
        expiryMonth = json[DataConstants.PaymentData.expiryMonth].stringValue
        expiryYear = json[DataConstants.PaymentData.expiryYear].stringValue
    }
}
