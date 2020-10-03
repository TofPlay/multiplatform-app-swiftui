//
//  TestColorPicker.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestColorPicker: View {
    @State private var color: Color = Color.blue
    
    var body: some View {
        TestBody(test: .colorPicker) {
            TestCase("Select a color") {
                ColorPicker("",selection: $color)
                    .frame(width: 150, height: 50)
                
                Text("Selected color: \(color.rgb)")

                TestResult {
                    Check("ColorPicker", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        TestColorPicker()
    }
}
