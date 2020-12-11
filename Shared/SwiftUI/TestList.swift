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
                    Check(".listStyle(DefaultListStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS), .success(os: .macOS))
                    Check(".border(Color.red)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".listStyle(PlainListStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS), .success(os: .macOS))
                    Check(".border(Color.red)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".listStyle(GroupedListStyle())", .success(os: .iOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS))
                    Check(".border(Color.red)", .success(os: .iOS))
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
                    Check(".listStyle(SidebarListStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS), .success(os: .macOS))
                    Check(".border(Color.red)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".listStyle(InsetListStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS), .success(os: .macOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS), .success(os: .macOS))
                    Check(".border(Color.red)", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".listStyle(InsetGroupedListStyle())", .success(os: .iOS))
                    Check(".listRowBackground(Color.blue.lighter)", .success(os: .iOS))
                    Check(".frame(width: 300, height: 500)", .success(os: .iOS))
                    Check(".border(Color.red)", .success(os: .iOS))
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
                        Check("ForEach .listRowInsets, leading 0", .success(os: .iOS), .success(os: .macOS))
                        Check("ForEach .listRowInsets, trailing 0", .success(os: .iOS), .success(os: .macOS))
                        Check("ForEach .listRowInsets, top 0", .error(os: .iOS), .error(os: .macOS))
                        Check("ForEach .listRowInsets, bottom 0", .error(os: .iOS), .error(os: .macOS))
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
                        Check("ForEach .listRowInsets, leading 0", .success(os: .iOS), .success(os: .macOS))
                        Check("ForEach .listRowInsets, trailing 0", .success(os: .iOS), .success(os: .macOS))
                        Check("ForEach .listRowInsets, top 0", .error(os: .iOS), .error(os: .macOS))
                        Check("ForEach .listRowInsets, bottom 0", .error(os: .iOS), .error(os: .macOS))
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
                        Check("Cell .frame(height: 10)", .error(os: .iOS), .error(os: .macOS))
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
