//
//  SignUpViewController.swift
//  Ollie
//
//  Created by Gala Pillot on 11/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    var refUsers: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refUsers = Database.database().reference().child("users")
    }
    
    //Outlets
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var MdpField: UITextField!
    
    //Actions
    @IBAction func CreateAccountAction(_ sender: AnyObject) {
        
        if MailField.text == "" {
            let alertController = UIAlertController(title: "Champs vide...", message: "N'oubliez pas de renseigner une adresse mail!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
            
        else if MdpField.text == "" {
            let alertController = UIAlertController(title: "Champs vide...", message: "N'oubliez pas de renseigner un mot de passe !", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
            
        else {
            Auth.auth().createUser(withEmail: MailField.text!, password: MdpField.text!) { (user, error) in
                
                if error == nil {
                    //Go on the page Home after the subscribe is succeed
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                    let key = Auth.auth().currentUser?.uid
                    
                    let user = ["email": self.MailField.text! as String] as [String : Any]
                    
                    self.refUsers.child(key!).setValue(user)
                    
                }
                
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
