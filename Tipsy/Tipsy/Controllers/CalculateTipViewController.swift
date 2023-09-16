//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateTipViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var numberOfPeopleToSplitBetweenLabel: UILabel!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func zeroPercentTipButtonPressed(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        zeroPercentButton.isSelected = true
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    @IBAction func tenPercentTipButtonPressed(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = true
        twentyPercentButton.isSelected = false
    }
    
    @IBAction func twentyPercentTipButtonPressed(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = true
    }
    
    @IBAction func addOrSubtractSplitButtonPressed(_ sender: UIStepper) {
        billTotalTextField.endEditing(true)
        numberOfPeopleToSplitBetweenLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let totalBillCost = Float(billTotalTextField.text!) ?? 0.0
        let numberOfPeopleToSplitCostBetween = Int(numberOfPeopleToSplitBetweenLabel.text!) ?? 2
        
        if (zeroPercentButton.isSelected) {
            let tipPercentage = 0
            calculatorBrain.calculateTotalCostPerPerson(totalBillCost: totalBillCost, numberOfPeopleToSplitCostBetween: numberOfPeopleToSplitCostBetween, tipPercentage: tipPercentage)
        } else if (tenPercentButton.isSelected) {
            let tipPercentage = 10
            calculatorBrain.calculateTotalCostPerPerson(totalBillCost: totalBillCost, numberOfPeopleToSplitCostBetween: numberOfPeopleToSplitCostBetween, tipPercentage: tipPercentage)
        } else if (twentyPercentButton.isSelected) {
            let tipPercentage = 20
            calculatorBrain.calculateTotalCostPerPerson(totalBillCost: totalBillCost, numberOfPeopleToSplitCostBetween: numberOfPeopleToSplitCostBetween, tipPercentage: tipPercentage)
        }
        self.performSegue(withIdentifier: "goToTotalResultView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotalResultView" {
            let destinationVC = segue.destination as! TotalResultViewController
            destinationVC.totalCostPerPerson = calculatorBrain.getTotalCostPerPerson()
            destinationVC.numberOfPeopleToSplitCostBetween = calculatorBrain.getNumberOfPeopleToSplitCostBetween()
            destinationVC.tipPercentage = calculatorBrain.getTipPercentage()
        }
    }
    
}

