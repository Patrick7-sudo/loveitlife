//
//  ViewController.swift
//  loveitlife
//
//  Created by tasniim on 26/10/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

 
    
 
    @IBOutlet weak var userPassCodeInput: UITextField!
    @IBOutlet weak var userPasscodeButton: UIButton!
    @IBOutlet weak var userEmailInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//          if user text something it will let viewController know what user doing. self refer to viewcontroller
        userPassCodeInput.delegate = self
        
//          styling user Input for logIn passcode & email
            let attributePlaceHolder = [
                NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.12, blue: 0.10, alpha: 1.00),
                NSAttributedString.Key.font : UIFont(name: "Nunito-light", size: 16)
            ]
//          Do any additional setup after loading the view.
        
//          styling user Input for logIn passcode
        userEmailInput.textColor =  UIColor(red: 0.11, green: 0.12, blue: 0.10, alpha: 1.00)
        userEmailInput.font = UIFont(name: "Nunito-Light", size: 17)
        userEmailInput.layer.cornerRadius = 5
        userEmailInput.layer.borderWidth = 1
        userEmailInput.attributedPlaceholder = NSAttributedString(string: "Enter Your Email", attributes: attributePlaceHolder as [NSAttributedString.Key : Any])
        userEmailInput.layer.borderColor = UIColor(red: 0.63, green: 0.85, blue: 0.15, alpha: 1.00).cgColor
        userEmailInput.textAlignment = .center
        
//          styling user Input for logIn passcode

        
        userPassCodeInput.textColor =  UIColor(red: 0.11, green: 0.12, blue: 0.10, alpha: 1.00)
        userPassCodeInput.font = UIFont(name: "Nunito-Light", size: 17)
        userPassCodeInput.layer.cornerRadius = 5
        userPassCodeInput.layer.borderWidth = 1
        userPassCodeInput.attributedPlaceholder = NSAttributedString(string: "Enter Your Passcode", attributes: attributePlaceHolder as [NSAttributedString.Key : Any])
        userPassCodeInput.layer.borderColor = UIColor(red: 0.63, green: 0.85, blue: 0.15, alpha: 1.00).cgColor
        userPassCodeInput.textAlignment = .center
        
//          styling user button for logIn passcode
        userPasscodeButton!.titleLabel?.font = UIFont(name:"Nunito-Bold", size: 16)
        userPasscodeButton.layer.cornerRadius = 15
    }

   

    @IBAction func Loginpressed(_ sender: UIButton) {
//        after press the button hide the keyboard
//        userPassCodeInput.endEditing(true)
//        userEmailInput.endEditing(true)
//        print(self.quoteIndividual)
        print("Hellothere")
//        print(userPassCodeInput.text!)
//        authenticate user and if correct send them to nextpage
        if let email = userEmailInput.text , let password = userPassCodeInput.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "goToWelcomePage", sender: self)
                }
            }
        }
//        end of authenticate user and if correct send them to nextpage
   
    }
    
    
//         to initailze the submit button and get the info from the userPasscode
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//         after press the return button hide the keyboard
                userPassCodeInput.endEditing(true)
                userEmailInput.endEditing(true)
        return true
    }
    
//         checking if its end finish and its the correct one
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if userPassCodeInput.text != "" {
            return true
        }else {
            userPassCodeInput.placeholder = "Please Enter Valid code"
            return false
        }
        
     
    }
    
//          to clear the input box after the user done editing
//    func textFieldDidEndEditing(_ textField: UITextField) {
////        get the user input
//        userPassCodeInput.text = ""
//        userEmailInput.text = ""
//    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        _ = segue.destination as! WelcomePageController
//
//    }

}

