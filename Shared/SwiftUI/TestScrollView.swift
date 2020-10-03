//
//  TestScrollView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 06/09/2020.
//

import SwiftUI

struct TestScrollView: View {
    @State private var col: Int = 0
    @State private var row: Int = 0
    
    @State private var colStr: String = "0"
    @State private var rowStr: String = "0"
    
    var body: some View {
        TestBody(test: .scrollView) {
            TestCase("ScrollView .vertical") {
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(0..<20) {
                        pRow in
                        
                        HStack {
                            ForEach(0..<20) {
                                pCol in
                                
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text("\(pRow),\(pCol)")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                    }
                }
                .frame(width: 400, height: 200,alignment: .topLeading)
                .clipped()
                .border(Color.red)
                .padding(.leading, 20)

                TestResult {
                    Check(".vertical", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ScrollView .horizontal") {
                
                ScrollView(.horizontal, showsIndicators: true) {
                    ForEach(0..<20) {
                        pRow in
                        
                        HStack {
                            ForEach(0..<20) {
                                pCol in
                                
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text("\(pRow),\(pCol)")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                    }
                }
                .frame(width: 400, height: 200,alignment: .topLeading)
                .clipped()
                .border(Color.red)
                .padding(.leading, 20)
                
                TestResult {
                    Check(".horizontal", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ScrollViewReader") {
                
                ScrollViewReader {
                    pScrollProxy in
                    
                    VStack(alignment: .leading) {
                        ScrollView([.vertical, .horizontal], showsIndicators: true) {
                            ForEach(0..<40) {
                                pRow in
                                
                                HStack {
                                    ForEach(0..<40) {
                                        pCol in
                                        
                                        Rectangle()
                                            .fill(col == pCol && row == pRow ? Color.red : Color.blue)
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Text("\(pRow),\(pCol)")
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.white)
                                            )
                                            .id("\(pRow),\(pCol)")
                                    }
                                }
                            }
                        }
                        .frame(width: 400, height: 200,alignment: .topLeading)
                        .clipped()
                        .border(Color.red)
                    }
                    
                    VStack(alignment: .trailing) {
                        Stepper(value: $row, in: 0...40, step: 1) {
                            Text("Row")
                            TextField("row", text: $rowStr)
                                .frame(width: 50)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                                .onChange(of: row) {
                                    _ in
                                    rowStr = "\(row)"
                                    pScrollProxy.scrollTo("\(row),\(col)")
                                }
                                .onChange(of: rowStr) {
                                    _ in
                                    if let lInt = Int(rowStr) {
                                        if lInt <= 40 {
                                            row = lInt
                                            pScrollProxy.scrollTo("\(row),\(col)")
                                        } else {
                                            rowStr = "\(row)"
                                        }
                                    } else {
                                        rowStr = "\(row)"
                                    }
                                }
                        }
                        
                        Stepper(value: $col, in: 0...40, step: 1) {
                            Text("Column")
                            TextField("column", text: $colStr)
                                .frame(width: 50)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                                .onChange(of: col) {
                                    _ in
                                    colStr = "\(col)"
                                    pScrollProxy.scrollTo("\(row),\(col)")
                                }
                                .onChange(of: colStr) {
                                    _ in
                                    if let lInt = Int(colStr) {
                                        if lInt <= 40 {
                                            col = lInt
                                            pScrollProxy.scrollTo("\(row),\(col)")
                                        } else {
                                            colStr = "\(col)"
                                        }
                                    } else {
                                        colStr = "\(col)"
                                    }
                                }
                        }
                    }
                    .frame(width: 250)
                }
                .frame(width: 400)
                .padding(.leading, 20)

                TestResult {
                    Check("ScrollViewReader", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollView()
    }
}
