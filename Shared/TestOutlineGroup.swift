//
//  TestOutlineGroup.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct Item: Identifiable {
    let id: UUID = UUID()
    let name: String
    var items: [Item]?
}

struct TestOutlineGroup: View {
    var body: some View {
        TestBody(feature: .disclosureGroup) {
            TestItem("OutlineGroup with VStack and 3 levels") {
                VStack {
                    ForEach(items()) {
                        item in
                        OutlineGroup(item, children: \.items) {
                            item in
                            Text(item.name)
                        }
                    }
                }
                .frame(width: 300, height: 500)
                .border(Color.red)

                TestResult {
                    Check(valid:  false, test: "Display Items")
                    Check(valid:  false, test: "Display subItems")
                    Check(valid:  true, test: ".background(Color.systemGray6)")
                }
            }

            TestItem("OutlineGroup with List and 3 levels") {
                List {
                    ForEach(items()) {
                        item in
                        OutlineGroup(item, children: \.items) {
                            item in
                            Text(item.name)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(width: 300, height: 500)
                .border(Color.red)

                TestResult {
                    Check(valid:  true, test: "Display Items")
                    Check(valid:  true, test: "Display subItems")
                    Check(valid:  false, test: ".background(Color.systemGray6)")
                }
            }
        }
        // ISSUE: Background color is not apply on the list
        .background(Color.systemGray6)
    }
    
    private func items() -> [Item] {
        let level3:[Item] = (1...3).map({Item(name: "level3.item\($0)")})
        let level2:[Item] = (1...3).map({Item(name: "level2.item\($0)",items: level3)})
        let level1:[Item] = (1...3).map({Item(name: "level1.item\($0)",items: level2)})
        
        return level1
    }
}

struct TestOutlineGroup_Previews: PreviewProvider {
    static var previews: some View {
        TestOutlineGroup()
    }
}
