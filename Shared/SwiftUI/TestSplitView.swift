//
//  TestSplitView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 01/09/2020.
//

import SwiftUI

struct TestSplitView: View {
    var body: some View {
        TestBody(test: .splitView) {
            TestCase("VSplitView") {
                #if os(macOS)
                VSplitView {
                    Rectangle().foregroundColor(.blue).frame(height: 30)
                        .overlay(Text("Blue"))
                        .foregroundColor(.white)
                    Rectangle().foregroundColor(.white).frame(minHeight: 30)
                        .overlay(Text("White"))
                        .foregroundColor(.blue)
                    Rectangle().foregroundColor(.red).frame(minHeight: 30)
                        .overlay(Text("Red"))
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 90)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check("VSplitView", .success(os: .macOS))
                }
            }

            TestCase("HSplitView") {
                #if os(macOS)
                HSplitView {
                    Rectangle().foregroundColor(.blue).frame(minWidth: 60)
                        .overlay(Text("Blue"))
                        .foregroundColor(.white)
                    Rectangle().foregroundColor(.white).frame(minWidth: 60)
                        .overlay(Text("White"))
                        .foregroundColor(.blue)
                    Rectangle().foregroundColor(.red).frame(minWidth: 60)
                        .overlay(Text("Red"))
                        .foregroundColor(.white)
                }
                .frame(width: 180, height: 90)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check("HSplitView", .success(os: .macOS))
                }
            }
        }
    }
}

struct TestSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TestSplitView()
    }
}
