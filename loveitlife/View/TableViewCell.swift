//
//  TableViewCell.swift
//  loveitlife
//
//  Created by tasniim on 31/10/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var labelInput: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        main container style
        cellContainer.layer.cornerRadius = 25
        cellContainer.layer.borderWidth = 2
        cellContainer.layer.borderColor = UIColor(red: 0.40, green: 0.47, blue: 0.24, alpha: 1.00).cgColor
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func editButton(_ sender: Any) {
//        print("hellomeh")
//        performSegue(withIdentifier: "goToWelcomePage", sender: self)
//    }
    
    @IBAction func onAddToCartPressed(_ sender: Any) {
               addButtonTapAction?()
           }

           var addButtonTapAction : (()->())?
    
}
