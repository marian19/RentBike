//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit
import SwiftyJSON

struct PlaceDataSource{
    
    func getPlaceList(completion: @escaping(_ response: [Place]) -> Void){
        AlamofireClient.sharedInstance.executeGetRequest(url:Constants.baseURL +  Constants.PlaceAPIs.Place, parameters: nil, header: nil, completion:  {(responseData , error) -> Void in
            if error == nil{
                let json =  responseData as! JSON
                var placeList = [Place]()
                if let places = json["places"].array{
                    for place in places{
                        placeList.append(Place(json: place))
                    }
                }
                completion(placeList)
            }
        })
    }
}
