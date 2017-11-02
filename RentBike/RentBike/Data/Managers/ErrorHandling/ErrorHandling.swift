//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Toast

public class ErrorHandling {
    public static func handleErrorCode(responseData : Any) {
        let dic = (responseData as! JSON).dictionaryObject
        if let errorMessage = dic?[DataConstants.ResponseData.message] as? String{
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.window?.makeToast(errorMessage, duration: 3.0, position: CSToastPositionCenter)
        }
    }
}

