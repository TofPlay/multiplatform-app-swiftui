//
//  TestDisclosureGroup.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestDisclosureGroup: View {
    @State private var isShow1 = false
    @State private var isShow2 = false
    
    var body: some View {
        TestBody(test: .disclosureGroup) {
            TestCase("DisclosureGroup with VStack, 2 items and 4 contents") {
                #if os(iOS)
                VStack {
                    DisclosureGroup("Item1", isExpanded: $isShow1) {
                        Text("Content 1")
                        Text("Content 2")
                        Text("Content 3")
                        Text("Content 4")
                    }

                    DisclosureGroup("Item2", isExpanded: $isShow2) {
                        Text("Content 1")
                        Text("Content 2")
                        Text("Content 3")
                        Text("Content 4")
                    }
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                #else
                Label("Crash on macOS", systemImage: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                #endif

                TestResult {
                    Check(iOS: false, macOS: false, test: "Display Items")
                    Check(iOS: false, macOS: false, test: "Display subItems")
                    Check(iOS: true, macOS: false, test: ".background(Color.systemGray6)")
                }
            }

            TestCase("DisclosureGroup with List, 2 items and 4 contents") {
                #if os(iOS)
                List {
                    DisclosureGroup("Item1", isExpanded: $isShow1) {
                        Text("Content 1")
                        Text("Content 2")
                        Text("Content 3")
                        Text("Content 4")
                    }

                    DisclosureGroup("Item2", isExpanded: $isShow2) {
                        Text("Content 1")
                        Text("Content 2")
                        Text("Content 3")
                        Text("Content 4")
                    }
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                #else
                Label("Crash on macOS", systemImage: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                #endif

                TestResult {
                    Check(iOS: true, macOS: false, test: "Display Items")
                    Check(iOS: true, macOS: false, test: "Display subItems")
                    Check(iOS: false, macOS: false, test: ".background(Color.systemGray6)")
                }
            }
        }
        // ISSUE: Background color is not apply on the list
        .background(Color.systemGray6)
    }
}

struct TestDisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        TestDisclosureGroup()
        
    }
}
