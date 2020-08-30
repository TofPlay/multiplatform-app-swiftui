//
//  MultiplatformAppSwiftUI.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

public enum Test: String {
    case color = "Color"
    case text = "Text"
    case label = "Label"
    case textField = "TextField"
    case secureField = "SecureField"
    case textEditor = "TextEditor"
    case image = "Image"
    case button = "Button"
    case list = "List"
    case link = "Link"
    case toolbarItem = "ToolbarItem"
    case toggle = "Toggle"
    case picker = "Picker"
    case datePicker = "DatePicker"
    case colorPicker = "ColorPicker"
    case slider = "Slider"
    case stepper = "Stepper"
    case form = "Form"
    case progressView = "ProgressView"
    case map = "Map"
    case disclosureGroup = "DisclosureGroup"
    case outlineGroup = "OutlineGroup"
    case lazyVGrid = "LazyVGrid"
    case gridAndSections = "Grid and Sections"
    case transitionView = "TransitionView"
    case navigationLinkButton = "NavigationLink (button)"
    case navigationLinkList = "NavigationLink (list)"
    case presentingViews = "Presenting Views"
    case navigationStack = "NavigationStack"
}

@main
struct MultiplatformAppSwiftUI: App {
    @State private var swiftUI:[Test] = [
        .color,
        .text,
        .label,
        .textField,
        .secureField,
        .textEditor,
        .image,
        .button,
        .list,
        .link,
        .toolbarItem,
        .toggle,
        .picker,
        .datePicker,
        .colorPicker,
        .slider,
        .stepper,
        .form,
        .progressView,
        .map,
        .disclosureGroup,
        .outlineGroup,
        .lazyVGrid,
        .gridAndSections,
        .transitionView,
        .navigationLinkButton,
        .navigationLinkList,
        .presentingViews
    ]
    @State private var components:[Test] = [.navigationStack]
    @State private var select:Test? = nil
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Sidebar(swiftUI: $swiftUI, components: $components, select: $select)
                    .toolbar {
                        #if os(macOS)
                        ToolbarItem(placement: .primaryAction) {
                            HStack {
                                Button(action: toggleSidebar) {
                                    Image(systemName: "sidebar.left")
                                }
                                Spacer()
                            }
                        }
                        #endif
                    }

                DetailView(select: $select)
                    .frame(minWidth: 900, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
            }
            .navigationTitle("Multiplatform SwiftUI")
        }
    }

    #if os(macOS)
    func toggleSidebar() {
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}
