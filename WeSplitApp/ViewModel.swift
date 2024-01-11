//
//  ViewModel.swift
//  WeSplitApp
//
//  Created by Patrik Cesnek on 09/01/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var checkAmount = 0.0
    @Published var numberOfPeople = 2
    @Published var tipPercentage = 20
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        totalPerPerson * Double(numberOfPeople)
    }
}
