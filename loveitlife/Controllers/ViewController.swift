//
//  ViewController.swift
//  loveitlife
//
//  Created by tasniim on 26/10/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

 
    
 
    @IBOutlet weak var userPassCodeInput: UITextField!
    @IBOutlet weak var userPasscodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if user text something it will let viewController know what user doing. self refer to viewcontroller
        userPassCodeInput.delegate = self
        // Do any additional setup after loading the view.
        
        //styling user Input for logIn passcode
        let attributePlaceHolder = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.12, blue: 0.10, alpha: 1.00),
            NSAttributedString.Key.font : UIFont(name: "Nunito-light", size: 16)
        ]
        
        userPassCodeInput.textColor =  UIColor(red: 0.11, green: 0.12, blue: 0.10, alpha: 1.00)
        userPassCodeInput.font = UIFont(name: "Nunito-Light", size: 17)
        userPassCodeInput.layer.cornerRadius = 25
        userPassCodeInput.layer.borderWidth = 1
        userPassCodeInput.attributedPlaceholder = NSAttributedString(string: "Enter Your Passcode", attributes: attributePlaceHolder as [NSAttributedString.Key : Any])
       
        
        userPassCodeInput.layer.borderColor = UIColor(red: 0.63, green: 0.85, blue: 0.15, alpha: 1.00).cgColor
        userPassCodeInput.textAlignment = .center
        
        //styling user button for logIn passcode
        userPasscodeButton!.titleLabel?.font = UIFont(name:"Nunito-Bold", size: 16)
        userPasscodeButton.layer.cornerRadius = 25
     
    }


    @IBAction func Loginpressed(_ sender: UIButton) {
//        after press the button hide the keyboard
        userPassCodeInput.endEditing(true)
        print("Hellothere")
//        print(userPassCodeInput.text!)
        self.performSegue(withIdentifier: "goToWelcomePage", sender: self)
    }
    
//     to initailze the submit button and get the info from the userPasscode
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        after press the return button hide the keyboard
                userPassCodeInput.endEditing(true)
        print(userPassCodeInput.text!)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "gotToWelcomePage" {
            _ = segue.destination as! WelcomePageController
        }
    }

}

