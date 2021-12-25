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
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBAction func stepper(_ sender: UIStepper) {
        people.text = String(Int(sender.value))
    }
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var downView: UILabel!
    // Use IBOutlet to get stepper attribute
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBAction func resetButton(_ sender: Any) {
        billAmountTextField.text = nil
        // Reset people label
        people.text = String(1)
        // Reset stepper value
        stepperOutlet.value = 0
    }
    // Update when inserting Bill Amount
    @IBAction func textOnChange(_ sender: Any) {
        calculate()
    }
    // Update when updating the stepper
    @IBAction func peopleOnChange(_ sender: Any) {
        calculate()
    }
    
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
        tipControl.setTitle(String(Int(tip1*100)) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(Int(tip2*100)) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(Int(tip3*100)) + "%", forSegmentAt: 2)
        // First Responder
        billAmountTextField.becomeFirstResponder()
        // Get number-only keyboard
        billAmountTextField.keyboardType = .numberPad

        // Round the upper and down View
        upperView.layer.cornerRadius = 10
        downView.layer.cornerRadius = 10
        // Label Corner
        people.layer.cornerRadius = 5
        people.layer.masksToBounds = true
        // Border width and color
        downView.layer.borderWidth = 1
        downView.layer.borderColor = UIColor.systemBlue.cgColor
    }

    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }
    func calculate() {
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        // Convert people to integer
        let people = Double(people.text!) ?? 1
//        print("tip1: ", tip1)
//        print("tip2: ", tip2)
//        print("tip3: ", tip3)
        // Change Tip Control with user's inputs
        tipControl.setTitle(String(Int(tip1*100)) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(Int(tip2*100)) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(Int(tip3*100)) + "%", forSegmentAt: 2)
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        let average = total / people
        // Update Tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update average amount
        averageLabel.text = String(format: "$%.2f", average)
        
    }
    
}

