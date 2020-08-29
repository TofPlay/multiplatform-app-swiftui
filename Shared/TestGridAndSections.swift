//
//  TestFlexibleGrid.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestGridAndSections: View {
    let items = [
        (1...10).map({"Item\($0)"}),
        (11...25).map({"Item\($0)"}),
        (36...45).map({"Item\($0)"}),
        (46...70).map({"Item\($0)"})
    ]
    let columns:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private func headerView(_ index:Int) -> some View {
        Text("Section \(index+1)")
            .padding()
            .foregroundColor(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
    }
    
    var body: some View {
        TestBody(test: .gridAndSections) {
            TestCase("Flexible and Section, 6 columns") {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    ForEach(0..<4) {
                        section in
                        
                        Section(header: headerView(section)) {
                            ForEach(items[section], id: \.self) {
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
                    }
                }
                .background(Color.gray)
                
                TestResult {
                    Check(valid:  true, test: "LazyVGrid + Sections")
                }
            }
        }
    }
}

struct TestFlexibleGrid_Previews: PreviewProvider {
    static var previews: some View {
        TestGridAndSections()
    }
}
