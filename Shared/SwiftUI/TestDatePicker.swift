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
                    Check(iOS: true, macOS: true, test: ".datePickerStyle(DefaultDatePickerStyle())")
                    Check(iOS: false, macOS: false, test: "VStack(alignment: .leading)")
                    Check(iOS: false, macOS: false, test: "VStack(alignment: .center)")
                    Check(iOS: false, macOS: false, test: "VStack(alignment: .trailing)")
                    Check(iOS: false, macOS: false, test: ".multilineTextAlignment(.leading)")
                    Check(iOS: false, macOS: false, test: ".multilineTextAlignment(.center)")
                    Check(iOS: false, macOS: false, test: ".multilineTextAlignment(.trailing)")
                    Check(iOS: false, macOS: false, test: ".frame(.leading)")
                    Check(iOS: false, macOS: false, test: ".frame(.center)")
                    Check(iOS: false, macOS: false, test: ".frame(.trailing)")
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
                    Check(iOS: true, macOS: true, test: ".datePickerStyle(DefaultDatePickerStyle())")
                    Check(iOS: false, macOS: false, test: "HStack + Spacer")
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
                    Check(iOS: true, macOS: true, test: ".datePickerStyle(CompactDatePickerStyle())")
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
                    Check(macOS: true, test: ".datePickerStyle(FieldDatePickerStyle())")
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
                    Check(iOS: false, macOS: true, test: "Well design top and bottom")
                    Check(iOS: true, macOS: true, test: ".datePickerStyle(GraphicalDatePickerStyle())")
                    Check(iOS: false, macOS: true, test: "VStack(alignment: .leading)")
                    Check(iOS: false, macOS: false, test: "VStack(alignment: .center)")
                    Check(iOS: false, macOS: false, test: "VStack(alignment: .trailing)")
                    Check(iOS: false, macOS: true, test: ".frame(.leading)")
                    Check(iOS: false, macOS: false, test: ".frame(.center)")
                    Check(iOS: false, macOS: false, test: ".frame(.trailing)")
                    Check(iOS: false, macOS: false, test: "Spacer() left")
                    Check(iOS: false, macOS: true, test: "Spacer() right")
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
                    Check(macOS: true, test: ".datePickerStyle(StepperFieldDatePickerStyle())")
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
                    Check(iOS: true, test: ".datePickerStyle(WheelDatePickerStyle())")
                    Check(iOS: false, test: "VStack(alignment: .leading)")
                    Check(iOS: false, test: "VStack(alignment: .center)")
                    Check(iOS: false, test: "VStack(alignment: .trailing)")
                    Check(iOS: false, test: ".frame(.leading)")
                    Check(iOS: false, test: ".frame(.center)")
                    Check(iOS: false, test: ".frame(.trailing)")
                    Check(iOS: false, test: "Spacer() left")
                    Check(iOS: false, test: "Spacer() right")
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
