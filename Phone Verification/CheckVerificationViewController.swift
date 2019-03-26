//
//  CheckVerificationViewController.swift
//  Phone Verification
//
//  Created by Brent Schooley on 3/26/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import UIKit

class CheckVerificationViewController: UIViewController {
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var countryCode: String?
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func validateCode(_ sender: Any) {
        self.statusLabel.text = nil
        self.statusLabel.isHidden = true
        
        if let code = codeField.text {
            VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code) {
                checked in
                
                if(checked.success) {
                    self.statusLabel.textColor = UIColor.green
                    self.statusLabel.text = "Verification successful!"
                    self.statusLabel.isHidden = false
                } else {
                    self.statusLabel.textColor = UIColor.red
                    self.statusLabel.text = checked.message
                    self.statusLabel.isHidden = false
                }
            }
        }
        
    }
    

}
