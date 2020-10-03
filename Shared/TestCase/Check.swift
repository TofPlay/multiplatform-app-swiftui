//
//  Check.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct Check: View {
    
    public struct Status: Identifiable {
        public enum OS: String {
            case watchOS
            case tvOS
            case iOS
            case iPadOS
            case macOS
        }
        
        let id: UUID = UUID()
        let os: OS
        let image: String
        let forground: Color
        let background: Color
        let msg:String?
        
        public static func success(os pOS:OS, _ pMsg:String? = nil) -> Status {
            return Status(os: pOS, image: "checkmark", forground: .white, background: .green, msg: pMsg)
        }

        public static func warning(os pOS:OS, _ pMsg:String? = nil) -> Status {
            return Status(os: pOS, image: "checkmark", forground: .white, background: .orange, msg: pMsg)
        }

        public static func error(os pOS:OS, _ pMsg:String? = nil) -> Status {
            return Status(os: pOS, image: "xmark", forground: .white, background: .red, msg: pMsg)
        }
    }
    
    private struct Tag: View {
        let status: Status
        
        var body: some View {
            HStack {
                Image(systemName: status.image)
                Text(status.os.rawValue + (status.msg != nil ? ", " : ""))
                    .bold()
                    .fixedSize()
                
                if let lMsg = status.msg {
                    Text(lMsg)
                        .fixedSize()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            .background(status.background)
            .foregroundColor(status.forground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.all,3)
        }
    }
    
    let test: String
    let status: [Status]
    
    public init(_ pTest:String, _ pStatus:Status...) {
        self.status = pStatus
        self.test = pTest
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(status) {
                    pStatus in
                    Tag(status: pStatus)
                }
                
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
            Check("Test 1", .success(os: .iOS), .success(os: .macOS))
            Check("Test 1", .error(os: .iOS), .error(os: .macOS))
            Check("Test 1", .success(os: .iOS), .error(os: .macOS))
            Check("Test 1", .error(os: .iOS), .success(os: .macOS))
            Check("Test 1", .success(os: .iOS), .warning(os: .macOS, "with patch"))
        }
    }
}
