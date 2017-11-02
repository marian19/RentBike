//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import SwiftKeychainWrapper

struct UserDataSource {
    
    let serviceManager = AlamofireClient.sharedInstance
    
    func loginUser(requestValue: RequestValues, completion: @escaping(_ response: String) -> Void) {
        
        let userRequestValues = (requestValue as! UserRequestValues)
        
        let params : [String: String] = [DataConstants.UserData.email: userRequestValues.email, DataConstants.UserData.password: userRequestValues.password ]
        
        serviceManager.executePostRequest(url: Constants.baseURL +  Constants.UserAPIs.user, parameters: params, header: nil, completion: {(responseData , error) -> Void in
            if error == nil{
                let json = responseData as! JSON
                let token = json[DataConstants.UserData.token].stringValue
                KeychainWrapper.standard.set("bearer " + token, forKey: DataConstants.UserData.token)
                completion(token)
            }
        })
    }
    
    func registerUser(requestValue: RequestValues, completion: @escaping(_ response: Any) -> Void) {
        
        let userRequestValues = (requestValue as! UserRequestValues)
        
        let params : [String: String] = [DataConstants.UserData.email: userRequestValues.email, DataConstants.UserData.password: userRequestValues.password ]
        
        serviceManager.executePutRequest(url: Constants.baseURL +  Constants.UserAPIs.user, parameters: params, header: nil, completion: {(responseData , error) -> Void in
            if error == nil{
                let json = responseData as! JSON
                let token = json[DataConstants.UserData.token].stringValue
                KeychainWrapper.standard.set("bearer " + token, forKey: DataConstants.UserData.token)
                completion(token)
            }
        })
    }
}

struct UserRequestValues: RequestValues{
    let email: String
    let password: String
}


