//
//  welcomePage.swift
//  loveitlife
//
//  Created by tasniim on 27/10/2022.
//

import UIKit
import SwiftUI

class WelcomePageController: UIViewController {
    
//    labels variables
    @IBOutlet weak var welcomeLabelWelcomePage: UILabel!
    @IBOutlet weak var greetingPersonWelcomePage: UILabel!
//    button variables
    @IBOutlet weak var welcomeProudsButton: UIButton!
    @IBOutlet weak var welcomeWorriesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      welcome label styling for welcome page
        welcomeLabelWelcomePage.font = UIFont(name: "Nunito-Bold", size: 40)
        
//      personal name label styling for welcome page
        greetingPersonWelcomePage.font = UIFont(name: "Nunito-Bold", size: 40)

//        button prouds styling for welcome page
//        welcomeProudsButton!.titleLabel?.font = UIFont(name:"Nunito-Light", size: 20)
        welcomeProudsButton.layer.cornerRadius = 15
        
//        button worries for welcome page
//        welcomeWorriesButton!.titleLabel?.font = UIFont(name:"Nunito-Light", size: 20)
        welcomeWorriesButton.layer.cornerRadius = 15
      
    }
    
//    prounds function button

    @IBAction func ProudsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToListPage", sender: self)
    }
    
}
