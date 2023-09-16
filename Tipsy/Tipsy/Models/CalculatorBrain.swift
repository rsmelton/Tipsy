//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Scott Melton on 5/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var costStats: CostStatsBrain?
    
    mutating func calculateTotalCostPerPerson (totalBillCost: Float, numberOfPeopleToSplitCostBetween: Int, tipPercentage: Int) {
        let totalCostPerPerson = (totalBillCost + (totalBillCost * (Float(tipPercentage) / 100.0))) / Float(numberOfPeopleToSplitCostBetween)
        costStats = CostStatsBrain(totalCostPerPerson: totalCostPerPerson, numberOfPeopleToSplitCostBetween: numberOfPeopleToSplitCostBetween, tipPercentage: tipPercentage)
    }
    
    func getTotalCostPerPerson () -> Float {
        return costStats?.totalCostPerPerson ?? 0.0
    }
    
    func getNumberOfPeopleToSplitCostBetween () -> Int {
        return costStats?.numberOfPeopleToSplitCostBetween ?? 2
    }
    
    func getTipPercentage () -> Int {
        return costStats?.tipPercentage ?? 0
    }
    
}
