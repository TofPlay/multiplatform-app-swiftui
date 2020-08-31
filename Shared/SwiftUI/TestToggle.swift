//
//  TestToggle.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestToggle: View {
    @State private var isOn = false
    
    var body: some View {
        TestBody(test: .toggle) {
            TestCase("Click on the toggle") {
                Toggle(isOn: $isOn) {
                    Text("toggle's text")
                }
                .frame(width: 200)
                
                HStack {
                    Text("The toggle is ")
                    
                    Text(isOn ? "ON" : "OFF")
                        .bold()
                }

                TestResult {
                    Check(iOS: true, macOS: true, test: "Toggle")
                }
            }
        }
    }
}

struct TestToggle_Previews: PreviewProvider {
    static var previews: some View {
        TestToggle()
    }
}
