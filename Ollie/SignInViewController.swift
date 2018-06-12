//
//  SignInViewController.swift
//  Ollie
//
//  Created by Gala Pillot on 12/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    var refUsers: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refUsers = Database.database().reference().child("users")
    }
    
    //Outlets
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var MdpField: UITextField!
    
    //Actions
    @IBAction func LogInAction(_ sender: UIButton) {
        
        if self.MailField.text == "" {
            
            //Alert the user that he have not insert email
            
            let alertController = UIAlertController(title: "Champs vide...", message: "N'oubliez pas de renseigner votre adresse mail !", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
            
        else if self.MdpField.text == "" {
            
            //Alert the user that he have not insert password
            
            let alertController = UIAlertController(title: "Champs vide...", message: "N'oubliez pas de renseigner votre mot de passe !", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
            
        else {
            Auth.auth().signIn(withEmail: self.MailField.text!, password: self.MdpField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You're successfully connected !")
                    
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
                    self.present(vc, animated: true, completion: nil)
                    
                    
                } else {
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error...", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
