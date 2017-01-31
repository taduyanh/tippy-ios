//
//  Setting.swift
//  Tippy
//
//  Created by mac on 1/31/17.
//  Copyright © 2017 anhtd. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    var tipPercentages: [Double] {
        get {
            return defaults.array(forKey: key) as! [Double]
        }
    }
    private var defaults: UserDefaults;
    private var key = "tip_percentage"
    private var defaultValues = [0.18, 0.2, 0.25]
    init() {
        defaults = UserDefaults.standard
        let values = defaults.array(forKey: key)
        if values == nil {
            defaults.set(tipPercentages, forKey: key)
            defaults.synchronize()
        }
    }
    
    func setTipPercentages(_ values: [Double]) {
        defaults.set(values, forKey: key)
        defaults.synchronize()
    }
    
    func reset() {
        setTipPercentages(defaultValues)
    }
    
}
