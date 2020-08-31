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
                    Check(iOS: true, macOS: true, test: ".listStyle(DefaultListStyle())")
                    Check(iOS: true, macOS: true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(iOS: true, macOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, macOS: true, test: ".border(Color.red)")
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
                    Check(iOS: true, macOS: true, test: ".listStyle(PlainListStyle())")
                    Check(iOS: true, macOS: true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(iOS: true, macOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, macOS: true, test: ".border(Color.red)")
                }
            }
            
            TestCase("List .listStyle(GroupedListStyle())") {
                #if os(macOS)
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
                #else
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
                #endif

                TestResult {
                    Check(iOS: true, test: ".listStyle(GroupedListStyle())")
                    Check(iOS: true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(iOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, test: ".border(Color.red)")
                }
            }
            
            TestCase("List .listStyle(CarouselListStyle())") {
                #if !os(watchOS)
                Text("Only supported on watchOS")
                    .foregroundColor(.orange)
                #endif
            }
            
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
                    Check(iOS: true, macOS: true, test: ".listStyle(SidebarListStyle())")
                    Check(iOS: true, macOS: false, test: ".listRowBackground(Color.blue.lighter) totaly random on macOS")
                    Check(iOS: true, macOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, macOS: true, test: ".border(Color.red)")
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
                    Check(iOS: true, macOS: true, test: ".listStyle(InsetListStyle())")
                    Check(iOS: true, macOS: true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(iOS: true, macOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, macOS: true, test: ".border(Color.red)")
                }
            }
            
            TestCase("List .listStyle(InsetGroupedListStyle())") {
                #if os(macOS)
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
                #else
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
                #endif

                TestResult {
                    Check(iOS: true, test: ".listStyle(InsetGroupedListStyle())")
                    Check(iOS: true, test: ".listRowBackground(Color.blue.lighter)")
                    Check(iOS: true, test: ".frame(width: 300, height: 500)")
                    Check(iOS: true, test: ".border(Color.red)")
                }
            }
            
            Group {
                TestCase("List > height of cells: .listRowInsets(.none)") {
                    VStack {
                        List {
                            Section(header: Text("Section 1")) {
                                ForEach(1..<6) {
                                    (pItem:Int) in
                                    HStack {
                                        if pItem % 2 == 0 {
                                            Spacer()
                                        }
                                        Text("Item \(pItem)")
                                            .foregroundColor(.white)
                                            .background(Color.red)
                                    }
                                }
                                .listRowBackground(Color.blue.lighter)
                                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                        .listStyle(DefaultListStyle())
                    }
                    .frame(width: 300, height: 500)
                    .border(Color.red)
                    .background(Color.systemGray6)
                    
                    TestResult {
                        Check(iOS: true, macOS: true, test: "ForEach .listRowInsets, leading 0")
                        Check(iOS: true, macOS: true, test: "ForEach .listRowInsets, trailing 0")
                        Check(iOS: false, macOS: false, test: "ForEach .listRowInsets, top 0")
                        Check(iOS: false, macOS: false, test: "ForEach .listRowInsets, bottom 0")
                    }
                }
                
                TestCase("List > height of cells: .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))") {
                    VStack {
                        List {
                            Section(header: Text("Section 1")) {
                                ForEach(1..<6) {
                                    (pItem:Int) in
                                    HStack {
                                        if pItem % 2 == 0 {
                                            Spacer()
                                        }
                                        Text("Item \(pItem)")
                                            .foregroundColor(.white)
                                            .background(Color.red)
                                    }
                                }
                                .listRowBackground(Color.blue.lighter)
                                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                        .listStyle(DefaultListStyle())
                    }
                    .frame(width: 300, height: 500)
                    .border(Color.red)
                    .background(Color.systemGray6)
                    
                    TestResult {
                        Check(iOS: true, macOS: true, test: "ForEach .listRowInsets, leading 0")
                        Check(iOS: true, macOS: true, test: "ForEach .listRowInsets, trailing 0")
                        Check(iOS: false, macOS: false, test: "ForEach .listRowInsets, top 0")
                        Check(iOS: false, macOS: false, test: "ForEach .listRowInsets, bottom 0")
                    }
                }
                
                TestCase("List > height of cells: .frame(height: 10)") {
                    VStack {
                        List {
                            Section(header: Text("Section 1")) {
                                ForEach(1..<6) {
                                    (pItem:Int) in
                                    HStack {
                                        if pItem % 2 == 0 {
                                            Spacer()
                                        }
                                        Text("Item \(pItem)")
                                            .foregroundColor(.white)
                                            .background(Color.red)
                                    }
                                    .frame(height: 10)
                                }
                                .listRowBackground(Color.blue.lighter)
                            }
                        }
                        .listStyle(DefaultListStyle())
                    }
                    .frame(width: 300, height: 500)
                    .border(Color.red)
                    .background(Color.systemGray6)
                    
                    TestResult {
                        Check(iOS: false, macOS: false, test: "Cell .frame(height: 10)")
                    }
                }
            }
        }
    }
}

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList()
    }
}
