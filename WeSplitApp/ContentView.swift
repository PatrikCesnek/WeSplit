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
                
                Section {
                    Text(
                        viewModel.checkAmount,
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
