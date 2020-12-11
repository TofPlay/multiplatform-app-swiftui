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
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 30)
                        .frame(minHeight: 10)
                        .overlay(Text("Blue"))
                        .foregroundColor(.white)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 30)
                        .frame(minHeight: 10)
                        .overlay(Text("White"))
                        .foregroundColor(.blue)
                    Rectangle().foregroundColor(.red)
                        .frame(height: 30)
                        .frame(minHeight: 10)
                        .overlay(Text("Red"))
                        .foregroundColor(.white)
                }
                .frame(width: 200)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check("Can resize blue", .success(os: .macOS))
                    Check("Can resize white", .success(os: .macOS))
                    Check("Can resize red", .error(os: .macOS))
                }
            }

            TestCase("HSplitView") {
                #if os(macOS)
                HSplitView {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 60)
                        .frame(minWidth: 10)
                        .overlay(Text("Blue"))
                        .foregroundColor(.white)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 60)
                        .frame(minWidth: 10)
                        .overlay(Text("White"))
                        .foregroundColor(.blue)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 60)
                        .frame(minWidth: 10)
                        .overlay(Text("Red"))
                        .foregroundColor(.white)
                }
                .frame(height: 90)
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check("Can resize blue", .error(os: .macOS))
                    Check("Can resize white", .error(os: .macOS))
                    Check("Can resize red", .error(os: .macOS))
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
