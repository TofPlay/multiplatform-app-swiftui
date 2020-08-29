//
//  TestBody.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestBody<Content:View>: View {
    let feature:Test
    let scroll: Bool
    let content:Content
    
    init(feature pFeature:Test, scroll pScroll:Bool = true, @ViewBuilder content pContent: ()->Content) {
        self.feature = pFeature
        self.scroll = pScroll
        self.content = pContent()
    }
    
    var body: some View {
        Group {
            Text("\(feature.rawValue)")
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
        TestBody(feature: .progressView, content: {EmptyView()})
    }
}

