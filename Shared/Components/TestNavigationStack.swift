//
//  TestNavigationStack.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI
import NavigationStack

struct TestNavigationStack: View {
    struct SubChildView: View {
        var body: some View {
            VStack {
                Text("SubChildView")
                    .foregroundColor(.white)
                
                PopView {
                    Text("Back to ChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .clipShape(Rectangle())
            .background(Color.purple)
            .navigationTitle("SubChildView")
        }
    }
    
    struct ChildView: View {
        var body: some View {
            VStack {
                Text("ChildView")
                    .foregroundColor(.white)
                
                PushView(destination: SubChildView()) {
                    Text("Push to SubChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                PopView {
                    Text("Back to MyHome")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .clipShape(Rectangle())
            .background(Color.orange)
            .navigationTitle("ChildView")
        }
    }
    
    struct MyHome: View {
        var body: some View {
            TestCase("Transition between child and parent") {
                VStack {
                    PushView(destination: ChildView()) {
                        Text("Push to ChildView")
                            .foregroundColor(.white)
                            .padding(5.0)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .clipShape(Rectangle())
                .background(Color.green)
                .navigationTitle("MyHome")
                
                TestResult {
                    Check(valid:  true, test: "NavigationStack")
                }
            }
        }
    }
    
    var body: some View {
        NavigationStackView {
            MyHome()
        }
    }
}

struct TestNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationStack()
    }
}
