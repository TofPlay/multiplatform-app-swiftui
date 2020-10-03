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
                        Check(".resizable()", .success(os: .iOS), .success(os: .macOS))
                        Check(".frame(width: 300, height: 150)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .blur(radius: 5)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .blur(radius: 5)

                    TestResult {
                        Check(".blur(radius: 5)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .opacity(0.3)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .opacity(0.3)

                    TestResult {
                        Check(".opacity(0.3)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .brightness(0.60)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .brightness(0.60)

                    TestResult {
                        Check(".brightness(0.60)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .saturation(3.0)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .saturation(3.0)

                    TestResult {
                        Check(".saturation(3.0)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .grayscale(0.50)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .grayscale(0.50)

                    TestResult {
                        Check(".grayscale(0.50)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .hueRotation(Angle(degrees: 90))") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .hueRotation(Angle(degrees: 90))

                    TestResult {
                        Check(".hueRotation(Angle(degrees: 90))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .luminanceToAlpha()") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .luminanceToAlpha()

                    TestResult {
                        Check(".luminanceToAlpha()", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .shadow(color: .black, radius: 5, x: 3.0, y: 3.0)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .shadow(color: .black, radius: 5, x: 3.0, y: 3.0)

                    TestResult {
                        Check(".shadow(color: .black, radius: 5, x: 3.0, y: 3.0)", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .colorMultiply(.red)") {
                    Image("sample")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .colorMultiply(.red)

                    TestResult {
                        Check(".colorMultiply(.red)", .success(os: .iOS), .success(os: .macOS))
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
                        Check(".aspectRatio(contentMode: .fit)", .success(os: .iOS), .success(os: .macOS))
                        Check(".clipped()", .success(os: .iOS), .success(os: .macOS))
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
                        Check(".aspectRatio(contentMode: .fill)", .success(os: .iOS), .success(os: .macOS))
                        Check(".clipped()", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                TestCase("Image .clipShape(Circle())") {
                    Image("sample")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)

                    TestResult {
                        Check(".clipShape(Circle())", .success(os: .iOS), .success(os: .macOS))
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
