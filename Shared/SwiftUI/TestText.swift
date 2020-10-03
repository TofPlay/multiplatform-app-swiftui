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
    
    struct RedactedView: View {
        
        var body: some View {
            VStack(alignment: .leading) {
                Image("sample")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                HStack {
                    Text("Lorem ipsum dolor sit amet")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Image(systemName: "cloud.sun.rain")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Vestibulum nec neque vel nisi scelerisque efficitur.\n Ut rhoncus convallis purus non volutpat.\n Ut dictum mauris id odio dignissim tincidunt.").font(.body)
            }
        }
    }
    
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
                    Check(".bold()", .success(os: .iOS), .success(os: .macOS))
                    Check(".italic()", .success(os: .iOS), .success(os: .macOS))
                    Check(".underline()", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".font(.largeTitle)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.title)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.title3)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.headline)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.subheadline)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.body)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.callout)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.caption)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.caption2)", .success(os: .iOS), .success(os: .macOS))
                    Check(".font(.footnote)", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("Concat texts") {
                Text("Bold").bold() + Text(", ") + Text("Italic").italic() + Text(", ") + Text("Underline").underline()
                
                TestResult {
                    Check("Text(\"\").bold() + Text(\"\").italic() + Text(\"\").underline()", .success(os: .iOS), .success(os: .macOS))
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
                    Check(".multilineTextAlignment(.leading)", .success(os: .iOS), .success(os: .macOS))
                    Check(".multilineTextAlignment(.center)", .success(os: .iOS), .success(os: .macOS))
                    Check(".multilineTextAlignment(.trailing)", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("Text with string interpolation") {
                Text("Now it's: \(Date(), formatter: Self.dateFormatter)")
                
                TestResult {
                    Check("String interpolation", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("Text .redacted") {
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Not redacted")
                        RedactedView()
                            .border(Color.red)
                    }
                    
                    VStack {
                        Text("Redacted")
                        RedactedView()
                            .redacted(reason: .placeholder)
                            .border(Color.red)
                    }
                }
                .padding([.leading,.trailing], 20)
                
                TestResult {
                    Check("Text .redacted(reason: .placeholder)", .success(os: .iOS), .success(os: .macOS))
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
