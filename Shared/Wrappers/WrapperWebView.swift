//
//  WrapperWebView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 02/09/2020.
//

import SwiftUI
import WebKit
import Combine

extension WrapperWebView {
    // MARK: -
    // MARK: WrapperWebView.Context
    // MARK: -
    public class Data: ObservableObject {
        @Published public var loading: Bool = false
        @Published public var url: String? = nil
        @Published public var current: String? = nil
        @Published public var error: Error? = nil
        @Published public var reload: Bool = false
        @Published public var goBack: Bool = false
        @Published public var canGoBack: Bool = false
        @Published public var goForward: Bool = false
        @Published public var canGoForward: Bool = false
    }

}

extension WrapperWebView {
    
    // MARK: -
    // MARK: WrapperWebView.Coordinator
    // MARK: -
    public class Coordinator: NSObject, WKNavigationDelegate {
        @ObservedObject public var data: Data

        var webView: WKWebView = WKWebView()
        var loadedUrl: String? = nil
        
        init(data pData: Data) {
            data = pData
            super.init()
            webView.navigationDelegate = self
        }
        
        // MARK: -
        // MARK: Protocol WKNavigationDelegate
        // MARK: -
          
        // Called when web content begins to load in a web view.
        public func webView(_ pWebView: WKWebView, didStartProvisionalNavigation pNavigation: WKNavigation!) {
            data.loading = true

            if let lUrl = pWebView.url?.absoluteString {
                print("data.current=\(lUrl)")
                data.current = lUrl
            }
        }
        
        // Called when the web view begins to receive web content.
        public func webView(_ pWebView: WKWebView, didCommit pNavigation: WKNavigation!) {
            data.loading = true
        }

        // Called when the navigation is complete.
        public func webView(_ pWebView: WKWebView, didFinish pNavigation: WKNavigation!) {
            print("\(#function), \(#line)")
            data.loading = false
            data.canGoBack = pWebView.canGoBack
            data.canGoForward = pWebView.canGoForward
        }
        
        // Called when an error occurs during navigation.
        public func webView(_ pWebView: WKWebView, didFail navigation: WKNavigation!, withError pError: Error) {
            data.error = pError
        }
        
        // Called when an error occurs while the web view is loading content.
        public func webView(_ pWebView: WKWebView, didFailProvisionalNavigation pNavigation: WKNavigation!, withError pError: Error) {
            data.error = pError
        }
        
    }

}
