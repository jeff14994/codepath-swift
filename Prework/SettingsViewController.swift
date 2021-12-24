//
//  SettingsViewController.swift
//  Prework
//
//  Created by 洪裕權 on 12/24/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
    @IBOutlet weak var Tip3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Setting Page"
    }
    override func viewDidDisappear(_ animated: Bool) {
        var tip1 = Double(Tip1.text!) ?? 15
        var tip2 = Double(Tip2.text!) ?? 18
        var tip3 = Double(Tip3.text!) ?? 20
        tip1 = tip1 / 100
        tip2 = tip2 / 100
        tip3 = tip3 / 100
        //Access UserDefaults
        let defaults = UserDefaults.standard

        // Set a String value for some key.
        defaults.set(tip1, forKey: "tip1")
        defaults.set(tip2, forKey: "tip2")
        defaults.set(tip3, forKey: "tip3")

        // Force UserDefaults to save.
        defaults.synchronize()
        
    }
    
    



}
