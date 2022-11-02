//
//  ListController.swift
//  loveitlife
//
//  Created by tasniim on 31/10/2022.
//

import Foundation
import UIKit
import Firebase



class ListController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonPage: UIButton!
    
    @IBOutlet weak var removeAllButton: UIButton!
    
//    database variable initiation
    let db = Firestore.firestore()
    
    
//    choose database to display
    var userOption : String?
 
    
    var messages: [Message] = [
        Message(sender : "vid@booboo.com", body: "I am happy"),
        Message(sender : "vid@booboo.com", body: "I am grateful"),
        Message(sender : "vid@booboo.com", body: "I am hungry")
    ]
    
    override func viewDidLoad() {
        
        

        super.viewDidLoad()
        
    
        
//        button Styling
        removeAllButton.layer.cornerRadius = 15
        
        //        using delegate
        tableView.delegate = self
        //        lets the table load it self when its start
        tableView.dataSource = self
        
//        table view design
        tableView.layer.cornerRadius = 25
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Reusable")
        
        loadQuotes()
      
//        print(userOption)
    }
    
//    adding the message into the array we have and loaded it when new one added it and reload the tableview
    
    func loadQuotes() {
         

        db.collection("quote").addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("There was an issue retriving data. \(e)")
            } else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                    let data = doc.data()
                    if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String {
                        let newQuote = Message(sender: messageSender, body: messageBody)
                        self.messages.append(newQuote)
                        
//                        update the tableview async
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    }
                }
                
            }
            
            
        }
    }

        
       
    
//    add button to different page
    
    @IBAction func addButtonRedirect(_ sender: Any) {
        performSegue(withIdentifier: "goToAddList", sender: self)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        var destinationVC = segue.destination as! AddToList
//
//        destinationVC.userOptionAdd = userOption
//
//    }

    
//    remove all button temporary
    
    @IBAction func removeAllFunction(_ sender: Any) {
       
    }
    
//    @IBAction func returnToPrev(_ sender: Any) {
//        performSegue(withIdentifier: "unwindToOption", sender: self)
//    }
//
//    unwind to previous page
    @IBAction func unwindToViewControllerNameHere(segue: UIStoryboardSegue) {
    }
  
}

extension ListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reusable", for: indexPath) as! TableViewCell
//  temporary text to send it back to edit side
//        let labelEdit =
        cell.labelInput?.text = messages[indexPath.row].body
        
        
//        adding functionality to our button to perform segue
        cell.addButtonTapAction = {
                    // implement your logic here, e.g. call preformSegue()
            self.performSegue(withIdentifier: "goToEditPageTemp", sender: self)
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?){
                if segue.identifier == "goToEditPageTemp" {

                     
                   
    //                AS is a downcasting ! forcing to resultViewController
                    let destinationVC = segue.destination as! EditPageController
    //                look into the file andsearch the varaible with bmiValue and update it with new one
    //                currently we get the value from struct from different file where we done all the functions
                    destinationVC.editText = self.messages[indexPath.row].body
                }
                   
            }
        }
        
     

        return cell
    }
}

//table view delegate so if someone click on specific template it will run this function
extension ListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
       

         }
    }
    
   
 

