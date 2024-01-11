//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Patrik Cesnek on 08/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @FocusState private var ammountIsFocused: Bool
    
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
                    .focused($ammountIsFocused)
                    
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
                        ForEach(0..<101, id: \.self) { num in
                            Text(num, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total Amount") {
                    Text(
                        viewModel.totalAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }
                
                Section("Amount per person") {
                    Text(
                        viewModel.totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if ammountIsFocused {
                    Button("Done") {
                        ammountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
