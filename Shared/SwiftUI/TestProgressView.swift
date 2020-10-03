//
//  TestProgressView.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestProgressView: View {
    @State private var timer:Timer? = nil
    @State private var value: CGFloat = 0
    @State private var total: CGFloat = 100
    @State private var current:CGFloat = 0
    @State private var step:CGFloat = 10
    
    var body: some View {
        TestBody(test: .progressView) {
            TestCase("Simple spinner") {
                ProgressView()

                TestResult {
                    Check("ProgressView", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ProgressView with a text") {
                ProgressView("This a text")

                TestResult {
                    Check("ProgressView with text", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ProgressView .progressViewStyle(LinearProgressViewStyle())") {
                ProgressView(value: 0.65)
                    .frame(width: 300)
                    .progressViewStyle(LinearProgressViewStyle())

                TestResult {
                    Check("ProgressView .progressViewStyle(LinearProgressViewStyle())", .success(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ProgressView .progressViewStyle(CircularProgressViewStyle())") {
                ProgressView(value: 0.65)
                    .frame(width: 300)
                    .progressViewStyle(CircularProgressViewStyle())

                TestResult {
                    Check("ProgressView .progressViewStyle(CircularProgressViewStyle())", .error(os: .iOS), .success(os: .macOS))
                }
            }
            
            TestCase("ProgressView with a timer") {
                ProgressView("ProgressView \(value, specifier: "%.0f") to \(total, specifier: "%.0f"), current: \(current, specifier: "%.0f")", value: current, total: total)
                    .frame(width: 300)
                Button("Start") {
                    current = 0
                    let lTimer = Timer(timeInterval: 1.0, repeats: true, block: {
                        (pTimer:Timer) in
                        if current + step <= 100 {
                            current += step
                        } else {
                            timer?.invalidate()
                        }
                    })
                    
                    timer = lTimer
                    RunLoop.main.add(lTimer, forMode: .common)
                }

                TestResult {
                    Check("ProgressView with a timer", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TestProgressView()
            .previewLayout(.fixed(width: 300, height: 100.0))
    }
}
