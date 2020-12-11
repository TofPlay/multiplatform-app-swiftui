//
//  MultiplatformAppSwiftUI.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

public enum Test: String {
    // SwiftUI
    case color = "Color"
    case text = "Text"
    case label = "Label"
    case textField = "TextField"
    case secureField = "SecureField"
    case textEditor = "TextEditor"
    case button = "Button"
    case toggle = "Toggle"
    case slider = "Slider"
    case stepper = "Stepper"
    case progressView = "ProgressView"
    case shape = "Shape"
    case image = "Image"
    case link = "Link"
    case videoPlayer = "VideoPlayer"
    case scrollView = "ScrollView"
    case splitView = "SplitView"
    case webView = "WebView"
    case list = "List"
    case disclosureGroup = "DisclosureGroup"
    case outlineGroup = "OutlineGroup"
    case picker = "Picker"
    case datePicker = "DatePicker"
    case colorPicker = "ColorPicker"
    case form = "Form"
    case map = "Map"
    case lazyVGrid = "LazyVGrid"
    case lazyVGridAndSections = "LazyVGrid + Sections"
    case toolbarItem = "ToolbarItem"
    case navigationLinkButton = "NavigationLink (button)"
    case navigationLinkList = "NavigationLink (list)"
    case presentingViews = "Presenting Views"
    case transitionView = "TransitionView"
    case animations = "Animations"
    
    // Wrappers
    case wrapperWebView = "Wrapper: WebView"
    
    // Components
    case navigationStack = "NavigationStack"
}

public struct Heading: Identifiable {
    public var id: String
    public var tests: [Test]
}

@main
struct MultiplatformAppSwiftUI: App {
    
    @State private var headings: [Heading] = [
        Heading(id: "1. SwiftUI", tests: [
            .color,
            .text,
            .label,
            .textField,
            .secureField,
            .textEditor,
            .button,
            .toggle,
            .slider,
            .stepper,
            .progressView,
            .shape,
            .image,
            .link,
            .videoPlayer,
            .animations,
            .scrollView,
            .splitView,
            .webView,
            .list,
            .disclosureGroup,
            .outlineGroup,
            .picker,
            .datePicker,
            .colorPicker,
            .form,
            .map,
            .lazyVGrid,
            .lazyVGridAndSections,
            .toolbarItem,
            .navigationLinkButton,
            .navigationLinkList,
            .presentingViews,
            .transitionView
        ]),
        Heading(id: "2. Wrappers", tests: [.wrapperWebView]),
        Heading(id: "3. Components", tests: [.navigationStack])
    ]

    @State private var views:[Test:AnyView] = [
        .color : AnyView(TestColor()),
        .text : AnyView(TestText()),
        .label : AnyView(TestLabel()),
        .textField : AnyView(TestTextField()),
        .secureField : AnyView(TestSecureField()),
        .textEditor : AnyView(TestTextEditor()),
        .button : AnyView(TestButton()),
        .toggle : AnyView(TestToggle()),
        .slider : AnyView(TestSlider()),
        .stepper : AnyView(TestStepper()),
        .progressView : AnyView(TestProgressView()),
        .shape : AnyView(TestShape()),
        .image : AnyView(TestImage()),
        .videoPlayer : AnyView(TestVideoPlayer()),
        .animations: AnyView(TestAnimations()),
        .scrollView : AnyView(TestScrollView()),
        .splitView : AnyView(TestSplitView()),
        .webView : AnyView(TestWebView()),
        .link : AnyView(TestLink()),
        .list : AnyView(TestList()),
        .disclosureGroup : AnyView(TestDisclosureGroup()),
        .outlineGroup : AnyView(TestOutlineGroup()),
        .picker : AnyView(TestPicker()),
        .datePicker : AnyView(TestDatePicker()),
        .colorPicker : AnyView(TestColorPicker()),
        .form : AnyView(TestForm()),
        .map : AnyView(TestMap()),
        .lazyVGrid : AnyView(TestLazyVGrid()),
        .lazyVGridAndSections : AnyView(TestGridAndSections()),
        .toolbarItem : AnyView(TestToolbarItem()),
        .navigationLinkButton : AnyView(TestNavigationLinkButton()),
        .navigationLinkList : AnyView(TestNavigationLinkList()),
        .presentingViews : AnyView(TestPresentingViews()),
        .transitionView : AnyView(TestTransitionView()),
        .wrapperWebView : AnyView(TestWrapperWebView()),
        .navigationStack : AnyView(TestNavigationStack())
    ]
    
    @State private var select:Test? = nil
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Sidebar(headings: $headings, select: $select)
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

                #if os(iOS)
                DetailView(select: $select, views: $views)
                    .navigationTitle("Multiplatform App SwiftUI")
                    .navigationBarTitleDisplayMode(.inline)
                #else
                DetailView(select: $select, views: $views)
                    .frame(minWidth: 900, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                #endif
            }
            .navigationTitle("Multiplatform App SwiftUI")
        }
    }

    #if os(macOS)
    func toggleSidebar() {
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}
