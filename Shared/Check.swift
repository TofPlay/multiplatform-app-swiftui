//
//  Check.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct Check: View {
    let valid:Bool
    let test: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if valid {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)

                    Text(test)
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)

                    Text(test)
                        .foregroundColor(.red)
                }
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding(.top, -10)
    }
}

struct Check_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Check(valid: true, test: "Feature 1")
            Check(valid: false,  test: "Feature 2")
        }
    }
}
