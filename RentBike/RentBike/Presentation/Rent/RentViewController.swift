//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit

class RentViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var expiryMonthTextField: UITextField!
    @IBOutlet weak var expiryYearTextField: UITextField!
    
    // MARK: - Class Properties
    var selectedPlace: Place?
    var presenter: RentPresenterProtocol?
    
    // MARK: - Class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLabel.text = selectedPlace?.name
        presenter = RentPresenter(view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - @IBAction
    
    @IBAction func rent(_ sender: Any) {
        presenter?.rent(placeID: (selectedPlace?.id)!, name: nameTextField.text!, number: numberTextField.text!, cvv: cvvTextField.text!, expiryMonth: expiryMonthTextField.text!, expiryYear: expiryYearTextField.text!)
    }
    
}

// MARK: - RentViewProtocol implementation

extension RentViewController: RentViewProtocol{
    
    func success(msg : String){
        alert(message: msg)
    }
    
    func showErrorMsg(msg : String){
        alert(message: msg)
    }
}
