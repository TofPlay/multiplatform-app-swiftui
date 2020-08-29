//
//  TestImage.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestImage: View {
    var body: some View {
        TestBody(test: .image) {
            Group {
                TestCase("Image .frame(width: 300, height: 150)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)

                    TestResult {
                        Check(valid:  true, test: ".resizable()")
                        Check(valid:  true, test: ".frame(width: 300, height: 150)")
                    }
                }
                TestCase("Image .blur(radius: 5)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .blur(radius: 5)

                    TestResult {
                        Check(valid:  true, test: ".blur(radius: 5)")
                    }
                }
                TestCase("Image .opacity(0.3)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .opacity(0.3)

                    TestResult {
                        Check(valid:  true, test: ".opacity(0.3)")
                    }
                }
                TestCase("Image .brightness(0.60)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .brightness(0.60)

                    TestResult {
                        Check(valid:  true, test: ".brightness(0.60)")
                    }
                }
                TestCase("Image .saturation(3.0)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .saturation(3.0)

                    TestResult {
                        Check(valid:  true, test: ".saturation(3.0)")
                    }
                }
                TestCase("Image .grayscale(0.50)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .grayscale(0.50)

                    TestResult {
                        Check(valid:  true, test: ".grayscale(0.50)")
                    }
                }
                TestCase("Image .hueRotation(Angle(degrees: 90))") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .hueRotation(Angle(degrees: 90))

                    TestResult {
                        Check(valid:  true, test: ".hueRotation(Angle(degrees: 90))")
                    }
                }
                TestCase("Image .luminanceToAlpha()") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .luminanceToAlpha()

                    TestResult {
                        Check(valid:  true, test: ".luminanceToAlpha()")
                    }
                }
                TestCase("Image .shadow(color: .black, radius: 5, x: 3.0, y: 3.0)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .shadow(color: .black, radius: 5, x: 3.0, y: 3.0)

                    TestResult {
                        Check(valid:  true, test: ".shadow(color: .black, radius: 5, x: 3.0, y: 3.0)")
                    }
                }
                TestCase("Image .colorMultiply(.red)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .colorMultiply(.red)

                    TestResult {
                        Check(valid:  true, test: ".colorMultiply(.red)")
                    }
                }
            }
            Group {
                TestCase("Image .aspectRatio(contentMode: .fit)") {
                    Image("sample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .clipped()
                        .border(Color.red)

                    TestResult {
                        Check(valid:  true, test: ".aspectRatio(contentMode: .fit)")
                        Check(valid:  true, test: ".clipped()")
                    }
                }
                TestCase("Image .aspectRatio(contentMode: .fill)") {
                    Image("sample")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipped()
                        .border(Color.red)

                    TestResult {
                        Check(valid:  true, test: ".aspectRatio(contentMode: .fill)")
                        Check(valid:  true, test: ".clipped()")
                    }
                }
                TestCase("Image .clipShape(Circle())") {
                    Image("sample")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)

                    TestResult {
                        Check(valid:  true, test: ".clipShape(Circle())")
                    }
                }
            }
        }
    }
}

struct TestImage_Previews: PreviewProvider {
    static var previews: some View {
        TestImage()
    }
}
