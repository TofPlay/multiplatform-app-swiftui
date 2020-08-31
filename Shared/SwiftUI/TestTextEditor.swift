//
//  EditorView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestTextEditor: View {
    @State private var editor = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla varius tincidunt quam. Donec et pharetra est. Phasellus in consectetur nisi, nec tincidunt arcu. Donec non egestas nibh, at pharetra ex. Suspendisse at mollis massa. Etiam sed dignissim nisl. Aliquam luctus commodo diam, accumsan efficitur massa malesuada sed. Maecenas vel augue pellentesque, porta est et, sodales purus. Aenean finibus sit amet turpis sed varius. Vivamus rhoncus viverra nunc, id hendrerit nibh rutrum in. Nam lacinia nisi ut elit euismod varius.

    Donec molestie ullamcorper felis, vel interdum orci egestas quis. Morbi laoreet ante urna, id interdum nulla tempor in. Cras vestibulum nisl eu lectus consectetur blandit. Integer luctus felis quis turpis posuere, eget consectetur elit placerat. Donec ac erat maximus, tristique justo quis, efficitur tortor. Maecenas ultricies feugiat velit id tincidunt. Nullam vitae luctus magna. Integer egestas imperdiet massa at iaculis.
    """
    
    var body: some View {
        TestBody(test: .textEditor) {
            TestCase("Editor") {
                TextEditor(text: $editor)
                    .frame(height: 200)
                    .border(Color.black, width: 1)
                
                TestResult {
                    Check(iOS: true, macOS: true, test: "TextEditor")
                }
            }
        }
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        TestTextEditor()
    }
}
