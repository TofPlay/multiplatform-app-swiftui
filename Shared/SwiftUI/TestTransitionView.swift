//
//  TestPresentView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestTransitionView: View {
    struct ChildView: View {
        @Binding var show: Bool
        var body: some View {
            VStack {
                HStack {
                    Button {
                        show = false
                    }
                    label: {
                        Text("Back to RootView")
                            .foregroundColor(.white)
                            .padding(5.0)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .navigationTitle("ChildView")
        }
    }

    struct RootView: View {
        @Binding var displayChild: Bool
        
        var body: some View {
            VStack {
                Button {
                    displayChild = true
                }
                label: {
                    Text("Display ChildView")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .navigationTitle("RootView")
        }
    }

    @State private var displayChild = false
    
    let childTransition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    let rootTransition = AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
    
    var body: some View {
        TestBody(test: .transitionView) {
            TestCase("Transition between child and parent") {
                ZStack {
                    if displayChild {
                        ChildView(show: $displayChild)
                            .clipShape(Rectangle())
                            .background(Color.blue)
                            .transition(childTransition)
                            .animation(Animation.linear)
                    } else {
                        RootView(displayChild: $displayChild)
                            .clipShape(Rectangle())
                            .background(Color.red)
                            .transition(rootTransition)
                            .animation(Animation.linear)

                    }
                }
                .frame(height: 500)
                
                TestResult {
                    Check(iOS: true, macOS: true, test: "ZStack .transition()")
                }
            }
        }
    }
}

struct TestPresentView_Previews: PreviewProvider {
    static var previews: some View {
        TestTransitionView()
    }
}
