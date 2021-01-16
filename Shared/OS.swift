//
//  OS.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 16/01/2021.
//

import Foundation

public enum OS: String {
    case unknown
    case watchOS
    case tvOS
    case iOS
    case iPadOS
    case macOS
    
    public static var current: OS {
        if isWatchOS {
            return watchOS
        } else if isTvOS {
            return tvOS
        } else if isiOS {
            return iOS
        } else if isMacOS {
            return macOS
        } else {
            return unknown
        }
    }
    
    public static var isWatchOS: Bool {
        #if os(watchOS)
        return true
        #else
        return false
        #endif
    }

    public static var isTvOS: Bool {
        #if os(tvOS)
        return true
        #else
        return false
        #endif
    }

    public static var isiOS: Bool {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }

    public static var isMacOS: Bool {
        #if os(macOS)
        return true
        #else
        return false
        #endif
    }
}
