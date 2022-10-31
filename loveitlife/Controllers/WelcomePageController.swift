//
//  welcomePage.swift
//  loveitlife
//
//  Created by tasniim on 27/10/2022.
//

import UIKit
import SwiftUI

class WelcomePageController: UIViewController, QuotesManagerDelegate {
//      variable to accept data from view controller
  
    
//      labels variables
    @IBOutlet weak var welcomeLabelWelcomePage: UILabel!
    @IBOutlet weak var greetingPersonWelcomePage: UILabel!
    
//      button variables
    @IBOutlet weak var welcomeProudsButton: UIButton!
    @IBOutlet weak var welcomeWorriesButton: UIButton!
    
//      motivational Quote Variable
    @IBOutlet weak var quotes: UILabel?
    
//      variable to initialise Quotes manager2 from GuotesManager file
    var quotesManager2 = QuotesManager2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesManager2.delegate = self
        
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
        
//      initialise the function called fetchQuotes from quotesManager2 file
        quotesManager2.fetchQuotes()
        
    }
    
    
//        update the quotes from the api
    func didUpdateQuote(_ quotesManager2: QuotesManager2, quote: QuotesModel) {
       
//        in async
        DispatchQueue.main.async {
            self.quotes?.text =  "''\(quote.quoteText)''"
        }

}
    
    func didFailWithError(error: Error) {
        print(error)
    }
    //

    @IBAction func ProudsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToListPage", sender: self)
        
       
    }
    
}
