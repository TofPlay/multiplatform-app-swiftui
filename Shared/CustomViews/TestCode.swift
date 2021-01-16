//
//  TestCode.swift
//  MultiplatformAppSwiftUI
//
//  Created by admin on 05/09/2020.
//

import SwiftUI

struct TestCode: View {
    let code: String
    
    public init(_ pCode:String) {
        self.code = pCode
    }
    
    var body: some View {
        Text(code)
            .font(.system(size: 14))
            .multilineTextAlignment(.leading)
            .fixedSize()
            .foregroundColor(.gray)
    }
}

struct TestCode_Previews: PreviewProvider {
    static var previews: some View {
        TestCode(
            """
            Text(code)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .fixedSize()
                .foregroundColor(.gray)
            """
        )
    }
}
