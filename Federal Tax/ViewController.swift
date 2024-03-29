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
    var taxOwed: Double = 0
    var taxRate: Double = 0
    
    // MARK: METHODS
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }

    // When "Calculate Tax Owing" button is pressed
    @IBAction func calculateButton(_ sender: Any) {
        
        // Convert Name to string
        guard let nameAsString = nameLabel.text else {
                   bottomLabel.text = "Enter a Name"
                   return
               }
        
        if nameAsString == "" {
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
        
        // If the value is negative it will stop and ask the user to enter a proper value
        if incomeAsDouble < 0 {
            bottomLabel.text = "Enter a Posistive Number"
            return
        }
        
        // Switch statement to decide what tax is applied to what money
        switch incomeAsDouble {
        case 0...47_630:
            taxOwed = incomeAsDouble * 0.15
        case 47_631...95_259:
            taxOwed = ((incomeAsDouble - 47_630) * 0.205) + (47_630 * 0.15)
        case 95_260...147_667:
            taxOwed = ((incomeAsDouble - 95_259) * 0.26) + (47_629 * 0.205) + (47_630 * 0.15)
        case 147_668...210_371:
            taxOwed = ((incomeAsDouble - 147_668) * 0.29) + 30534.525
        case 210_372...:
            taxOwed = ((incomeAsDouble - 210_372) * 0.33) + 48718.685
        default:
            return
        }
        
        taxRate = (taxOwed / incomeAsDouble) * 1000
        taxRate = (round(taxRate)) / 10
        
        bottomLabel.text = String(format: "\(nameAsString) federal tax owing is $%.2f", taxOwed) + "\n" + "\n" + "Effective tax rate is %\(taxRate)"

        
        
    }


}

