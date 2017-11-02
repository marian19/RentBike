//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class HistoryViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Class Properties
    var places:[Place]?
    var paymentList: [Payment] = []
    var presenter: HistoryPresenterProtocol?
    
    // MARK: - Class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HistoryPresenter(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getHistory()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions

    @IBAction func logout(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: DataConstants.UserData.token)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController  = appDelegate.window!.rootViewController
        
        if rootViewController is UITabBarController {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
            appDelegate.window?.rootViewController?.dismiss(animated: false, completion: nil)
            appDelegate.window?.rootViewController?.view.removeFromSuperview()
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
            
        }else{
            performSegue(withIdentifier: "unwindToMainMenuWithSender", sender: self)
        }
    }
    
}

// MARK: -  UITableViewDataSource implementation

extension HistoryViewController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return paymentList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        let payment = paymentList[indexPath.row]
        if let selectedIndex = places?.index(where: { $0.id == payment.placeId }){
            let place: Place = places![selectedIndex]
            cell.placeLabel.text = place.name
        }
        cell.nameLabel.text = payment.creditCard?.name
        cell.numberLabel.text = payment.creditCard?.number
        cell.cvvLabel.text = payment.creditCard?.cvv
        cell.expLabel.text = (payment.creditCard?.expiryMonth)! + "/" + (payment.creditCard?.expiryYear)!
        return cell
        
    }
    
    
}
// MARK: - HistoryViewProtocol implementation

extension HistoryViewController: HistoryViewProtocol{
    
    func showHistory(history: [Payment]){
        self.paymentList = history
        self.tableView.reloadData()
        
    }
    
    func showErrorMsg(msg : String){
        alert(message: msg)
    }
}
