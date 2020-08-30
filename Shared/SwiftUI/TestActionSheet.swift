//
//  TestActionSheet.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestPresentingViews: View {
    struct AlertView: Identifiable {
        var id: UUID = UUID()
        let title: String
        let message: String
        
        public init(_ pTitle:String, message pMessage:String) {
            self.title = pTitle
            self.message = pMessage
        }
    }
    
    @State private var showActionSheet: Bool = false
    @State private var alert:AlertView? = nil
    
    var body: some View {
        TestBody(test: .actionSheet) {
            #if os(macOS)
            TestCase("ActionSheet .isPresented") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("ActionSheet .isPresented") {
                Button {
                    showActionSheet = true
                } label: {
                    Text("ActionSheet with .isPresented")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .actionSheet(isPresented: $showActionSheet) {
                    () -> ActionSheet in

                    let lAction1 = ActionSheet.Button.default(Text("Option1")) {
                        alert = AlertView("ActionSheet", message: "Click on Option1")
                    }

                    let lAction2 = ActionSheet.Button.default(Text("Option2")) {
                        alert = AlertView("ActionSheet", message: "Click on Option2")
                    }

                    let lAction3 = ActionSheet.Button.default(Text("Option3")) {
                        alert = AlertView("ActionSheet", message: "Click on Option3")
                    }

                    let lCancel = ActionSheet.Button.cancel(Text("Cancel")) {
                        alert = AlertView("ActionSheet", message: "Click on Cancel")
                    }

                    let lButtons: [ActionSheet.Button] = [lAction1,lAction2,lAction3,lCancel]
                    
                    return ActionSheet(title: Text("ActionSheet .isPresented"),
                                       message: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur."),
                                       buttons: lButtons)
                }
                .alert(item: $alert) {
                    (pAlert:AlertView) -> Alert in
                    Alert(title: Text(pAlert.title), message: Text(pAlert.message), dismissButton: .default(Text("OK")))
                }

                TestResult {
                    Check(valid:  true, test: "display ActionSheet")
                    Check(valid:  true, test: "display \"Option1\"")
                    Check(valid:  true, test: "display \"Option2\"")
                    Check(valid:  false, test: "display \"Cancel\"")
                }
            }
            #endif
        }
    }
}

struct TestActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        TestPresentingViews()
    }
}
