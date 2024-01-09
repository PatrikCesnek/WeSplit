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
    
    let tipPercentages = [10, 15, 20, 25, 0]
}
