//
//  TestSlider.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestSlider: View {
    @State private var beer: Double = 1
    
    var body: some View {
        TestBody(test: .slider) {
            TestCase("Select number of beers") {
                Slider(value: $beer, in: 0...10, step: 1.0) {
                    Text("How much beer are you going to drink?")
                }
                .frame(width: 500)
                
                Text("Number of beer(s): \(beer, specifier: "%.0f")")

                TestResult {
                    Check("Slider", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestSlider_Previews: PreviewProvider {
    static var previews: some View {
        TestSlider()
    }
}
