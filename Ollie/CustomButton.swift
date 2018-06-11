//
//  CustomButton.swift
//  Ollie
//
//  Created by Gala Pillot on 11/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.layer.cornerRadius = 30.0
        self.layer.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
    }
}
