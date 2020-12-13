//
//  WrapperWebView.macOS.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 02/09/2020.
//

import SwiftUI
import WebKit
import Combine

// MARK: -
// MARK: WrapperWebView
// MARK: -
public struct WrapperWebView: NSViewRepresentable {
    @ObservedObject public var data = Data()
    
    public init(url pUrl:String) {
        data.url = pUrl
        data.current = pUrl
    }
    
    public func makeNSView(context pContext: Context) -> WKWebView {
        return pContext.coordinator.webView
    }
    
    public func updateNSView(_ pWebView: WKWebView, context pContext: Context) {
        if pWebView.canGoBack && data.goBack {
            data.goBack = false
            pWebView.goBack()
        } else if pWebView.canGoForward && data.goForward {
            data.goForward = false
            pWebView.goForward()
        } else if data.reload {
            data.reload = false
            pWebView.reload()
        } else {
            guard pContext.coordinator.loadedUrl != data.url else { return }

            pContext.coordinator.loadedUrl = data.url
            
            if let lUrl = data.url {
                if let lUrl = URL(string: lUrl) {
                    let lRequest = URLRequest(url: lUrl)
                    pWebView.load(lRequest)
                }
            }
            
            pContext.coordinator.data.url = data.url
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(data: data)
    }
}
