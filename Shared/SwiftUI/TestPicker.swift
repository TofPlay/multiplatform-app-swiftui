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
                .frame(width: 500)
                .border(Color.red)

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(DefaultPickerStyle())")
                    Check(iOS: true, macOS: true, test: ".frame(width: 500)")
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
                .frame(width: 500, alignment: .leading)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(InlinePickerStyle())
                .frame(width: 500, alignment: .center)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(InlinePickerStyle())
                .frame(width: 500, alignment: .trailing)
                .border(Color.red)

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(InlinePickerStyle())")
                    Check(iOS: false, macOS: true, test: ".frame(width: 500,alignment: .leading)")
                    Check(iOS: true, macOS: true, test: ".frame(width: 500,alignment: .center)")
                    Check(iOS: false, macOS: true, test: ".frame(width: 500,alignment: .trailing)")
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
                .frame(width: 500,alignment: .leading)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 500,alignment: .center)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 500,alignment: .trailing)
                .border(Color.red)
                
                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(MenuPickerStyle())")
                    Check(iOS: true, macOS: true, test: ".frame(width: 500,alignment: .leading)")
                    Check(iOS: true, macOS: false, test: ".frame(width: 500,alignment: .center)")
                    Check(iOS: true, macOS: false, test: ".frame(width: 500,alignment: .trailing)")
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
                .frame(width: 500)
                .border(Color.red)

                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(macOS: true, test: ".pickerStyle(PopUpButtonPickerStyle())")
                    Check(macOS: true, test: ".frame(width: 500)")
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
                .frame(width: 500, alignment: .leading)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(RadioGroupPickerStyle())
                .frame(width: 500, alignment: .center)
                .border(Color.red)

                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) {
                        flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                .pickerStyle(RadioGroupPickerStyle())
                .frame(width: 500, alignment: .trailing)
                .border(Color.red)

                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(macOS: true, test: ".pickerStyle(RadioGroupPickerStyle())")
                    Check(macOS: true, test: ".frame(width: 500,alignment: .leading)")
                    Check(macOS: true, test: ".frame(width: 500,alignment: .center)")
                    Check(macOS: true, test: ".frame(width: 500,alignment: .trailing)")
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
                .frame(width: 500)
                .border(Color.red)

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(iOS: true, macOS: true, test: ".pickerStyle(SegmentedPickerStyle())")
                    Check(iOS: true, macOS: true, test: ".frame(width: 500)")
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
                .frame(width: 500)
                .border(Color.red)

                #else
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
                #endif

                Text("Selected flavor: \(selectedFlavor.rawValue)")
                
                TestResult {
                    Check(iOS: true, test: ".pickerStyle(WheelPickerStyle())")
                    Check(iOS: true, test: ".frame(width: 500)")
                }
            }

        }
    }
}

struct TestPicker_Previews: PreviewProvider {
    static var previews: some View {
        TestPicker()
    }
}
