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
                    TextField("Amount", value: $viewModel.checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                Section {

                }
                
                Section {
                    
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
