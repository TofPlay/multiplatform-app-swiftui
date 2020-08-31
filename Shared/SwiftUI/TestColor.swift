//
//  TestColor.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

extension Color : Identifiable {
    public struct Env:View {
        @Environment(\.colorScheme) var colorScheme
        
        public var body: some View {
            EmptyView()
        }
    }
    
    public enum System: String, CaseIterable, CustomStringConvertible {
        case label
        case secondaryLabel
        case tertiaryLabel
        case quaternaryLabel
        case placeholderText
        case separator
        case opaqueSeparator
        case systemBackground
        case secondarySystemBackground
        case systemGroupedBackground
        case systemBlue
        case systemGreen
        case systemIndigo
        case systemOrange
        case systemPink
        case systemPurple
        case systemRed
        case systemTeal
        case systemYellow
        case systemGray
        case systemGray2
        case systemGray3
        case systemGray4
        case systemGray5
        case systemGray6
        
        public static var labels: [System] {
            return [.label, .secondaryLabel, .tertiaryLabel, .quaternaryLabel]
        }
        
        public static  var placeHolders: [System] {
            return [.placeholderText, .opaqueSeparator]
        }
        
        public static  var separators: [System] {
            return [.separator, .opaqueSeparator]
        }
        
        public static  var backgrounds: [System] {
            return [.systemBackground, .secondarySystemBackground, .systemGroupedBackground]
        }
        
        public static  var colors: [System] {
            return [.systemBlue, .systemGreen, .systemIndigo, .systemOrange, .systemPink, .systemPurple, .systemRed, .systemTeal, .systemYellow]
        }
        
        public static  var grays: [System] {
            return [.systemGray, .systemGray2, .systemGray3, .systemGray4, .systemGray5, .systemGray6]
        }
        
        public var description: String {
            return self.rawValue
        }
        
        public func color() -> Color {
            switch self {
            case .label:
                return Color.label
            case .secondaryLabel:
                return Color.secondaryLabel
            case .tertiaryLabel:
                return Color.tertiaryLabel
            case .quaternaryLabel:
                return Color.quaternaryLabel
            case .placeholderText:
                return Color.placeholderText
            case .separator:
                return Color.separator
            case .opaqueSeparator:
                return Color.opaqueSeparator
            case .systemBackground:
                return Color.systemBackground
            case .secondarySystemBackground:
                return Color.secondarySystemBackground
            case .systemGroupedBackground:
                return Color.systemGroupedBackground
            case .systemBlue:
                return Color.systemBlue
            case .systemGreen:
                return Color.systemGreen
            case .systemIndigo:
                return Color.systemIndigo
            case .systemOrange:
                return Color.systemOrange
            case .systemPink:
                return Color.systemPink
            case .systemPurple:
                return Color.systemPurple
            case .systemRed:
                return Color.systemRed
            case .systemTeal:
                return Color.systemTeal
            case .systemYellow:
                return Color.systemYellow
            case .systemGray:
                return Color.systemGray
            case .systemGray2:
                return Color.systemGray2
            case .systemGray3:
                return Color.systemGray3
            case .systemGray4:
                return Color.systemGray4
            case .systemGray5:
                return Color.systemGray5
            case .systemGray6:
                return Color.systemGray6
            }
        }
    }
    
    public var id: String {
        return "\(self)"
    }
    
    public init(hex pHex: String) {
        let lHex = pHex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var lInt64: UInt64 = 0
        
        Scanner(string: lHex).scanHexInt64(&lInt64)
        
        let lAlpha, lRed, lGreen, lBlue: UInt64
        
        switch lHex.count {
        case 3: // RGB (12-bit)
            (lAlpha, lRed, lGreen, lBlue) = (255, (lInt64 >> 8) * 17, (lInt64 >> 4 & 0xF) * 17, (lInt64 & 0xF) * 17)
        case 6: // RGB (24-bit)
            (lAlpha, lRed, lGreen, lBlue) = (255, lInt64 >> 16, lInt64 >> 8 & 0xFF, lInt64 & 0xFF)
        case 8: // ARGB (32-bit)
            (lAlpha, lRed, lGreen, lBlue) = (lInt64 >> 24, lInt64 >> 16 & 0xFF, lInt64 >> 8 & 0xFF, lInt64 & 0xFF)
        default:
            (lAlpha, lRed, lGreen, lBlue) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(lRed) / 255,
            green: Double(lGreen) / 255,
            blue:  Double(lBlue) / 255,
            opacity: Double(lAlpha) / 255
        )
    }
    
    public init(system pSystem:System) {
        self = pSystem.color()
    }
    
    public static var label: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "000000") : Color(hex: "FFFFFF")
    }
    
    public static var secondaryLabel: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "3C3C4399") : Color(hex: "EBEBF599")
    }
    
    public static var tertiaryLabel: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "3C3C434D") : Color(hex: "EBEBF54D")
    }
    
    public static var quaternaryLabel: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "3C3C432E") : Color(hex: "EBEBF52E")
    }
    
    public static var placeholderText: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "3C3C434D") : Color(hex: "EBEBF54D")
    }
    
    public static var separator: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "3C3C434A") : Color(hex: "54545899")
    }
    
    public static var opaqueSeparator: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "C6C6C8") : Color(hex: "38383A")
    }
    
    public static var systemBackground: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "FFFFFF") : Color(hex: "000000")
    }
    
    public static var secondarySystemBackground: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "F2F2F7") : Color(hex: "1C1C1E")
    }
    
    public static var systemGroupedBackground: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "F2F2F7") : Color(hex: "000000")
    }
    
    public static var systemBlue: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "007AFF") : Color(hex: "0A84FF")
    }
    
    public static var systemGreen: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "34C759") : Color(hex: "30D158")
    }
    
    public static var systemIndigo: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "5856D6") : Color(hex: "5E5CE6")
    }
    
    public static var systemOrange: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "5856D6") : Color(hex: "5E5CE6")
    }
    
    public static var systemPink: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "FF2D55") : Color(hex: "FF375F")
    }
    
    public static var systemPurple: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "AF52DE") : Color(hex: "BF5AF2")
    }
    
    public static var systemRed: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "FF3B30") : Color(hex: "FF453A")
    }
    
    public static var systemTeal: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "5AC8FA") : Color(hex: "64D2FF")
    }
    
    public static var systemYellow: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "FFCC00") : Color(hex: "FFD60A")
    }
    
    public static var systemGray: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "8E8E93") : Color(hex: "8E8E93")
    }
    
    public static var systemGray2: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "AEAEB2") : Color(hex: "636366")
    }
    
    public static var systemGray3: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "C7C7CC") : Color(hex: "48484A")
    }
    
    public static var systemGray4: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "D1D1D6") : Color(hex: "3A3A3C")
    }
    
    public static var systemGray5: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "E5E5EA") : Color(hex: "2C2C2E")
    }
    
    public static var systemGray6: Color {
        let lEnv = Env()
        return lEnv.colorScheme == .light ? Color(hex: "F2F2F7") : Color(hex: "1C1C1E")
    }
    
    // Missing properties: We can create Color from mutliple sources but we don't have basic properties like the RBG color hex string.
    // This property is a trick that is not 100% reliable. Don't use in production.
    public var rgb: String {
        var lRet = "\(self)"
        let lRGB: [String] = lRet.components(separatedBy: " ").suffix(4)
        
        if lRGB.count == 4 {
            let lRed = Int16((Float(lRGB[0]) ?? 1) * 255)
            let lGreen = Int16((Float(lRGB[1]) ?? 1) * 255)
            let lBlue = Int16((Float(lRGB[2]) ?? 1) * 255)
            
            lRet = String(format: "#%02X%02X%02X", lRed, lGreen, lBlue)
        }
        
        return lRet
    }
    
    public var rgba: String {
        var lRet = "\(self)"
        let lRGB: [String] = lRet.components(separatedBy: " ").suffix(4)
        
        if lRGB.count == 4 {
            let lRed = Int16((Float(lRGB[0]) ?? 1) * 255)
            let lGreen = Int16((Float(lRGB[1]) ?? 1) * 255)
            let lBlue = Int16((Float(lRGB[2]) ?? 1) * 255)
            let lAlpha = Int16((Float(lRGB[3]) ?? 1) * 255)
            
            lRet = String(format: "#%02X%02X%02X%02X", lRed, lGreen, lBlue, lAlpha)
        }
        
        return lRet
    }
    
    public var lighter: some View {
        grayscale(-1.50)
    }
    
    public var darker: some View {
        grayscale(0.50)
    }
    
    public func lighter(_ pAmount:Double) -> some View {
        grayscale(-pAmount)
    }
    
    public func darker(_ pAmount:Double) -> some View {
        grayscale(pAmount)
    }
    
}

struct TestColor: View {
    let columns:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let predefined:[Color] = [.clear, .white, .gray, .red, .green, . blue, .orange, .yellow, .pink, .purple, .primary, .secondary]
    
    let gradient = Gradient(colors: [.blue, .white, .red])
    let gradient2 = Gradient(stops: [
        Gradient.Stop(color: .blue, location: 0.33),
        Gradient.Stop(color: .white, location: 0.66),
        Gradient.Stop(color: .red, location: 1)
    ])
    
    var body: some View {
        TestBody(test: .color) {
            TestCase("Predefined colors") {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(predefined) {
                        (pColor) in
                        
                        VStack(alignment: .center) {
                            Rectangle()
                                .fill(pColor)
                                .frame(width: 50, height: 50)
                                .border(Color.black)
                            
                            Text("\(pColor.id)")
                            
                            Spacer()
                        }
                        .frame(width: 100)
                    }
                }

                TestResult {
                    Check(iOS: false, macOS: false, test: "properties 'red', 'green', 'blue', 'rgb', 'rgba', 'ligther' and 'darker'")
                }
            }
            
            Group {
                TestCase("System Labels") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.labels, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Rectangle()
                                    .fill(Color(system: pColor))
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 230)
                        }
                    }
                }
                
                TestCase("System PlaceHolders") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.placeHolders, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Rectangle()
                                    .fill(Color(system: pColor))
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 230)
                        }
                    }
                }
                
                TestCase("System Backgrounds") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.backgrounds, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Rectangle()
                                    .fill(Color(system: pColor))
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 230)
                        }
                    }
                }
                
                TestCase("System Colors") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.colors, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Color(system: pColor)
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 130)
                        }
                    }
                }
                
                TestCase("System Colors lighter") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.colors, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Color(system: pColor)
                                    .lighter
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 130)
                        }
                    }
                }
                
                TestCase("System Colors dacker") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.colors, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Color(system: pColor)
                                    .darker
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 130)
                        }
                    }
                }
                
                TestCase("System Grays") {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(Color.System.grays, id: \.self) {
                            (pColor) in
                            
                            VStack(alignment: .center) {
                                Rectangle()
                                    .fill(Color(system: pColor))
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                                
                                Text("\(pColor.description)")
                                
                                Spacer()
                            }
                            .frame(width: 130)
                        }
                    }
                }
            }
            
            Group {
                TestCase("Linear Gradient (simple)") {
                    HStack {
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
                                .frame(width: 200, height: 100)
                            Text("[.leading, .trailing]")
                        }
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                                .frame(width: 200, height: 100)
                            Text("[.top, .bottom]")
                        }
                    }
                }
                
                TestCase("Linear Gradient (with 'Gradient.Stop')") {
                    HStack {
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: gradient2, startPoint: .leading, endPoint: .trailing))
                                .frame(width: 200, height: 100)
                            Text("[.leading, .trailing]")
                        }
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: gradient2, startPoint: .top, endPoint: .bottom))
                                .frame(width: 200, height: 100)
                            Text("[.top, .bottom]")
                        }
                    }
                }
            }
            
            Group {
                TestCase("Radial Gradient") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack {
                                Rectangle()
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 100))
                                    .frame(width: 200, height: 100)
                                Text("[.center, .startRadius(5), .endRadius(100)]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(RadialGradient(gradient: gradient, center: .leading, startRadius: 5, endRadius: 100))
                                    .frame(width: 200, height: 100)
                                Text("[.leading, .startRadius(5), .endRadius(100)]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(RadialGradient(gradient: gradient, center: .trailing, startRadius: 5, endRadius: 100))
                                    .frame(width: 200, height: 100)
                                Text("[.trailing, .startRadius(5), .endRadius(100)]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(RadialGradient(gradient: gradient, center: .top, startRadius: 5, endRadius: 100))
                                    .frame(width: 200, height: 100)
                                Text("[.top, .startRadius(5), .endRadius(100)]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(RadialGradient(gradient: gradient, center: .bottom, startRadius: 5, endRadius: 100))
                                    .frame(width: 200, height: 100)
                                Text("[.bottom, .startRadius(5), .endRadius(100)]")
                            }
                        }
                    }
                }
            }
            
            Group {
                TestCase("Angular Gradient") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack {
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient, center: .center))
                                    .frame(width: 200, height: 100)
                                Text("[.center]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient, center: .leading))
                                    .frame(width: 200, height: 100)
                                Text("[.leading]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient, center: .trailing))
                                    .frame(width: 200, height: 100)
                                Text("[.trailing]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient, center: .top))
                                    .frame(width: 200, height: 100)
                                Text("[.top]")
                            }
                            VStack {
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient, center: .bottom))
                                    .frame(width: 200, height: 100)
                                Text("[.bottom]")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TestColor_Previews: PreviewProvider {
    static var previews: some View {
        TestColor()
    }
}
