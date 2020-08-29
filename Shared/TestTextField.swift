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
        TestBody(feature: .textField) {
            TestItem("TextField .textFieldStyle(DefaultTextFieldStyle()") {
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
                    Check(valid:  true, test: ".textFieldStyle(DefaultTextFieldStyle())")
                    Check(valid:  true, test: ".multilineTextAlignment(.leading)")
                    Check(valid:  true, test: ".multilineTextAlignment(.center)")
                    Check(valid:  true, test: ".multilineTextAlignment(.trailing)")
                }
            }
            TestItem("TextField .textFieldStyle(PlainTextFieldStyle())") {
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(PlainTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                TestResult {
                    Check(valid:  true, test: ".textFieldStyle(PlainTextFieldStyle())")
                }
            }
            TestItem("TextField .textFieldStyle(RoundedBorderTextFieldStyle())") {
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                TestResult {
                    Check(valid:  true, test: ".textFieldStyle(RoundedBorderTextFieldStyle())")
                }
            }
            TestItem("TextField .textFieldStyle(SquareBorderTextFieldStyle())") {
                #if os(macOS)
                HStack {
                    Text("Name:")
                    TextField("Name's placeholder", text: $name)
                        .frame(width: 150)
                        .textFieldStyle(SquareBorderTextFieldStyle())
                    Image(systemName: "arrowtriangle.backward")
                }
                TestResult {
                    Check(valid:  true, test: ".textFieldStyle(SquareBorderTextFieldStyle())")
                }
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
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
