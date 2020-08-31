//
//  TestText.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestText: View {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        TestBody(test: .text) {
            TestCase("Basics modifiers") {
                Text("Bold")
                    .bold()
                
                Text("Italic")
                    .italic()
                
                Text("Underline")
                    .underline()

                TestResult {
                    Check(iOS: true, macOS: true, test: ".bold()")
                    Check(iOS: true, macOS: true, test: ".italic()")
                    Check(iOS: true, macOS: true, test: ".underline()")
                }
            }
            
            TestCase("Predefined fonts") {
                Group {
                    Text("LargeTitle")
                        .font(.largeTitle)
                    
                    Text("Title")
                        .font(.title)
                    
                    Text("Title2")
                        .font(.title2)
                    
                    Text("Title3")
                        .font(.title3)
                    
                    Text("Headline")
                        .font(.headline)
                    
                    Text("Subheadline")
                        .font(.subheadline)

                }
                
                Group {
                    Text("Body")
                        .font(.body)
                    
                    Text("Callout")
                        .font(.callout)
                    
                    Text("Caption")
                        .font(.caption)
                    
                    Text("Caption2")
                        .font(.caption2)
                    
                    Text("Footnote")
                        .font(.footnote)
                }

                TestResult {
                    Check(iOS: true, macOS: true, test: ".font(.largeTitle)")
                    Check(iOS: true, macOS: true, test: ".font(.title)")
                    Check(iOS: true, macOS: true, test: ".font(.title3)")
                    Check(iOS: true, macOS: true, test: ".font(.headline)")
                    Check(iOS: true, macOS: true, test: ".font(.subheadline)")
                    Check(iOS: true, macOS: true, test: ".font(.body)")
                    Check(iOS: true, macOS: true, test: ".font(.callout)")
                    Check(iOS: true, macOS: true, test: ".font(.caption)")
                    Check(iOS: true, macOS: true, test: ".font(.caption2)")
                    Check(iOS: true, macOS: true, test: ".font(.footnote)")
                }
            }
            
            TestCase("Concat texts") {
                Text("Bold").bold() + Text(", ") + Text("Italic").italic() + Text(", ") + Text("Underline").underline()

                TestResult {
                    Check(iOS: true, macOS: true, test: "Text(\"\").bold() + Text(\"\").italic() + Text(\"\").underline()")
                }
            }
            
            TestCase("Multiline text alignment") {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur.\n Ut rhoncus convallis purus non volutpat.\n Ut dictum mauris id odio dignissim tincidunt.\n Mauris nec pulvinar neque.\n Ut eu volutpat ligula, ut suscipit nibh.\n Sed ipsum odio, semper ac velit vel, tempor pharetra massa.\n Curabitur metus diam, scelerisque in nunc et, aliquam fermentum lectus.\n Aliquam faucibus ex eget sagittis tincidunt.\n Maecenas viverra fermentum tortor eget ornare.\n Nam ornare, lacus nec auctor euismod, magna lacus efficitur ipsum, nec tristique turpis nunc nec risus.\n Sed dapibus pharetra vehicula.\n Proin accumsan convallis nunc sit amet bibendum.\n")
                    .multilineTextAlignment(.leading)

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur.\n Ut rhoncus convallis purus non volutpat.\n Ut dictum mauris id odio dignissim tincidunt.\n Mauris nec pulvinar neque.\n Ut eu volutpat ligula, ut suscipit nibh.\n Sed ipsum odio, semper ac velit vel, tempor pharetra massa.\n Curabitur metus diam, scelerisque in nunc et, aliquam fermentum lectus.\n Aliquam faucibus ex eget sagittis tincidunt.\n Maecenas viverra fermentum tortor eget ornare.\n Nam ornare, lacus nec auctor euismod, magna lacus efficitur ipsum, nec tristique turpis nunc nec risus.\n Sed dapibus pharetra vehicula.\n Proin accumsan convallis nunc sit amet bibendum.\n")
                    .multilineTextAlignment(.center)

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur.\n Ut rhoncus convallis purus non volutpat.\n Ut dictum mauris id odio dignissim tincidunt.\n Mauris nec pulvinar neque.\n Ut eu volutpat ligula, ut suscipit nibh.\n Sed ipsum odio, semper ac velit vel, tempor pharetra massa.\n Curabitur metus diam, scelerisque in nunc et, aliquam fermentum lectus.\n Aliquam faucibus ex eget sagittis tincidunt.\n Maecenas viverra fermentum tortor eget ornare.\n Nam ornare, lacus nec auctor euismod, magna lacus efficitur ipsum, nec tristique turpis nunc nec risus.\n Sed dapibus pharetra vehicula.\n Proin accumsan convallis nunc sit amet bibendum.\n")
                    .multilineTextAlignment(.trailing)

                TestResult {
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.leading)")
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.center)")
                    Check(iOS: true, macOS: true, test: ".multilineTextAlignment(.trailing)")
                }
            }
            
            TestCase("Text with string interpolation") {
                Text("Now it's: \(Date(), formatter: Self.dateFormatter)")

                TestResult {
                    Check(iOS: true, macOS: true, test: "String interpolation")
                }
            }
        }
    }
}

struct TestText_Previews: PreviewProvider {
    static var previews: some View {
        TestText()
    }
}
