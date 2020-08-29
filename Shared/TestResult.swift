//
//  TestResult.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestResult<Content:View>: View {
    let alignment: HorizontalAlignment
    let content:Content
    
    init(alignment pAlignment: HorizontalAlignment = .leading, check pCheck:Bool = false, @ViewBuilder content pContent: () -> Content) {
        self.alignment = pAlignment
        self.content = pContent()
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading)  {
                Text("Test Result")
                    .bold()
                VStack(alignment: .leading) {
                    Text("Environment:")

                    VStack(alignment: .leading) {
                        Text("- macOS Big Sur Beta 5")
                        Text("- Xcode 12 Beta 6")
                    }
                    .grayscale(0.75)
                    .padding(.leading, 20)
                    
                }
                .padding(.leading, 20)

                VStack(alignment: .leading) {
                    Text("Tests:")
                    
                    content
                        .grayscale(0.50)
                        .padding(.leading, 20)
                }
                .padding(.leading, 20)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding()
            Spacer()
        }
        .border(Color.gray)
        .background(Color.white)
        .padding()
    }
}

struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult {
            Check(valid: true, test: "Feature 1")
            Check(valid: false, test: "Feature 2")
        }
    }
}
