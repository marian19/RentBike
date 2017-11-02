//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Payment {
    let creditCard : CreditCard?
    let email : String?
    let placeId : String?
    
    init(json: JSON) {
        email = json[DataConstants.UserData.email].stringValue
        placeId = json[DataConstants.PaymentData.placeId].stringValue
        creditCard = CreditCard(json: json[DataConstants.PaymentData.creditCard])
    }
}
