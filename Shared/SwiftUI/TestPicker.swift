//
//  TestPicker.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestPicker: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry
        
        var id: String { self.rawValue }
    }
    
    @State private var selectedFlavor = Flavor.chocolate
    
    var body: some View {
        TestBody(test: .picker) {
            TestCase("Picker .pickerStyle(DefaultPickerStyle())") {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(DefaultPickerStyle())

                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(DefaultPickerStyle())")
                }
            }
            TestCase("Picker .pickerStyle(InlinePickerStyle())") {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(InlinePickerStyle())

                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(InlinePickerStyle())")
                }
            }
            TestCase("Picker .pickerStyle(MenuPickerStyle())") {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(MenuPickerStyle())")
                }
            }
            TestCase("Picker .pickerStyle(PopUpButtonPickerStyle())") {
                #if os(macOS)
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(PopUpButtonPickerStyle())

                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(macOS: true, test: ".pickerStyle(PopUpButtonPickerStyle())")
                }
            }
            TestCase("Picker .pickerStyle(RadioGroupPickerStyle())") {
                #if os(macOS)
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(RadioGroupPickerStyle())

                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(macOS: true, test: ".pickerStyle(RadioGroupPickerStyle())")
                }
            }
            TestCase("Picker .pickerStyle(SegmentedPickerStyle())") {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(SegmentedPickerStyle())")
                }
            }
            
            TestCase("Picker .pickerStyle(WheelPickerStyle())") {
                #if os(iOS)
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(WheelPickerStyle())

                #else
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(iOS: true, test: ".pickerStyle(WheelPickerStyle())")
                }
            }
            Text("Selected flavor: \(selectedFlavor.rawValue)")            }
    }
}

struct TestPicker_Previews: PreviewProvider {
    static var previews: some View {
        TestPicker()
    }
}
