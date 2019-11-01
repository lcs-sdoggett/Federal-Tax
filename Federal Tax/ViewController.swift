//
//  ViewController.swift
//  Federal Tax
//
//  Created by Doggett, Scott on 2019-10-31.
//  Copyright © 2019 Doggett, Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: PROPERTIES
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var incomeLabel: UITextField!
    @IBOutlet weak var bottomLabel: UILabel!
    
    // MARK: METHODS

    // When "Calculate Tax Owing" button is pressed
    @IBAction func calculateButton(_ sender: Any) {
        
        // Convert Name to string
         guard let nameAsString = nameLabel.text else {
                   bottomLabel.text = "Enter a Name"
                   return
               }
        
        // Convert income to double
        guard let incomeAsString = incomeLabel.text else {
                   bottomLabel.text = "Enter an Income"
                   return
               }
        // Continue
        guard let incomeAsDouble = Double(incomeAsString) else {
            bottomLabel.text = "Enter a Number"
            return
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

