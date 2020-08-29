//
//  TestLabel.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestLabel: View {
    let sfsymbols = ["sun.min", "sun.max", "sunrise", "sunset", "sun.dust", "sun.haze", "moon", "moon.circle", "moon.zzz", "moon.stars", "cloud", "cloud.drizzle", "cloud.rain", "cloud.heavyrain", "cloud.fog", "cloud.hail", "cloud.snow", "cloud.sleet", "cloud.bolt", "cloud.sun", "cloud.sun.rain", "cloud.sun.bolt", "cloud.moon", "cloud.moon.rain", "cloud.bolt.rain", "cloud.moon.bolt", "smoke", "a.circle", "b.circle", "c.circle", "d.circle", "e.circle", "f.circle", "g.circle", "h.circle", "i.circle", "j.circle", "k.circle", "l.circle", "m.circle", "n.circle", "o.circle", "p.circle", "q.circle", "r.circle", "s.circle", "t.circle", "u.circle", "v.circle", "w.circle", "x.circle", "y.circle", "z.circle"]
    
    let columns:[GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]

    var body: some View {
        TestBody(test: .label) {
            TestCase("Label with systemImage") {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(sfsymbols.map({[$0,$0 + ".fill"]}).flatMap({$0}), id: \.self) {
                        (pSymbol) in
                        Label(pSymbol, systemImage: pSymbol)
                    }
                }
                
                TestResult {
                    Check(valid:  true, test: "Label(_,systemImage)")
                }
            }
        }
    }
}

struct TestLabel_Previews: PreviewProvider {
    static var previews: some View {
        TestLabel()
    }
}
