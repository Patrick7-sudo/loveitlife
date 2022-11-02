//
//  EditPageController.swift
//  loveitlife
//
//  Created by tasniim on 01/11/2022.
//




import Foundation
import UIKit

class EditPageController: UIViewController{
    
//    variable
    @IBOutlet weak var textFieldBoxEdit: UITextView!
    @IBOutlet weak var removeEditPage: UIButton!
    @IBOutlet weak var editEditPage: UIButton!
    
    var editText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("this is me")
        //        textfieldstyling
                textFieldBoxEdit.layer.cornerRadius = 25
                textFieldBoxEdit.layer.borderWidth = 2
               
                textFieldBoxEdit.layer.borderColor = UIColor(red: 0.63, green: 0.85, blue: 0.15, alpha: 1.00).cgColor
        //        remove button styling
                removeEditPage.layer.cornerRadius = 15
        //        edit button styling
                editEditPage.layer.cornerRadius = 15
        
//        editText variable to receive data using segue to be edit
        
       
        textFieldBoxEdit.text = editText

    }
    
    //    unwind to previous page
        @IBAction func unwindToViewControllerNameHere(segue: UIStoryboardSegue) {
        }
}
