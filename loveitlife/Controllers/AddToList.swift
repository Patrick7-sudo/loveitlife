//
//  AddToList.swift
//  loveitlife
//
//  Created by tasniim on 01/11/2022.
//


import Foundation
import UIKit
import Firebase

class AddToList: UIViewController{
    
   
    @IBOutlet weak var textFieldToAdd: UITextView!
    @IBOutlet weak var addButtonAddPage: UIButton!

//    database variable initiation
        let db = Firestore.firestore()
    
    var userOptionAdd : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textfieldstyling
        textFieldToAdd.layer.cornerRadius = 25
        textFieldToAdd.layer.borderWidth = 2
       
        textFieldToAdd.layer.borderColor = UIColor(red: 0.63, green: 0.85, blue: 0.15, alpha: 1.00).cgColor
//        button styling
        addButtonAddPage.layer.cornerRadius = 15
        
    
    }
    
//    create a database if it does not exist and add the data into the database
    @IBAction func addToDatabase(_ sender: Any) {

//            addtoproudList
            //        collect user email and user input
            if let messageBody = textFieldToAdd.text, let messageSender = Auth.auth().currentUser?.email {
                db.collection("quote").addDocument(data: ["sender" : messageSender, "body" : messageBody]){
                    (error) in
                    if let e = error {
                        print("There is a problem adding/initatie the database \(e)")
                    } else {
                        print("Successfully added the data into the database")
                    }
                }
                
//            end addtoproudList
}
        
        
   

    }
    
    //    unwind to previous page
        @IBAction func unwindToViewControllerNameHere(segue: UIStoryboardSegue) {
        }
}
