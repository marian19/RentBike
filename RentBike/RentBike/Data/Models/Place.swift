//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Place {
    let id : String?
    let name : String?
    let location : Location?
    
    init(json: JSON) {
        id = json[DataConstants.PlaceData.id].stringValue
        name = json[DataConstants.PlaceData.name].stringValue
        location = Location(json: json[DataConstants.PlaceData.location])
    }
}

