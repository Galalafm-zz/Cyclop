//
//  ViewController.swift
//  Ollie
//
//  Created by Dev on 03/06/2018.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    var simpleBluetoothIO: SimpleBluetoothIO!
    var motionManager = CMMotionManager()
    
    @IBOutlet weak var stopButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "6e400001-b5a3-f393-e0a9-e50e24dcca9e", delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.1
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {(data, error) in
            if let accData = data {
                // THE ALGO //
                // print(accData)
                let accelerationXYZ = abs(accData.acceleration.x + accData.acceleration.z + accData.acceleration.y) - 1
                self.stopButton.text = String(round(1000*accelerationXYZ)/1000);
                
                if accelerationXYZ > 0.75 {
                    self.stopHelper();
                    self.simpleBluetoothIO.writeValue(value: 65)
                }
                // END ALGO //
            }
        }
        
    }
    
    func setTimeout(_ delay:TimeInterval, block:@escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }

    func stopHelper() {
        self.stopButton.textColor = UIColor(red: 255.0, green: 0.0, blue: 0, alpha: 1.0)
        
        let handle = setTimeout(2.0, block: { () -> Void in
            self.stopButton.textColor = UIColor(red: 0.0, green: 0.0, blue: 0, alpha: 1.0)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}

