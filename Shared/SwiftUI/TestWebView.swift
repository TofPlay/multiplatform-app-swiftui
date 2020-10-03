//
//  TestWebView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 02/09/2020.
//

import SwiftUI

struct TestWebView: View {
    var body: some View {
        TestBody(test: .webView) {
            TestCase("WebView") {
                Text("There is not (yet) a native SwiftUI WebView component")
                    .foregroundColor(.orange)
                
                TestResult {
                    Check("WebView", .error(os: .iOS), .error(os: .macOS))
                }
            }
        }
    }
}

struct TestWebView_Previews: PreviewProvider {
    static var previews: some View {
        TestWebView()
    }
}
