//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON

struct PaymentDataSource {
    
    func createPayment(requestValue: RequestValues,completion: @escaping(_ response: String) -> Void){
        
        let createPaymentRequestValues = (requestValue as! CreatePaymentRequestValues)
        
        let params : [String: String] = [DataConstants.PaymentData.placeId:
            createPaymentRequestValues.placeId,
                                         DataConstants.PaymentData.number: createPaymentRequestValues.number,
                                         DataConstants.PaymentData.name: createPaymentRequestValues.name,
                                         DataConstants.PaymentData.cvv: createPaymentRequestValues.cvv,
                                         DataConstants.PaymentData.expiryMonth: createPaymentRequestValues.expiryMonth,
                                         DataConstants.PaymentData.expiryYear: createPaymentRequestValues.expiryYear ]
        var headers : HTTPHeaders = [:]
        
        if let token =  KeychainWrapper.standard.string(forKey: DataConstants.UserData.token){
            headers = [
                "Content-Type" : "application/json",
                "Authorization": token ,
                "Accept": "application/json"
            ]
            
        }
        
        AlamofireClient.sharedInstance.executePutRequest(url:Constants.baseURL +  Constants.PaymentAPIs.payments, parameters: params, header: headers, completion: {(responseData , error) -> Void in
            if error == nil{
                let json = responseData as! JSON
                let successMsg = json[DataConstants.ResponseData.message].stringValue
                completion(successMsg)
            }
        })
    }
    
    func getPaymentList(completion: @escaping(_ response: [Payment]) -> Void){
        var headers : HTTPHeaders = [:]
        
        if let token =  KeychainWrapper.standard.string(forKey: DataConstants.UserData.token){
            headers = [
                "Content-Type" : "application/json",
                "Authorization": token ,
                "Accept": "application/json"
            ]
        }
        
        AlamofireClient.sharedInstance.executeGetRequest(url:Constants.baseURL +  Constants.PaymentAPIs.payments, parameters: nil, header: headers, completion: {(responseData , error) -> Void in
            if error == nil{
                let json =  responseData as! JSON
                var paymentList = [Payment]()
                if let payments = json["payments"].array{
                    for payment in payments{
                        paymentList.append(Payment(json: payment))
                        
                    }
                }
                completion(paymentList)
            }
        })
    }
}

struct CreatePaymentRequestValues: RequestValues{
    let placeId: String
    let number: String
    let name: String
    let cvv: String
    let expiryMonth: String
    let expiryYear: String
}
