//
//  TestUIKitWebView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 02/09/2020.
//

import SwiftUI

struct TestWrapperWebView: View {
    @State private var webView = WrapperWebView(url: "https://www.apple.com")
    @State private var url = "https://www.apple.com"
    @State private var current = ""
    
    var body: some View {
        TestBody(test: .wrapperWebView) {
            TestCase("WrapperWebView") {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray)
                    .frame(width: 640, height: 480)
                    .overlay(
                        VStack(spacing:3) {
                            VStack {
                                TextField("Enter an url", text: $url, onCommit:  {
                                    webView.data.url = url
                                })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            GeometryReader {
                                pGeo in
                                ScrollView {
                                    webView
                                        .frame(height: pGeo.size.height)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(webView.data.current ?? "")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(5)
                    )

                TestResult {
                    Check("WrapperWebView", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
        .frame(width: 800.0, height: 800.0)
    }
}

struct TestWrapperWebView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestWrapperWebView()
        }
    }
}
