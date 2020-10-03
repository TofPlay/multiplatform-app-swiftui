//
//  TestSecureField.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestSecureField: View {
    @State var password: String = "my super secure password!"
    
    var body: some View {
        TestBody(test: .secureField) {
            TestCase("TextField .textFieldStyle(DefaultTextFieldStyle())") {
                HStack {
                    Text("Password:")
                    SecureField("Enter your password", text: $password)
                        .frame(width: 150)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                TestResult {
                    Check(".textFieldStyle(DefaultTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            TestCase("TextField .textFieldStyle(PlainTextFieldStyle())") {
                HStack {
                    Text("Password:")
                    SecureField("Enter your password", text: $password)
                        .frame(width: 150)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                TestResult {
                    Check(".textFieldStyle(PlainTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            TestCase("TextField .textFieldStyle(RoundedBorderTextFieldStyle())") {
                HStack {
                    Text("Password:")
                    SecureField("Enter your password", text: $password)
                        .frame(width: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                TestResult {
                    Check(".textFieldStyle(RoundedBorderTextFieldStyle())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            TestCase("TextField .textFieldStyle(SquareBorderTextFieldStyle())") {
                #if os(macOS)
                HStack {
                    Text("Password:")
                    SecureField("Enter your password", text: $password)
                        .frame(width: 150)
                        .textFieldStyle(SquareBorderTextFieldStyle())
                }
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
                
                TestResult {
                    Check(".textFieldStyle(SquareBorderTextFieldStyle())", .success(os: .macOS))
                }
            }
            Text("You enter: \(password)")
        }
    }
}

struct TestSecureField_Previews: PreviewProvider {
    static var previews: some View {
        TestSecureField()
    }
}
