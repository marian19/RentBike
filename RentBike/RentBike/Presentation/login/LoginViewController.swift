//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Class Properties
    
    var presenter: LoginPresenterProtocol?
    
    // MARK: - Class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - @IBAction
    
    @IBAction func signIn(_ sender: Any) {
        presenter?.login(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
}

// MARK: - LoginViewProtocol implementation

extension LoginViewController: LoginViewProtocol{
    
    func success(){
        self.performSegue(withIdentifier: "successSignIn", sender: self)
    }
    
    func showErrorMsg(msg : String){
        alert(message: msg)
    }
}
