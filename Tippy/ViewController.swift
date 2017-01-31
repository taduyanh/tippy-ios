//
//  ViewController.swift
//  Tippy
//
//  Created by mac on 1/31/17.
//  Copyright © 2017 anhtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    private var tipPercentages: [Double] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadTipPercentages()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        print("Tapped")
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func loadTipPercentages() {
        tipPercentages = Setting().tipPercentages
        for (index, tipPercentage) in tipPercentages.enumerated() {
            let value = Int(tipPercentage * 100)
            tipControl.setTitle(String(format: "%d%%", value), forSegmentAt: index)
        }
    }

}

