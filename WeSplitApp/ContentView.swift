//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Patrik Cesnek on 08/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $viewModel.checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $viewModel.numberOfPeople) {
                        ForEach(2..<100, id: \.self) { people in
                            Text("\(people) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    Picker(
                        "Tip Percentage",
                        selection: $viewModel.tipPercentage
                    ) {
                        ForEach(viewModel.tipPercentages, id: \.self) { num in
                            Text(num, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(
                        viewModel.totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
