//
//  ContentView.swift
//  ChallengeDay1
//
//  Created by Mac User on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var convertFromImperial = "Inch"
    @State private var convertToMetric = "Millimeter"
    
    
    let convertFromImperialList = ["Inch": 25.4, "Foot": 304.8, "Yard": 914.4, "Mile": 1609344]
    let convertToMetricList: [String: Double] = ["Millimeter": 1, "Centimeter": 10, "Meter": 1000, "Kilometer": 1000000]
    
    var outputValue: Double {
        if (inputValue != 0) {
            return (convertFromImperialList[convertFromImperial]! * inputValue) / convertToMetricList[convertToMetric]!
        }
        else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Input
                Section {
                    TextField("Amount", value: $inputValue, format: .number)
                }
                
                // Convert from imperial
                Section {
                    Picker("Convert from imperial", selection: $convertFromImperial) {
                        ForEach(Array(convertFromImperialList.keys), id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Convert from imperial")
                }
                
                // Convert to metric
                Section {
                    Picker("Convert from imperial", selection: $convertToMetric) {
                        ForEach(Array(convertToMetricList.keys), id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Convert to metric")
                }
                
                // Computed output
                Section {
                    Text(outputValue, format: .number).bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
