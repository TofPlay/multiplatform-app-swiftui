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
    
    struct BindingAlert:Identifiable {
        var id: UUID = UUID()
    }
    
    struct BindingActionSheet:Identifiable {
        var id: UUID = UUID()
    }
    
    struct BindingFullScreenCover: Identifiable {
        var id: UUID = UUID()
    }
    
    struct BindingSheet: Identifiable {
        var id: UUID = UUID()
    }
    
    struct DisplaySheet: View {
        let title: String
        
        @Environment (\.presentationMode) var presentationMode

        public init(_ pTitle:String) {
            self.title = pTitle
        }
        
        var body: some View {
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)

                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Dismiss")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    @State private var showAlert: Bool = false
    @State private var bindingAlert: BindingAlert? = nil
    @State private var showActionSheet: Bool = false
    @State private var bindingActionSheet: BindingActionSheet? = nil
    @State private var showFullScreenCover: Bool = false
    @State private var bindingFullScreenCover: BindingFullScreenCover? = nil
    @State private var showSheet: Bool = false
    @State private var bindingSheet: BindingSheet? = nil
    @State private var alert:AlertView? = nil
    
    var body: some View {
        TestBody(test: .presentingViews) {
            TestCase("Alert with .isPresented") {
                Button {
                    showAlert = true
                } label: {
                    Text("Alert with .isPresented")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .alert(isPresented: $showAlert) {
                    () -> Alert in
                    Alert(title: Text("ActionSheet with .isPresented"), message: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur."), dismissButton: .default(Text("OK")))
                }

                TestResult {
                    Check(valid:  true, test: "Display Alert")
                }
            }
            
            TestCase("Alert with binding item") {
                Button {
                    bindingAlert = BindingAlert()
                } label: {
                    Text("Alert with binding item")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .alert(item: $bindingAlert) {
                    (pBindingAlert) -> Alert in
                    Alert(title: Text("Alert with binding item"), message: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur."), dismissButton: .default(Text("OK")))
                }

                TestResult {
                    Check(valid:  true, test: "Display Alert")
                }
            }

            #if os(macOS)
            TestCase("ActionSheet with .isPresented") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("ActionSheet with .isPresented") {
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

                    let lButtons: [ActionSheet.Button] = [
                        .default(Text("Option1")) {
                            alert = AlertView("ActionSheet", message: "Click on Option1")
                        },
                        .default(Text("Option2")) {
                            alert = AlertView("ActionSheet", message: "Click on Option2")
                        },
                        .destructive(Text("Delete")) {
                            alert = AlertView("ActionSheet", message: "Click on Delete")
                        },
                        .cancel()
                    ]
                    
                    return ActionSheet(title: Text("ActionSheet with .isPresented"),
                                       message: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur."),
                                       buttons: lButtons)
                }
                .alert(item: $alert) {
                    (pAlert:AlertView) -> Alert in
                    Alert(title: Text(pAlert.title), message: Text(pAlert.message), dismissButton: .default(Text("OK")))
                }

                TestResult {
                    Check(valid:  true, test: "Display ActionSheet")
                    Check(valid:  true, test: "Display \"Option1\"")
                    Check(valid:  true, test: "Display \"Option2\"")
                    Check(valid:  true, test: "Display \"Delete\"")
                    Check(valid:  false, test: "Display \"Cancel\"")
                }
            }
            #endif
            
            #if os(macOS)
            TestCase("ActionSheet with binding item") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("ActionSheet with binding item") {
                Button {
                    bindingActionSheet = BindingActionSheet()
                } label: {
                    Text("ActionSheet with binding item")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .actionSheet(item: $bindingActionSheet) {
                    (pBindingActionSheet) -> ActionSheet in

                    let lButtons: [ActionSheet.Button] = [
                        .default(Text("Option1")) {
                            alert = AlertView("ActionSheet", message: "Click on Option1")
                        },
                        .default(Text("Option2")) {
                            alert = AlertView("ActionSheet", message: "Click on Option2")
                        },
                        .destructive(Text("Delete")) {
                            alert = AlertView("ActionSheet", message: "Click on Delete")
                        },
                        .cancel()
                    ]
                    
                    return ActionSheet(title: Text("ActionSheet with binding item"),
                                       message: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur."),
                                       buttons: lButtons)
                        
                }
                .alert(item: $alert) {
                    (pAlert:AlertView) -> Alert in
                    Alert(title: Text(pAlert.title), message: Text(pAlert.message), dismissButton: .default(Text("OK")))
                        
                }

                TestResult {
                    Check(valid:  true, test: "Display ActionSheet")
                    Check(valid:  true, test: "Display \"Option1\"")
                    Check(valid:  true, test: "Display \"Option2\"")
                    Check(valid:  true, test: "Display \"Delete\"")
                    Check(valid:  false, test: "Display \"Cancel\"")
                }
            }
            #endif
            
            #if os(macOS)
            TestCase("FullScreenCover with .isPresented") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("FullScreenCover with .isPresented") {
                Button {
                    showFullScreenCover = true
                } label: {
                    Text("FullScreenCover with .isPresented")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .fullScreenCover(isPresented: $showFullScreenCover) {
                    DisplaySheet("Sheet for FullScreenCover")
                }

                TestResult {
                    Check(valid:  true, test: "Display SheetForFullScreen")
                }
            }
            #endif

            #if os(macOS)
            TestCase("FullScreenCover with binding item") {
                Text("Only supported on iOS/iPadOS")
                    .foregroundColor(.orange)
            }
            #else
            TestCase("FullScreenCover with binding item") {
                Button {
                    bindingFullScreenCover = BindingFullScreenCover()
                } label: {
                    Text("FullScreenCover with binding item")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .fullScreenCover(item: $bindingFullScreenCover) {
                    (pBindingFullScreenCover) in
                    DisplaySheet("Sheet for FullScreenCover")
                }

                TestResult {
                    Check(valid:  true, test: "Display SheetForFullScreen")
                }
            }
            #endif

            TestCase("Sheet with .isPresented") {
                Button {
                    showSheet = true
                } label: {
                    Text("Sheet with .isPresented")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showSheet) {
                    DisplaySheet("I'm the sheet")
                }

                TestResult {
                    Check(valid:  true, test: "Present a Sheet")
                    #if os(iOS)
                    Check(valid:  false, test: "Adjuste frame size to the content")
                    #else
                    Check(valid:  true, test: "Adjuste frame size to the content")
                    #endif
                }
            }

            TestCase("Sheet with binding item") {
                Button {
                    bindingSheet = BindingSheet()
                } label: {
                    Text("Sheet with binding item")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(item: $bindingSheet) {
                    (pBindingSheet) in
                    DisplaySheet("I'm the sheet")
                        .frame(width: 200, height: 500)
                }

                TestResult {
                    Check(valid:  true, test: "Present a Sheet")
                    #if os(iOS)
                    Check(valid:  false, test: "Sheet.frame(width: 200, height: 500)")
                    #else
                    Check(valid:  true, test: "Sheet.frame(width: 200, height: 500)")
                    #endif
                }
            }
        }
    }
}

struct TestActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        TestPresentingViews()
    }
}
