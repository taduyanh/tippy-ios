//
//  SettingsViewController.swift
//  Tippy
//
//  Created by mac on 1/31/17.
//  Copyright © 2017 anhtd. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipVField: UITextField!
    private var inputs: [UITextField] = []
    private var tipPercentages: [Double] = Setting().tipPercentages
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTipValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTipValue() {
        tipPercentages = Setting().tipPercentages
        inputs = [firstTipField, secondTipField, thirdTipVField]
        for (index, input) in inputs.enumerated() {
            input.text = String(format: "%d", Int(tipPercentages[index] * 100))
        }
    }
    
    @IBAction func onChange(_ sender: UITextField) {
        let index = inputs.index(of: sender)
        let textValue = sender.text ?? "0"
        let newValue = Double(textValue) ?? 0.0
        tipPercentages[index!] = newValue / 100
        Setting().setTipPercentages(tipPercentages)
    }

    @IBAction func onResetClick(_ sender: AnyObject) {
        Setting().reset()
        loadTipValue()
    }
}
