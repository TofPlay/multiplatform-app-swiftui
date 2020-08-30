//
//  TestToolbarItem.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestToolbarItem: View {
    @State private var message = ""
    @State private var actToolbar = ""
    
    #if os(iOS)
    let placementLeading: ToolbarItemPlacement = .navigationBarLeading
    let placementTrailing: ToolbarItemPlacement = .navigationBarTrailing
    #else
    let placementLeading: ToolbarItemPlacement = .automatic
    let placementTrailing: ToolbarItemPlacement = .automatic
    #endif
    
    var body: some View {
        TestBody(test: .toolbarItem) {
            TestCase("Leading and trailing toolbars", alignment: .leading) {
                Button {
                    actToolbar = "leadingToolbar"
                } label: {
                    Text("Leading toolbar")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(5)
                
                Button {
                    actToolbar = "trailingToolbar"
                } label: {
                    Text("Trailing toolbar")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(5)
                
                Button {
                    actToolbar = ""
                } label: {
                    Text("Remove toolbars")
                        .foregroundColor(.white)
                        .padding(5.0)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(5)
                
                switch actToolbar {
                case "leadingToolbar":
                    VStack {}
                        .toolbar {
                            ToolbarItem(placement: placementLeading) {
                                HStack {
                                    Button {
                                        message = "Last click on (01) button"
                                    }
                                    label: {
                                        Image(systemName: "01.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    Button {
                                        message = "Last click on (02) button"
                                    }
                                    label: {
                                        Image(systemName: "02.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    Button {
                                        message = "Last click on (03) button"
                                    }
                                    label: {
                                        Image(systemName: "03.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                case "trailingToolbar":
                    VStack {}
                        .toolbar {
                            ToolbarItem(placement: placementTrailing) {
                                HStack {
                                    Button {
                                        message = "Last click on (04) button"
                                    }
                                    label: {
                                        Image(systemName: "04.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    Spacer()
                                    
                                    Button {
                                        message = "Last click on (05) button"
                                    }
                                    label: {
                                        Image(systemName: "05.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    Button {
                                        message = "Last click on (06) button"
                                    }
                                    label: {
                                        Image(systemName: "06.circle")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                default:
                    VStack {}
                        .toolbar {}
                }
                
                Text(message)
                    .font(.title2)
                    .padding()
                
                TestResult {
                    #if os(iOS)
                    Check(valid:  true, test: "Leading Toolbar")
                    Check(valid:  true, test: "Trailing Toolbar")
                    Check(valid:  true, test: "Remove toolbar")
                    Check(valid:  false, test: "Spacer() in toolbar doesn't work")
                    #else
                    Check(valid:  false, test: "Leading Toolbar")
                    Check(valid:  true, test: "Trailing Toolbar")
                    Check(valid:  true, test: "Remove toolbar")
                    Check(valid:  false, test: "Spacer() in toolbar doesn't work")
                    #endif
                }
            }
        }
    }
}

struct TestToolbarItem_Previews: PreviewProvider {
    static var previews: some View {
        TestToolbarItem()
    }
}
