//
//  VehiculesViewController.swift
//  Ollie
//
//  Created by Gala Pillot on 13/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class VehiculesViewController: UIViewController {
    
    var refUsers: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refUsers = Database.database().reference().child("users")
    }
    
    @IBAction func ChooseSkateAction(_ sender: UIButton) {
        let key = Auth.auth().currentUser?.uid
        
        let user = ["vehicule": "skateboard"]
        
        self.refUsers.child(key!).setValue(user)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PairSelect")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func ChooseHoverAction(_ sender: UIButton) {
        let key = Auth.auth().currentUser?.uid
        
        let user = ["vehicule": "hoverboard"]
        
        self.refUsers.child(key!).setValue(user)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PairSelect")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func ChooseTrottiAction(_ sender: UIButton) {
        let key = Auth.auth().currentUser?.uid
        
        let user = ["vehicule": "trottinette"]
        
        self.refUsers.child(key!).setValue(user)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PairSelect")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func ChooseGyroAction(_ sender: UIButton) {
        let key = Auth.auth().currentUser?.uid
        
        let user = ["vehicule": "gyroroue"]
        
        self.refUsers.child(key!).setValue(user)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PairSelect")
        self.present(vc!, animated: true, completion: nil)
    }
}
