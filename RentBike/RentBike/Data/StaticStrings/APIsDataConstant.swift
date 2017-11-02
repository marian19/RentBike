//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

struct DataConstants {
    
    struct ResponseData {
        static let message = "message"
        static let code = "code"
    }
    
    struct UserData {
        static let email = "email"
        static let token = "token"
        static let password = "password"
    }
    
    struct PlaceData {
        static let id = "id"
        static let name = "name"
        static let location = "location"
        static let latitude = "lat"
        static let longitude = "lng"
    }
    
    struct PaymentData {
        static let placeId = "placeId"
        static let name = "name"
        static let number = "number"
        static let cvv = "cvv"
        static let expiryMonth = "expiryMonth"
        static let expiryYear = "expiryYear"
        static let creditCard = "creditCard"
    }
}
