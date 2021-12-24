//
//  ViewController.swift
//  Prework
//
//  Created by 洪裕權 on 12/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        // Change Tip Control with user's inputs
        tipControl.setTitle(String(tip1*100) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(tip2*100) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(tip3*100) + "%", forSegmentAt: 2)
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        print("tip1: ", tip1)
        print("tip2: ", tip2)
        print("tip3: ", tip3)
        // Change Tip Control with user's inputs
        tipControl.setTitle(String(tip1*100) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(tip2*100) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(tip3*100) + "%", forSegmentAt: 2)
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        // Update Tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

