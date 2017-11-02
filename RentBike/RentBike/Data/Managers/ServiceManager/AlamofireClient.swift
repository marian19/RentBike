//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

struct AlamofireClient: APIClient {
    
    //MARK: Shared Instance
    
    static let sharedInstance =  AlamofireClient()
    
    private init() {
        
    }
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData())
        
        
        Alamofire.request(url, parameters: parameters, headers: header).responseJSON { (response:DataResponse<Any>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            
            let statusCode = response.response?.statusCode
            print(statusCode ?? "statusCode default value")
            
            guard response.result.isSuccess else {
                print("Error while fetching : \(String(describing: response.result.error))")
                return
            }
            
            guard statusCode == 200, response.result.error == nil else {
                ErrorHandling.handleErrorCode(responseData:  JSON(data: response.data!))
                return
            }
            let json = JSON(data: response.data!)
            completion(json, nil)
            
        }
    }
    
    func executePostRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData())
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header ).responseJSON { (response:DataResponse<Any>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            let statusCode = response.response?.statusCode
            print(statusCode ?? "statusCode default value")
            
            guard response.result.isSuccess else {
                print("Error while fetching : \(String(describing: response.result.error))")
                return
            }
            
            guard statusCode == 200, response.result.error == nil else {
                ErrorHandling.handleErrorCode(responseData:  JSON(data: response.data!))
                return
            }
            let json = JSON(data: response.data!)
            completion(json, nil)
            
        }
    }
    
    func executePutRequest(url:String,parameters: [String:Any]?,header : [String:String]?,completion:@escaping (Any?,Error?) -> Void){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData())
        Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: header ).responseJSON { (response:DataResponse<Any>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            let statusCode = response.response?.statusCode
            print(statusCode ?? "statusCode default value")
            
            guard response.result.isSuccess else {
                print("Error while fetching : \(String(describing: response.result.error))")
                return
            }
            
            guard statusCode == 200, response.result.error == nil else {
                ErrorHandling.handleErrorCode(responseData:  JSON(data: response.data!))
                return
            }
            let json = JSON(data: response.data!)
            completion(json, nil)
        }
        
    }
    
    
}
