//
//  Sidebar.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct Sidebar: View {
    @Binding public var headings:[Heading]
    @Binding public var select: Test?
    
    @State private var over:Test? = nil
    
    struct Item: View {
        @Binding public var select: Test?
        @Binding public var over:Test?
        
        let test: Test
        
        var body: some View {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(backgroundColor(test: test))
                Text("\(test.rawValue)")
                    .foregroundColor(test == select ? Color.white : Color.secondary)
                    .padding(.horizontal, 10)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                select = test
            }
            .onHover {
                (pHover:Bool) in
                if pHover {
                    over = test
                }
            }
        }

        func backgroundColor(test pTest:Test) -> Color {
            var lRet = Color.clear
            
            if select == pTest {
                lRet = Color.gray.opacity(0.50)
            } else if let lOver = over, lOver == pTest {
                lRet = Color.gray.opacity(0.25)
            }
            
            return lRet
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                ForEach(headings) {
                    pHeading in
                    Section(header: Text(pHeading.id)) {
                        ForEach(pHeading.tests, id: \.self) {
                            pTest in
                            Item(select: $select, over: $over, test: pTest)
                        }
                    }

                }
            }
            .listStyle(SidebarListStyle())
        }
    }
    
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(headings: .constant([Heading(id: "SwiftUI", tests: [.progressView, .textEditor, .datePicker, .colorPicker, .map])]), select: .constant(.datePicker))
    }
}

