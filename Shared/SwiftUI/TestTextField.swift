//
//  TestTextField.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestTextField: View {
    @State var name: String = "John Doe"
    
    var body: some View {
        TestBody(test: .textField) {
            TestCase("TextField .textFieldStyle(DefaultTextFieldStyle()") {
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .multilineTextAlignment(.leading)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }

                TestResult {
                    Check(iOS: true, macOS: true, test: ".textFieldStyle(DefaultTextFieldStyle())")
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.leading)")
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.center)")
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.trailing)")
                }
            }
            TestCase("TextField .textFieldStyle(PlainTextFieldStyle())") {
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(PlainTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                TestResult {
                    Check(iOS: true, macOS: true, test: ".textFieldStyle(PlainTextFieldStyle())")
                }
            }
            TestCase("TextField .textFieldStyle(RoundedBorderTextFieldStyle())") {
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                TestResult {
                    Check(iOS: true, macOS: true, test: ".textFieldStyle(RoundedBorderTextFieldStyle())")
                }
            }
            TestCase("TextField .textFieldStyle(SquareBorderTextFieldStyle())") {
                #if os(macOS)
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(SquareBorderTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(macOS: true, test: ".textFieldStyle(SquareBorderTextFieldStyle())")
                }
            }
            Text("You enter: \(name)")
        }
    }
}

struct TestTextField_Previews: PreviewProvider {
    static var previews: some View {
        TestTextField()
    }
}
