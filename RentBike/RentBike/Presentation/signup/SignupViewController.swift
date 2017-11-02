//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Class Properties
    
    var presenter: SignupPresenterProtocol?
    
    // MARK: - Class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignupPresenter(view: self)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - @IBAction
    
    @IBAction func signup(_ sender: Any) {
        presenter?.signup(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
}

// MARK: - LoginViewProtocol implementation

extension SignupViewController: SignupViewProtocol{
    
    func success(){
        self.performSegue(withIdentifier: "successSignUp", sender: self)
    }
    
    func showErrorMsg(msg : String){
        alert(message: msg)
    }
}
