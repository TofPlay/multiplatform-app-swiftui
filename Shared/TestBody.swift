//
//  TestBody.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestBody<Content:View>: View {
    let test:Test
    let scroll: Bool
    let content:Content
    
    init(test pTest:Test, scroll pScroll:Bool = true, @ViewBuilder content pContent: ()->Content) {
        self.test = pTest
        self.scroll = pScroll
        self.content = pContent()
    }
    
    var body: some View {
        Group {
            Text("\(test.rawValue)")
                .font(.title)
                .padding()
            if scroll == true {
                ScrollView {
                    VStack(alignment: .leading) {
                        content
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    content
                }
            }
            Spacer()
        }
    }
}

struct TestHeader_Previews: PreviewProvider {
    static var previews: some View {
        TestBody(test: .progressView, content: {EmptyView()})
    }
}

