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
                    Check(".buttonStyle(DefaultButtonStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("Alert display one time", .success(os: .iOS), .warning(os: .macOS, "with a dirty trick"))
                }
            }
            TestCase("Button .buttonStyle(BorderedButtonStyle())") {
                #if os(macOS)
                Button("Press me") {
                    select = Select(id:.bordered)
                }
                .buttonStyle(BorderedButtonStyle())

                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif

                TestResult {
                    Check(".buttonStyle(BorderedButtonStyle())", .success(os: .macOS))
                    Check("Alert display one time", .warning(os: .macOS, "with a dirty trick"))
                }
            }
            TestCase("Button .buttonStyle(BorderlessButtonStyle())") {
                Button("Press me") {
                    select = Select(id:.borderedLess)
                }
                .buttonStyle(BorderlessButtonStyle())

                TestResult {
                    Check(".buttonStyle(BorderlessButtonStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("Alert display one time", .success(os: .iOS), .warning(os: .macOS, "with a dirty trick"))
                }
            }
            TestCase("Button .buttonStyle(CardButtonStyle())") {
                #if os(tvOS)
                Button("Press me") {
                    select = Alert(id:.card)
                }
                .buttonStyle(CardButtonStyle())

                //TestItem("Checks", divider: false) {
                //    Check(".buttonStyle(CardButtonStyle())", .success(os: .tvOS))
                //}
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
                #else
                Text("Only supported on macOS")
                    .foregroundColor(.orange)
                #endif
                TestResult {
                    Check(".buttonStyle(LinkButtonStyle())", .success(os: .macOS))
                }
            }
            TestCase("Button .buttonStyle(PlainButtonStyle())") {
                Button("Press me") {
                    select = Select(id:.plain)
                }
                .buttonStyle(PlainButtonStyle())

                TestResult {
                    Check(".buttonStyle(PlainButtonStyle())", .success(os: .iOS), .success(os: .macOS))
                    Check("Alert display one time", .success(os: .iOS), .warning(os: .macOS, "with a dirty trick"))
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
                    Check("Custom label", .success(os: .iOS), .success(os: .macOS))
                    Check("Alert display one time", .success(os: .iOS), .warning(os: .macOS, "with a dirty trick"))
                }
            }
        }
        .alert(item: $select) {
            pSelect in

            #if os(macOS)
            // Dirty trick for macOS to display Alert one time
            DispatchQueue.main.async {
                select = nil
            }
            #endif

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
