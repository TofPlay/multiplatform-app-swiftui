//
//  TestList.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestList: View {
    var body: some View {
        TestBody(test: .list) {
            TestCase("List .listStyle(DefaultListStyle())") {
                VStack {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(DefaultListStyle())
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                .background(Color.systemGray6)
                
                TestResult {
                    Check(valid:  true, test: ".listStyle(DefaultListStyle())")
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            
            #if !os(watchOS)
            TestCase("List .listStyle(EllipticalListStyle())") {
                Text("Only supported on watchOS")
                    .foregroundColor(.orange)
            }
            #endif
            
            TestCase("List .listStyle(PlainListStyle())") {
                VStack {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                .background(Color.systemGray6)

                TestResult {
                    Check(valid:  true, test: ".listStyle(PlainListStyle())")
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            
            #if os(macOS)
            TestCase("List .listStyle(GroupedListStyle())") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("List .listStyle(GroupedListStyle())") {
                VStack(alignment: .leading) {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(GroupedListStyle())
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                .background(Color.systemGray6)

                TestResult {
                    Check(valid:  true, test: ".listStyle(GroupedListStyle())")
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            #endif
            
            #if !os(watchOS)
            TestCase("List .listStyle(CarouselListStyle())") {
                Text("Only supported on watchOS")
                    .foregroundColor(.orange)
            }
            #endif
            
            TestCase("List .listStyle(SidebarListStyle())") {
                VStack(alignment: .leading) {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(SidebarListStyle())
                }
                .listStyle(SidebarListStyle())
                .frame(width: 300, height: 500)
                .border(Color.red)
                .background(Color.systemGray6)

                TestResult {
                    Check(valid:  true, test: ".listStyle(SidebarListStyle())")
                    #if os(macOS)
                    Check(valid:  false, test: ".listRowBackground(Color.blue.lighter) (totally random)")
                    #else
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    #endif
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            
            TestCase("List .listStyle(InsetListStyle())") {
                VStack(alignment: .leading) {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(InsetListStyle())
                }
                .frame(width: 300, height: 500)
                .border(Color.red)
                .background(Color.systemGray6)

                TestResult {
                    Check(valid:  true, test: ".listStyle(InsetListStyle())")
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            
            #if os(macOS)
            TestCase("List .listStyle(GroupedListStyle())") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("List .listStyle(InsetGroupedListStyle())") {
                VStack(alignment: .leading) {
                    List {
                        Section(header: Text("Section 1")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        Section(header: Text("Section 2")) {
                            ForEach(1..<6) {
                                (pItem:Int) in
                                Text("Item \(pItem)")
                            }
                        }
                        .listRowBackground(Color.blue.lighter)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                .frame(width: 300, height: 500)
                .border(Color.red)

                TestResult {
                    Check(valid:  true, test: ".listStyle(InsetGroupedListStyle())")
                    Check(valid:  true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(valid:  true, test: ".frame(width: 300, height: 500)")
                    Check(valid:  true, test: ".border(Color.red)")
                }
            }
            #endif
        }
    }
}

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList()
    }
}
