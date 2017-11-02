//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation

protocol APIClient{
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void)
    
    func executePostRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void)
    
    func executePutRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void)

}
