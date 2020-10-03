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
                    Check(".pickerStyle(DefaultPickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".pickerStyle(InlinePickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .leading)", .error(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .center)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .trailing)", .error(os: .iOS), .success(os: .macOS))
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
                    Check(".pickerStyle(MenuPickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .leading)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .center)", .success(os: .iOS), .error(os: .macOS))
                    Check(".frame(width: 500,alignment: .trailing)", .success(os: .iOS), .error(os: .macOS))
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
                    Check(".pickerStyle(PopUpButtonPickerStyle())", .success(os: .macOS))
                    Check(".frame(width: 500)", .success(os: .macOS))
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
                    Check(".pickerStyle(RadioGroupPickerStyle())", .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .leading)", .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .center)", .success(os: .macOS))
                    Check(".frame(width: 500,alignment: .trailing)", .success(os: .macOS))
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
                    Check(".pickerStyle(SegmentedPickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 500)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".pickerStyle(WheelPickerStyle())", .success(os: .iOS))
                    Check(".frame(width: 500)", .success(os: .iOS))
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
