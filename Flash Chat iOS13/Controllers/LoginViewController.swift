//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password = passwordTextfield.text {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                let errorAlert = UIAlertController(title: "Couldn't log in", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)

                errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                      print(e)
                }))

                self?.present(errorAlert, animated: true, completion: nil)
                
            }else{
                self?.performSegue(withIdentifier: K.loginSegue, sender: self)
            }

            }
        }
    }
    
}
