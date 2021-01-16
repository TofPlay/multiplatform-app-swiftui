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
                        Text("- macOS Big Sur 11.0.1")
                        Text("- Xcode 12.2")
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
            Check("Feature 1", .success(os: .iOS), .success(os: .macOS))
            Check("Feature 2", .error(os: .iOS), .error(os: .macOS))
            Check("Feature 1", .success(os: .iOS), .error(os: .macOS))
            Check("Feature 1", .error(os: .iOS), .success(os: .macOS))
            Check("Feature 1", .success(os: .iOS))
            Check("Feature 1", .success(os: .macOS))
            Check("Feature 1", .error(os: .iOS))
            Check("Feature 1", .error(os: .macOS))
        }
    }
}
