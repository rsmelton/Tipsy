//
//  TotalResultViewController.swift
//  Tipsy
//
//  Created by Scott Melton on 5/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class TotalResultViewController: UIViewController {
    
    var totalCostPerPerson: Float?
    var numberOfPeopleToSplitCostBetween: Int?
    var tipPercentage: Int?
    
    @IBOutlet weak var totalCostPerPersonLabel: UILabel!
    @IBOutlet weak var splitDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalCostPerPersonLabel.text = String(format: "%.2f", totalCostPerPerson!)
        splitDescriptionLabel.text = "Split between \(numberOfPeopleToSplitCostBetween!) people, with \(tipPercentage!)% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
