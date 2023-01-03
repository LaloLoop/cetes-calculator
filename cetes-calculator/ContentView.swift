//
//  ContentView.swift
//  cetes-calculator
//
//  Created by Eduardo Gutiérrez on 2023-01-02.
//

import SwiftUI

struct ContentView: View {
    @State private var amountInput: String = "1000.00"
    @State private var infoText: String = "Amount to invest"
    
    private let cetePrice = 9.92
    private let bonddiaPrice = 1.68
    private let ISR = 0.15
    
    func getEarnings(amount: Double, rate: Double = 0.1010, period: Double = 28) -> Double {
        
        return amount * period * rate / 360
    }
    
    func calculate() {
        let amount = Double(amountInput)
        
        if amount == nil {
            infoText = "Number is not valid"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                infoText = "Please enter a valid number"
            }
            
        } else {
            let earning = getEarnings(amount: amount!)
            
            infoText = "You will get " + String(earning) + " back"
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CETES calculator")
            TextField("Amount to invest",text: $amountInput)
                .padding()
                .keyboardType(.decimalPad)
            Button(action: {calculate()}) {
                Text("Calculate").padding().cornerRadius(40)
            }
            Text(infoText)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
