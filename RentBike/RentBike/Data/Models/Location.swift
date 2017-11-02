//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Location {
    public var latitude : Double?
    public var longitude : Double?
    
    init(json: JSON) {
        latitude = json[DataConstants.PlaceData.latitude].doubleValue
        longitude = json[DataConstants.PlaceData.longitude].doubleValue
    }
}
