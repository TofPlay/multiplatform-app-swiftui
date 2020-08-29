//
//  TestDatePicker.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestDatePicker: View {
    var body: some View {
        TestBody(feature: .datePicker) {
            #if os(macOS)
            TestItem("DatePicker .datePickerStyle(DefaultDatePickerStyle())", alignment: .leading) {
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
                    Check(valid:  true, test: ".datePickerStyle(DefaultDatePickerStyle())")
                    Check(valid:  false, test: "VStack(alignment: .leading)")
                    Check(valid:  false, test: "VStack(alignment: .center)")
                    Check(valid:  false, test: "VStack(alignment: .trailing)")
                    Check(valid:  false, test: ".multilineTextAlignment(.leading)")
                    Check(valid:  false, test: ".multilineTextAlignment(.center)")
                    Check(valid:  false, test: ".multilineTextAlignment(.trailing)")
                    Check(valid:  false, test: ".frame(.leading)")
                    Check(valid:  false, test: ".frame(.center)")
                    Check(valid:  false, test: ".frame(.trailing)")
                }
            }
            #else
            TestItem("DatePicker .datePickerStyle(DefaultDatePickerStyle())", alignment: .leading) {
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
                    Check(valid:  true, test: ".datePickerStyle(DefaultDatePickerStyle())")
                    Check(valid:  false, test: "VStack(alignment: .leading)")
                    Check(valid:  false, test: "VStack(alignment: .center)")
                    Check(valid:  false, test: "VStack(alignment: .trailing)")
                    Check(valid:  false, test: ".multilineTextAlignment(.leading)")
                    Check(valid:  false, test: ".multilineTextAlignment(.center)")
                    Check(valid:  false, test: ".multilineTextAlignment(.trailing)")
                    Check(valid:  false, test: ".frame(.leading)")
                    Check(valid:  false, test: ".frame(.center)")
                    Check(valid:  false, test: ".frame(.trailing)")
                }
            }
            
            TestItem("DatePicker .datePickerStyle(DefaultDatePickerStyle()) and Spacer", alignment: .leading) {
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
                    Check(valid:  true, test: ".datePickerStyle(DefaultDatePickerStyle())")
                    Check(valid:  false, test: "HStack + Spacer")
                }
            }
            #endif
            
            #if os(macOS)
            TestItem("DatePicker .datePickerStyle(CompactDatePickerStyle())", alignment: .leading) {
                VStack {
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(CompactDatePickerStyle())
                }
                .frame(width: 300)
                .border(Color.red)

                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(CompactDatePickerStyle())")
                }
            }
            #else
            TestItem("DatePicker .datePickerStyle(CompactDatePickerStyle())", alignment: .leading) {
                VStack {
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(CompactDatePickerStyle())
                }
                .frame(width: 300)
                .border(Color.red)

                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(CompactDatePickerStyle())")
                }
            }
            #endif
            
            #if os(macOS)
            TestItem("DatePicker .datePickerStyle(FieldDatePickerStyle())", alignment: .leading) {
                VStack {
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(FieldDatePickerStyle())
                }
                .frame(width: 300)
                .border(Color.red)

                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(FieldDatePickerStyle())")
                }
            }
            #else
            TestItem("DatePicker .datePickerStyle(FieldDatePickerStyle())", alignment: .leading) {
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
            }
            #endif
            
            #if os(iOS)
            TestItem("DatePicker .datePickerStyle(GraphicalDatePickerStyle())", alignment: .leading) {
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(GraphicalDatePickerStyle())

                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(GraphicalDatePickerStyle())")
                    Check(valid:  false, test: "DatePicker display is not done well at the top and at the bottom")
                }
            }
            #else
            TestItem("DatePicker .datePickerStyle(GraphicalDatePickerStyle())", alignment: .leading) {
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
                    Check(valid:  true, test: ".datePickerStyle(GraphicalDatePickerStyle())")
                    Check(valid:  true, test: "VStack(alignment: .leading)")
                    Check(valid:  false, test: "VStack(alignment: .center)")
                    Check(valid:  false, test: "VStack(alignment: .trailing)")
                    Check(valid:  true, test: ".frame(.leading)")
                    Check(valid:  false, test: ".frame(.center)")
                    Check(valid:  false, test: ".frame(.trailing)")
                    Check(valid:  false, test: "Spacer() left")
                    Check(valid:  true, test: "Spacer() right")
                }
            }
            #endif
            
            #if os(macOS)
            TestItem("DatePicker .datePickerStyle(StepperFieldDatePickerStyle())", alignment: .leading) {
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(StepperFieldDatePickerStyle())
                    .frame(width: 150)
                
                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(StepperFieldDatePickerStyle())")
                }
            }
            #else
            TestItem("DatePicker .datePickerStyle(StepperFieldDatePickerStyle())", alignment: .leading) {
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
            }
            #endif
            
            #if os(iOS)
            TestItem("DatePicker .datePickerStyle(WheelDatePickerStyle())", alignment: .leading) {
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
                
                TestResult {
                    Check(valid:  true, test: ".datePickerStyle(WheelDatePickerStyle())")
                    Check(valid:  false, test: "VStack(alignment: .leading)")
                    Check(valid:  false, test: "VStack(alignment: .center)")
                    Check(valid:  false, test: "VStack(alignment: .trailing)")
                    Check(valid:  false, test: ".frame(.leading)")
                    Check(valid:  false, test: ".frame(.center)")
                    Check(valid:  false, test: ".frame(.trailing)")
                    Check(valid:  false, test: "Spacer() left")
                    Check(valid:  false, test: "Spacer() right")
                }
            }
            #endif
        }
    }
}

struct TestDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        TestDatePicker()
    }
}
