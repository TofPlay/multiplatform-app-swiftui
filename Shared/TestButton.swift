//
//  TestButton.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestButton: View {
    struct Select: Identifiable {

        public enum `Type`: String {
            case `default`
            case bordered
            case borderedLess = "border less"
            case card
            case link
            case plain
            case customLabel = "custom label"
        }
        
        public var id: `Type`

    }
    
    @State private var select: Select?
    
    var body: some View {
        TestBody(test: .button) {
            TestCase("Button .buttonStyle(DefaultButtonStyle())") {
                Button("Press me") {
                    select = Select(id:.default)
                }
                .buttonStyle(DefaultButtonStyle())

                TestResult {
                    Check(valid:  true, test: ".buttonStyle(DefaultButtonStyle())")
                    #if os(macOS)
                    Check(valid:  false, test: "Alert display one time")
                    #else
                    Check(valid:  true, test: "Alert display one time")
                    #endif
                }
            }
            TestCase("Button .buttonStyle(BorderedButtonStyle())") {
                #if os(macOS)
                Button("Press me") {
                    select = Select(id:.bordered)
                }
                .buttonStyle(BorderedButtonStyle())

                TestResult {
                    Check(valid:  true, test: ".buttonStyle(BorderedButtonStyle())")
                    Check(valid:  false, test: "Alert display one time")
                }
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
            }
            TestCase("Button .buttonStyle(BorderlessButtonStyle())") {
                Button("Press me") {
                    select = Select(id:.borderedLess)
                }
                .buttonStyle(BorderlessButtonStyle())

                TestResult {
                    Check(valid:  true, test: ".buttonStyle(BorderlessButtonStyle())")
                    #if os(macOS)
                    Check(valid:  false, test: "Alert display one time")
                    #else
                    Check(valid:  true, test: "Alert display one time")
                    #endif
                }
            }
            TestCase("Button .buttonStyle(CardButtonStyle())") {
                #if os(tvOS)
                Button("Press me") {
                    select = Alert(id:.card)
                }
                .buttonStyle(CardButtonStyle())

                TestItem("Checks", divider: false) {
                    Check(valid:  true, test: ".buttonStyle(CardButtonStyle())")
                }
                #else
                Text("Only supported on tvOS")
                    .foregroundColor(.orange)
                #endif
            }
            TestCase("Button .buttonStyle(LinkButtonStyle())") {
                #if os(macOS)
                Button("Press me") {
                    select = Select(id:.link)
                }
                .buttonStyle(LinkButtonStyle())

                TestResult {
                    Check(valid:  true, test: ".buttonStyle(LinkButtonStyle())")
                    #if os(macOS)
                    Check(valid:  false, test: "Alert display one time")
                    #else
                    Check(valid:  true, test: "Alert display one time")
                    #endif
                }
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
            }
            TestCase("Button .buttonStyle(PlainButtonStyle())") {
                Button("Press me") {
                    select = Select(id:.plain)
                }
                .buttonStyle(PlainButtonStyle())

                TestResult {
                    Check(valid:  true, test: ".buttonStyle(PlainButtonStyle())")
                    #if os(macOS)
                    Check(valid:  false, test: "Alert display one time")
                    #else
                    Check(valid:  true, test: "Alert display one time")
                    #endif
                }
            }
            TestCase("Button custom label") {
                Button {
                    select = Select(id:.customLabel)
                } label: {
                    Text("Press me")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())

                TestResult {
                    Check(valid:  true, test: "Custom label")
                    #if os(macOS)
                    Check(valid:  false, test: "Alert display one time")
                    #else
                    Check(valid:  true, test: "Alert display one time")
                    #endif
                }
            }
        }
        .alert(item: $select) {
            pSelect in
            print(pSelect)
            return Alert(title: Text("\(pSelect.id.rawValue)"))
        }
    }
}

struct TestButton_Previews: PreviewProvider {
    static var previews: some View {
        TestButton()
    }
}
