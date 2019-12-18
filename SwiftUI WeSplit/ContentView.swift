//
//  ContentView.swift
//  SwiftUI WeSplit
//
//  Created by Aditya Gupta on 12/18/19.
//  Copyright © 2019 Aditya Gupta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 30]

    @State private var amount = ""
    @State private var peopleIndex = 0
    @State private var tipIndex = 0

    var finalAmount: Double {
        let tip = Double(tipPercentages[tipIndex]) / 100
        let people = Double(peopleIndex + 2)
        let amountPay = Double(amount) ?? 0
        return amountPay
            * tip
        / people
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Amount", text: $amount).keyboardType(.decimalPad)
                    Picker("Number of People", selection: $peopleIndex) {
                        ForEach(0 ..< 10) { i in
                            Text("\(i + 2) People")
                        }
                    }
                }

                Section(header: Text("How much do you want to tip?")) {
                    Picker("Tip Percentage", selection: $tipIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$ \(finalAmount, specifier: "%.2f")")
                }
            }
                .navigationBarTitle("WeSplit")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
