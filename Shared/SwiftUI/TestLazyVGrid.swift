//
//  TestLazyVGrid.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestLazyVGrid: View {
    let items = (1...5).map({"Item\($0)"})
    let columns1:[GridItem] = [
        GridItem(.fixed(100))
    ]
    let columns2:[GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    let columns3:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        TestBody(test: .lazyVGrid) {
            TestCase("Fixed, 1 columns") {
                LazyVGrid(columns: columns1) {
                    ForEach(items, id: \.self) {
                        item in
                        ZStack {
                            Rectangle()
                                .fill(Color.red)
                                .aspectRatio(contentMode: .fill)
                            Text("\(item)")
                                .padding(.all, 3)
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                }
                .background(Color.gray)

                TestResult {
                    Check("LazyVGrid + 1 GridItem(.fixed())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            TestCase("Fixed, 3 columns")  {
                LazyVGrid(columns: columns2) {
                    ForEach(items, id: \.self) {
                        item in
                        ZStack {
                            Rectangle()
                                .fill(Color.red)
                                .aspectRatio(contentMode: .fill)
                            Text("\(item)")
                                .padding(.all, 3)
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                }
                .background(Color.gray)

                TestResult {
                    Check("LazyVGrid + 3 GridItem(.fixed())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            TestCase("Flexible, 3 columns")  {
                LazyVGrid(columns: columns3) {
                    ForEach(items, id: \.self) {
                        item in
                        ZStack {
                            Rectangle()
                                .fill(Color.red)
                                .aspectRatio(contentMode: .fill)
                            Text("\(item)")
                                .padding(.all, 3)
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                    }
                }
                .background(Color.gray)

                TestResult {
                    Check("LazyVGrid + 3 GridItem(.flexible())", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestLazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        TestLazyVGrid()
    }
}
