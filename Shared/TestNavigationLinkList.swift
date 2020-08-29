//
//  TestNavigationLinkList.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestNavigationLinkList: View {
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
    
    @State private var child1: Bool = false
    @State private var child2: Bool = false
    @State private var child3: Bool = false
    
    var body: some View {
        TestCase("NavigationLink with list") {
            List {
                NavigationLink(
                    destination: ChildView(),
                    isActive: $child1,
                    label: {
                        Text("ChildView 1")
                    })
                NavigationLink(
                    destination: ChildView(),
                    isActive: $child2,
                    label: {
                        Text("ChildView 2")
                    })
                NavigationLink(
                    destination: ChildView(),
                    isActive: $child3,
                    label: {
                        Text("ChildView 3")
                    })
            }
            .frame(width: 300, height: 500)
            .border(Color.red)
            .background(Color.systemGray6)
            .navigationTitle("MainView")
            
            TestResult {
                #if os(macOS)
                Check(valid:  false, test: "NavigationLink with list")
                #else
                Check(valid:  true, test: "NavigationLink with list")
                #endif
                Check(valid:  false, test: "List.background(Color.systemGray6)")
            }
            Spacer()
        }
    }
}

struct TestNavigationLinkList_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationLinkList()
    }
}
