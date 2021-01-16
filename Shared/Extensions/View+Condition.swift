//
//  View+Condition.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 16/01/2021.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    public func `if`<Transform:View>(_ pOS: OS, transform pTransform: (Self) -> Transform) -> some View {
        if OS.current == pOS {
            pTransform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    public func `if`<TrueContent: View, FalseContent: View>(_ pOS: OS, if pIf: (Self) -> TrueContent, else pElse: (Self) -> FalseContent) -> some View {
        if OS.current == pOS {
            pIf(self)
        } else {
            pElse(self)
        }
    }
    
    @ViewBuilder
    public func `if`<Transform:View>(_ pCondition: Bool, transform pTransform: (Self) -> Transform) -> some View {
        if pCondition {
            pTransform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    public func `if`<TrueContent: View, FalseContent: View>(_ pCondition: Bool, if pIf: (Self) -> TrueContent, else pElse: (Self) -> FalseContent) -> some View {
        if pCondition {
            pIf(self)
        } else {
            pElse(self)
        }
    }
    
    @ViewBuilder
    public func ifLet<V, Transform: View>(_ pValue: V?, transform pTransform: (Self, V) -> Transform) -> some View {
        if let lValue = pValue {
            pTransform(self, lValue)
        } else {
            self
        }
    }
}
