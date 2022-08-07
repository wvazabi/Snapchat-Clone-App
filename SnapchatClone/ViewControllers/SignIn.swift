//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Enes Kaya on 6.08.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignIn: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinButtonClicked(_ sender: Any) {
    
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil{
                    self.alertPopUp(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            alertPopUp(titleInput: "Error"  , messageInput: "Username/Password")
        }
    
    }
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && usernameText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { autdata, error in
                if error != nil {
                
                    self.alertPopUp(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }

        else{
            alertPopUp(titleInput: "Error", messageInput: "Username/Password")
        }
        
    }
    
    
    
    func alertPopUp(titleInput:String, messageInput:String){
           let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
           let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(okButton)
           self.present(alert, animated: true, completion: nil)
       }
    

}

