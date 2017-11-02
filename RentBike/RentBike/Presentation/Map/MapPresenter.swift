//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
class MapPresenter: MapPresenterProtocol{
    
    weak var view: MapViewProtocol?
    
    required init(view: MapViewProtocol) {
        self.view = view
        
    }
    
    // MARK: - MapPresenterProtocol implementation
    
    func getPlaceList() {
        if Connectivity.isConnectedToInternet {
            
            PlaceDataSource().getPlaceList { places in
                self.view?.showPlacesOnMap(places: places)
            }
        }else{
            view?.showErrorMsg(msg: "The internet connection appears to be offline")
        }
    }
}
