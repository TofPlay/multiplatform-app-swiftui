//
//  TestNavigationView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestNavigationLinkButton: View {
    struct SubChildView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            VStack {
                Text("This is the SubChildView")
                    .padding()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Dismiss to ChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("SubChildView")
        }
    }
    
    struct ChildView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        @State private var child: Bool = false
        
        var body: some View {
            VStack {
                Text("This is the ChildView")
                    .padding()
                Button {
                    child = true
                } label: {
                    Text("SubChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Dismiss to MainView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(
                    destination: SubChildView(),
                    isActive: $child,
                    label: {
                        EmptyView()
                    })
                    .hidden()
            }
            .navigationTitle("ChildView")
        }
    }
    
    @State private var child: Bool = false
    
    var body: some View {
        TestItem("NavigationLink with button") {
            VStack {
                Button {
                    child = true
                } label: {
                    Text("ChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(
                    destination: ChildView(),
                    isActive: $child,
                    label: {
                        EmptyView()
                    })
                    .frame(width: 0, height: 0)
                    .hidden()
            }
            .navigationTitle("MainView")
            
            TestResult {
                #if os(macOS)
                Check(valid:  false, test: "NavigationLink with button")
                #else
                Check(valid:  true, test: "NavigationLink with button")
                #endif
            }
            Spacer()
        }
    }
}

struct TestNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationLinkButton()
    }
}
