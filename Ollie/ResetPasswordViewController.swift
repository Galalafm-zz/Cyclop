//
//  ResetPasswordViewController.swift
//  Ollie
//
//  Created by Gala Pillot on 12/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ResetPasswordViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var MailField: UITextField!
    
    //Actions
    @IBAction func ResetPassword(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: self.MailField.text!, completion: { (error) in
            
            var title = ""
            var message = ""
            
            if error != nil {
                title = "Error..."
                message = (error?.localizedDescription)!
            } else {
                title = "Confirmation !"
                message = "Un email vous a été envoyé pour reinitialiser votre mot de passe."
                self.MailField.text = ""
            }
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "J'ai compris", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        })
    }
}
