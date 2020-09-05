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
                        Text("- macOS Big Sur Beta 6")
                        Text("- Xcode 12 Beta 6")
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                    
                }
                .padding(.leading, 20)

                VStack(alignment: .leading) {
                    Text("Tests:")
                    
                    content
                        .padding(.leading, 20)
                }
                .padding(.leading, 20)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding()
            Spacer()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding(1.0)
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding()
    }
}

struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult {
            Check(iOS: true, macOS: true, test: "Feature 1")
            Check(iOS: false, macOS: false, test: "Feature 2")
            Check(iOS: true, macOS: false, test: "Feature 1")
            Check(iOS: false, macOS: true, test: "Feature 1")
            Check(iOS: true, test: "Feature 1")
            Check(macOS: true, test: "Feature 1")
            Check(iOS: false, test: "Feature 1")
            Check(macOS: false, test: "Feature 1")
        }
    }
}
