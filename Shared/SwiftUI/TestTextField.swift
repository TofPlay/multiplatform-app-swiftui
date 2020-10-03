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
                    Check(".textFieldStyle(DefaultTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".multilineTextAlignment(.leading)", .success(os: .iOS), .success(os: .macOS))
                    Check(".multilineTextAlignment(.center)", .success(os: .iOS), .success(os: .macOS))
                    Check(".multilineTextAlignment(.trailing)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".textFieldStyle(PlainTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".textFieldStyle(RoundedBorderTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".textFieldStyle(SquareBorderTextFieldStyle())", .success(os: .macOS))
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
