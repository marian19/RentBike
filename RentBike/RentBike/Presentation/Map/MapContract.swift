//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
protocol MapPresenterProtocol : class{
    
    func getPlaceList()
}

protocol MapViewProtocol : class{
    func showPlacesOnMap(places: [Place])
    func showErrorMsg(msg : String)
}
