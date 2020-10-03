//
//  TestDatePicker.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestDatePicker: View {
    var body: some View {
        TestBody(test: .datePicker) {
            TestCase("DatePicker .datePickerStyle(DefaultDatePickerStyle())", alignment: .leading) {
                VStack {
                    VStack(alignment: .leading) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(DefaultDatePickerStyle())
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .leading)
                    }
                    
                    VStack(alignment: .center) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(DefaultDatePickerStyle())
                            .multilineTextAlignment(.center)
                            .frame(alignment: .center)
                    }
                    
                    VStack(alignment: .trailing) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(DefaultDatePickerStyle())
                            .multilineTextAlignment(.trailing)
                            .frame(alignment: .trailing)
                    }
                }
                .frame(width: 300)
                .border(Color.red)
                
                TestResult {
                    Check(".datePickerStyle(DefaultDatePickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("VStack(alignment: .leading)", .error(os: .iOS), .error(os: .macOS))
                    Check("VStack(alignment: .center)", .error(os: .iOS), .error(os: .macOS))
                    Check("VStack(alignment: .trailing)", .error(os: .iOS), .error(os: .macOS))
                    Check(".multilineTextAlignment(.leading)", .error(os: .iOS), .error(os: .macOS))
                    Check(".multilineTextAlignment(.center)", .error(os: .iOS), .error(os: .macOS))
                    Check(".multilineTextAlignment(.trailing)", .error(os: .iOS), .error(os: .macOS))
                    Check(".frame(.leading)", .error(os: .iOS), .error(os: .macOS))
                    Check(".frame(.center)", .error(os: .iOS), .error(os: .macOS))
                    Check(".frame(.trailing)", .error(os: .iOS), .error(os: .macOS))
                }
            }
            
            TestCase("DatePicker .datePickerStyle(DefaultDatePickerStyle()) and Spacer", alignment: .leading) {
                VStack {
                    HStack {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(DefaultDatePickerStyle())
                        
                        Spacer()
                    }
                }
                .frame(width: 300)
                .border(Color.red)

                TestResult {
                    Check(".datePickerStyle(DefaultDatePickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("HStack + Spacer", .error(os: .iOS), .error(os: .macOS))
                }
            }
            
            TestCase("DatePicker .datePickerStyle(CompactDatePickerStyle())", alignment: .leading) {
                VStack {
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(CompactDatePickerStyle())
                }
                .frame(width: 300)
                .border(Color.red)

                TestResult {
                    Check(".datePickerStyle(CompactDatePickerStyle())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("DatePicker .datePickerStyle(FieldDatePickerStyle())", alignment: .leading) {
                #if os(macOS)
                VStack {
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(FieldDatePickerStyle())
                }
                .frame(width: 300)
                .border(Color.red)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
                TestResult {
                    Check(".datePickerStyle(FieldDatePickerStyle())", .success(os: .macOS))
                }
            }
            
            TestCase("DatePicker .datePickerStyle(GraphicalDatePickerStyle())", alignment: .leading) {
                Group {
                    Text("Leading")
                    VStack(alignment: .leading) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(alignment: .leading)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Center")
                    VStack(alignment: .center) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(alignment: .center)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Trailing")
                    VStack(alignment: .trailing) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(alignment: .trailing)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                }
                
                Group {
                    Text("Spacer() left")
                    HStack {
                        Spacer()
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Spacer() right")
                    HStack {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(GraphicalDatePickerStyle())
                        Spacer()
                    }
                    .frame(width: 500)
                    .border(Color.red)
                }
                
                TestResult {
                    Check("Well design top and bottom", .error(os: .iOS), .success(os: .macOS))
                    Check(".datePickerStyle(GraphicalDatePickerStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("VStack(alignment: .leading)", .error(os: .iOS), .success(os: .macOS))
                    Check("VStack(alignment: .center)", .error(os: .iOS), .error(os: .macOS))
                    Check("VStack(alignment: .trailing)", .error(os: .iOS), .error(os: .macOS))
                    Check(".frame(.leading)", .error(os: .iOS), .success(os: .macOS))
                    Check(".frame(.center)", .error(os: .iOS), .error(os: .macOS))
                    Check(".frame(.trailing)", .error(os: .iOS), .error(os: .macOS))
                    Check("Spacer() left", .error(os: .iOS), .error(os: .macOS))
                    Check("Spacer() right", .error(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("DatePicker .datePickerStyle(StepperFieldDatePickerStyle())", alignment: .leading) {
                #if os(macOS)
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(StepperFieldDatePickerStyle())
                    .frame(width: 150)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(".datePickerStyle(StepperFieldDatePickerStyle())", .success(os: .macOS))
                }
            }

            TestCase("DatePicker .datePickerStyle(WheelDatePickerStyle())", alignment: .leading) {
                #if os(iOS)
                Group {
                    Text("Leading")
                    VStack(alignment: .leading) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(alignment: .leading)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Center")
                    VStack(alignment: .center) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(alignment: .center)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Trailing")
                    VStack(alignment: .trailing) {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(alignment: .trailing)
                    }
                    .frame(width: 500)
                    .border(Color.red)
                }
                
                Group {
                    Text("Spacer() left")
                    HStack {
                        Spacer()
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    .frame(width: 500)
                    .border(Color.red)
                    
                    Text("Spacer() right")
                    HStack {
                        DatePicker("", selection: .constant(Date()))
                            .datePickerStyle(WheelDatePickerStyle())
                        Spacer()
                    }
                    .frame(width: 500)
                    .border(Color.red)
                }
                #else
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(".datePickerStyle(WheelDatePickerStyle())", .success(os: .iOS))
                    Check("VStack(alignment: .leading)", .error(os: .iOS))
                    Check("VStack(alignment: .center)", .error(os: .iOS))
                    Check("VStack(alignment: .trailing)", .error(os: .iOS))
                    Check(".frame(.leading)", .error(os: .iOS))
                    Check(".frame(.center)", .error(os: .iOS))
                    Check(".frame(.trailing)", .error(os: .iOS))
                    Check("Spacer() left", .error(os: .iOS))
                    Check("Spacer() right", .error(os: .iOS))
                }
            }
        }
    }
}

struct TestDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        TestDatePicker()
    }
}
