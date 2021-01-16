//
//  TestUIKitWebView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 02/09/2020.
//

import SwiftUI

struct TestWrapperWebView: View {
    @State private var webView = WrapperWebView(url: "https://www.google.com")
    @State private var url = "https://www.google.com"
    @State private var current = ""
    @State private var canGoBack: Bool = false
    @State private var canGoForward: Bool = false

    var body: some View {
        TestBody(test: .wrapperWebView) {
            TestCase("WrapperWebView") {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray)
                    .frame(width: 640, height: 480)
                    .overlay(
                        VStack(spacing:3) {
                            HStack(spacing: 5) {
                                Button {
                                    if canGoBack {
                                        webView.data.goBack = true
                                    }
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 20)
                                        .foregroundColor(canGoBack ? Color.white : Color.systemGray4)
                                }
                                .buttonStyle(BorderlessButtonStyle())

                                Button {
                                    if canGoForward {
                                        webView.data.goForward = true
                                    }
                                } label: {
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 20)
                                        .foregroundColor(canGoForward ? Color.white : Color.systemGray4)
                                }
                                .buttonStyle(BorderlessButtonStyle())

                                Button {
                                    webView.data.reload = true
                                } label: {
                                    Image(systemName: "gobackward")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(!webView.data.reload ? Color.white : Color.systemGray4)
                                        .background(Color.gray)
                                }
                                .buttonStyle(BorderlessButtonStyle())

                                TextField("Enter an url", text: $url, onCommit:  {
                                    webView.data.url = url
                                })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }

                            GeometryReader {
                                pGeo in
                                VStack {
                                    ScrollView {
                                        webView
                                            .frame(height: pGeo.size.height - 20)
                                    }
                                    Text(current)
                                        .foregroundColor(.white)
                                        .frame(width: pGeo.size.width, alignment: .leading)
                                        .truncationMode(.tail)
                                        .lineLimit(1)
                                }
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
        .onReceive(webView.data.$current) {
            pCurrent in
            current = pCurrent ?? ""
        }
        .onReceive(webView.data.$canGoBack) {
            pCanGoBack in
            canGoBack = pCanGoBack
        }
        .onReceive(webView.data.$canGoForward) {
            pCanGoForward in
            canGoForward = pCanGoForward
        }
    }
}

struct TestWrapperWebView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestWrapperWebView()
        }
    }
}
