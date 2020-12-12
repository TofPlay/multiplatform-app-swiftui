//
//  WrapperWebView.iOS.swift
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
public struct WrapperWebView: UIViewRepresentable {
    @ObservedObject public var data = Data()
    
    public init(url pUrl:String) {
        data.url = pUrl
        data.current = pUrl
    }
    
    public func makeUIView(context pContext: Context) -> WKWebView {
        return pContext.coordinator.webView
    }
    
    public func updateUIView(_ pView: WKWebView, context pContext: Context) {
        guard pContext.coordinator.loadedUrl != data.url else { return }
        
        pContext.coordinator.loadedUrl = data.url
        
        if let lUrl = data.url {
            if let lUrl = URL(string: lUrl) {
                let lRequest = URLRequest(url: lUrl)
                pView.load(lRequest)
            }
        }
        
        pContext.coordinator.data.url = data.url
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(data: data)
    }
}
