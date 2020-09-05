//
//  DetailView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct DetailView: View {
    @Binding public var select: Test?
    @Binding public var views:[Test:AnyView]
    
    struct DefaultView: View {
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Label("Select a test", systemImage: "arrow.left")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    var body: some View {
        VStack {
            displayView()
        }
    }
    
    private func displayView() -> AnyView {
        var lRet:AnyView
        
        if let lSelect = select {
            if let lTestView = views[lSelect] {
                lRet = lTestView
            } else {
                lRet = AnyView(DefaultView())
            }
        } else {
            lRet = AnyView(DefaultView())
        }
        
        return lRet
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(select: .constant(nil), views: .constant([:]))
    }
}
