//
//  DetailView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct DetailView: View {
    @Binding public var select: Test?

    var body: some View {
        VStack {
            if let lSelect = select {
                switch lSelect {
                case .color:
                    TestColor()
                case .text:
                    TestText()
                case .label:
                    TestLabel()
                case .textField:
                    TestTextField()
                case .textEditor:
                    TestTextEditor()
                case .secureField:
                    TestSecureField()
                case .image:
                    TestImage()
                case .button:
                    TestButton()
                case .list:
                    TestList()
                case .link:
                    TestLink()
                case .toolbarItem:
                    TestToolbarItem()
                case .toggle:
                    TestToggle()
                case .picker:
                    TestPicker()
                case .datePicker:
                    TestDatePicker()
                case .colorPicker:
                    TestColorPicker()
                case .slider:
                    TestSlider()
                case .stepper:
                    TestStepper()
                case .form:
                    TestForm()
                case .progressView:
                    TestProgressView()
                case .map:
                    TestMap()
                case .videoPlayer:
                    TestVideoPlayer()
                case .disclosureGroup:
                    TestDisclosureGroup()
                case .outlineGroup:
                    TestOutlineGroup()
                case .lazyVGrid:
                    TestLazyVGrid()
                case .gridAndSections:
                    TestGridAndSections()
                case .transitionView:
                    TestTransitionView()
                case .navigationLinkButton:
                    TestNavigationLinkButton()
                case .navigationLinkList:
                    TestNavigationLinkList()
                case .presentingViews:
                    TestPresentingViews()
                case .navigationStack:
                    TestNavigationStack()
                }
            } else {
                Text("Select a test")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(select: .constant(nil))
    }
}
