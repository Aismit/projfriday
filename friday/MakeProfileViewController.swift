//
//  MakeProfileViewController.swift
//  friday
//
//  Created by Aismit Das on 11/23/18.
//  Copyright © 2018 Aismit Das. All rights reserved.
//

import UIKit
import FirebaseAuth

class MakeProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordVerificationTextField: UITextField!
    
    var userEmail = ""
    var userName = ""
    var userPassword = ""
    var userVerifiedPassWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLogInButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLogIn", sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let verifiedPassword = passwordVerificationTextField.text else { return }
        if email == "" || password == "" || name == "" || verifiedPassword == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    // TO DO:
                    // The user account has been successfully created. Now, update the user's name in
                    // firebase and then perform a segue to the main page. Note, again, that this segue
                    // already exists somewhere, just do some simple debugging to find the identifier.
                    // Also, notify the user that the account has been successfully created before
                    // performing the segue.
                    
                    // ...
                    
                    let alert = UIAlertController(title: "Sign UP", message: "Success!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in self.performSegue(withIdentifier: "signUpSuccess", sender: self)}))
                    
                    
                    //                        guard let user = authResult?.user else { return }
                    
                    
                    self.present(alert, animated: true)
                    //
                    
                    
                    
                } else if password != verifiedPassword {
                    let alertController = UIAlertController(title: "Verification Error.", message: "The two passwords do not match.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.passwordVerificationTextField.textColor = UIColor.red
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.commitChanges { (error) in
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
