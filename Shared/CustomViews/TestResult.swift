//
//  TestResult.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestResult<Content:View>: View {
    struct Rounded: Shape {
        let radius: CGFloat
        
        func path(in pRect: CGRect) -> Path {
            let lRet = Path(roundedRect: pRect, cornerRadius: radius)
            return lRet
        }
    }

    let alignment: HorizontalAlignment
    let content:Content
    
    init(alignment pAlignment: HorizontalAlignment = .leading, check pCheck:Bool = false, @ViewBuilder content pContent: () -> Content) {
        self.alignment = pAlignment
        self.content = pContent()
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading)  {
                Text("Test Result")
                    .bold()
                VStack(alignment: .leading) {
                    Text("Environment:")
                    
                    VStack(alignment: .leading) {
                        Text("- macOS Big Sur 11.1")
                        Text("- Xcode 12.3")
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                    
                }
                .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text("Tests:")
                    
                    content
                        .padding(.leading, 20)
                }
                .padding(.leading, 20)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding()
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(lineWidth: 1)
                .fill(Color.gray)
        )
        .padding()
    }
}

struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult {
            Group {
                Check("Feature 1", .success(os: .iOS), .success(os: .macOS))
                Check("Feature 2", .error(os: .iOS), .error(os: .macOS))
                Check("Feature 1", .success(os: .iOS), .error(os: .macOS))
                Check("Feature 1", .error(os: .iOS), .success(os: .macOS))
                Check("Feature 1", .success(os: .iOS))
                Check("Feature 1", .success(os: .macOS))
            }
            Group {
                Check("Feature 1", .warning(os: .iOS))
                Check("Feature 1", .warning(os: .macOS))
                Check("Feature 1", .warning(os: .macOS, "small text"))
            }
            Group {
                Check("Feature 1", .error(os: .iOS))
                Check("Feature 1", .error(os: .macOS))
                Check("Feature 1", .error(os: .macOS, "small text"))
            }
        }
    }
}
