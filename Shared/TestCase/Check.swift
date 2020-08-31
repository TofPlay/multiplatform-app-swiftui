//
//  Check.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct Check: View {
    
    struct Tag: View {
        let valid:Bool?
        let name:String
        
        var body: some View {
            if let lValid = valid {
                HStack {
                    Image(systemName: lValid ? "checkmark" : "xmark")
                    Text(name)
                        .bold()
                        .fixedSize()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                .background(lValid ? Color.green : Color.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.all,3)
            } else {
                EmptyView()
            }
        }
    }
    
    let watchOS: Bool?
    let tvOS: Bool?
    let iOS: Bool?
    let macOS: Bool?
    let test: String
    
    public init(watchOS pWatchOS:Bool? = nil, tvOS pTvOS:Bool? = nil, iOS piOS:Bool? = nil, macOS pMacOS:Bool? = nil, test pTest:String) {
        self.watchOS = pWatchOS
        self.tvOS = pTvOS
        self.iOS = piOS
        self.macOS = pMacOS
        self.test = pTest
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Tag(valid: watchOS, name: "watchOS")
                Tag(valid: tvOS, name: "tvOS")
                Tag(valid: iOS, name: "iOS")
                Tag(valid: macOS, name: "macOS")

                Text(test)
                    .foregroundColor(.gray)
            }
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding(.top, -10)
    }
    
}

struct Check_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Check(iOS: true, macOS: true, test: "Feature 1")
            Check(iOS: false, macOS: false, test: "Feature 1")
            Check(iOS: true, macOS: false, test: "Feature 1")
            Check(iOS: false, macOS: true, test: "Feature 1")
        }
    }
}
