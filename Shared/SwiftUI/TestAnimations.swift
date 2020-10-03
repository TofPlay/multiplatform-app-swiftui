//
//  TestAnimations.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 12/09/2020.
//

import SwiftUI

struct TestAnimations: View {
    @State private var animate: Bool = true
    @State private var twoState: Bool = false
    
    let duration: Double = 1.5

    var body: some View {
        TestBody(test: .animations) {
            
            Group {
                TestCase("Modifier .animation(.easeInOut) + rotationEffect") {
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(animate ? .blue : .red)
                            .frame(width: 50, height: 50)
                            .rotationEffect(Angle(degrees: animate ? 360 : 0))
                            .offset(x: animate ? -25 : 25)
                            .animation(.easeInOut(duration: 2.0))
                            .onAppear {
                                self.animate.toggle()
                            }
                    }
                    .frame(width: 100, height: 50)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".rotationEffect(Angle(degrees: animate ? 360 : 0))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 2.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.move(edge: .leading))") {
                    
                    VStack(alignment: .leading) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .offset(x: 25)
                                .transition(.move(edge: .leading))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .offset(x: 25)
                                .transition(.move(edge: .leading))
                                .animation(.easeInOut(duration: 1.0))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.move(edge: .leading))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.move(edge: .trailing))") {
                    
                    VStack(alignment: .trailing) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .offset(x: -25)
                                .transition(.move(edge: .trailing))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .offset(x: -25)
                                .transition(.move(edge: .trailing))
                                .animation(.easeInOut(duration: 1.0))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.move(edge: .trailing))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.move(edge: .top))") {
                    
                    HStack(alignment: .top) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .offset(y:25)
                                .transition(.move(edge: .top))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .offset(y:25)
                                .transition(.move(edge: .top))
                                .animation(.easeInOut(duration: 1.0))
                        }
                    }
                    .frame(width: 50, height: 100)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.move(edge: .top))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.move(edge: .bottom))") {
                    HStack(alignment: .bottom) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .offset(y:-25)
                                .transition(.move(edge: .bottom))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .offset(y:-25)
                                .transition(.move(edge: .bottom))
                                .animation(.easeInOut(duration: 1.0))
                        }
                        
                    }
                    .frame(width: 50, height: 100)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.move(edge: .bottom))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))") {
                    
                    VStack(alignment: .trailing) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                .animation(.easeInOut(duration: 1.0))
                        }
                    }
                    .frame(width: 150, height: 50)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))", .success(os: .iOS), .success(os: .macOS))
                        Check(".transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
                
                TestCase("Modifier .animation(.easeInOut) + .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))") {
                    
                    VStack(alignment: .trailing) {
                        if animate {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                                .animation(.easeInOut(duration: 1.0))
                        } else {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                                .animation(.easeInOut(duration: 1.0))
                        }
                    }
                    .frame(width: 50, height: 150)
                    .border(Color.red)
                    
                    Button("Animate") {
                        self.animate.toggle()
                    }
                    
                    TestResult {
                        Check(".transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))", .success(os: .iOS), .success(os: .macOS))
                        Check(".transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(.easeInOut(duration: 1.0))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
            }
            
            
            Group {
                TestCase("Animate Rectangle") {
                    
                    VStack(alignment: .center) {
                        Rectangle()
                            .trim(from: 0, to: twoState ? 1.0 : 0)
                            .stroke(Color.blue, lineWidth: 3)
                            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))

                    }
                    .frame(width: 100, height: 100)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }

                    TestResult {
                        Check("Rectangle .trim(from: 0, to: twoState ? 1.0 : 0)", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Animate RoundedRectangle") {
                    
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 3)
                            .trim(from: 0, to: twoState ? 1.0 : 0)
                            .stroke(Color.blue, lineWidth: 3)
                            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))

                    }
                    .frame(width: 100, height: 100)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }

                    TestResult {
                        Check("RoundedRectangle .trim(from: 0, to: twoState ? 1.0 : 0)", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Animate Circle") {
                    
                    VStack(alignment: .center) {
                        Circle()
                            .trim(from: 0, to: twoState ? 1.0 : 0)
                            .stroke(Color.blue, lineWidth: 3)
                            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))

                    }
                    .frame(width: 100, height: 100)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }

                    TestResult {
                        Check("Circle .trim(from: 0, to: twoState ? 1.0 : 0)", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Animate Paths") {
                    
                    HStack {
                        VStack(alignment: .center) {
                            Path {
                                pPath in
                                pPath.move(to: .zero)
                                pPath.addLines([
                                    CGPoint(x: 0, y: 50),
                                    CGPoint(x: 50, y: 100),
                                    CGPoint(x: 100, y: 0)
                                ])
                            }
                            .trim(from: 0, to: twoState ? 1.0 : 0)
                            .stroke(Color.green, lineWidth: 8)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                            
                        }
                        .frame(width: 100, height: 100)
                        .border(Color.red)
                        .onAppear {
                            twoState = true
                        }
                        
                        VStack(alignment: .center) {
                            Path {
                                pPath in
                                pPath.move(to: .zero)
                                pPath.addLines([
                                    CGPoint(x: 0, y: 0),
                                    CGPoint(x: 100, y: 100)
                                ])
                                pPath.move(to: CGPoint(x: 100, y: 0))
                                pPath.addLines([
                                    CGPoint(x: 100, y: 0),
                                    CGPoint(x: 0, y: 100)
                                ])
                            }
                            .trim(from: 0, to: twoState ? 1.0 : 0)
                            .stroke(Color.red, lineWidth: 8)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                            
                        }
                        .frame(width: 100, height: 100)
                        .border(Color.red)
                        .onAppear {
                            twoState = true
                        }
                    }

                    TestResult {
                        Check("Path .move()", .success(os: .iOS), .success(os: .macOS))
                        Check("Path .addLines()", .success(os: .iOS), .success(os: .macOS))
                        Check("Path .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))", .success(os: .iOS), .success(os: .macOS))
                    }
                }
            }

            Group {

                TestCase("Modifier .animation(.linear) + repeatForever + .delay") {
                    
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: twoState ? 100 : 0, height: twoState ? 100 : 0)
                            .opacity(twoState ? 0 : 1)
                            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(0.1))

                        Circle()
                            .foregroundColor(.red)
                            .frame(width: twoState ? 100 : 0, height: twoState ? 100 : 0)
                            .opacity(twoState ? 0 : 1)
                            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(0.9))

                    }
                    
                    .frame(width: 100, height: 100)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }

                    TestResult {
                        Check(".opacity(twoState ? 0 : 1)", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(0.1))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(0.9))", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Modifier .animation(.linear) + repeatForever + .scaleEffect") {
                    
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundColor(.red)
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                            .scaleEffect(twoState ? 1.0 : 0.5)
                    }
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                    .frame(width: 100, height: 100)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }

                    TestResult {
                        Check(".scaleEffect(twoState ? 1.0 : 0.5)", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Modifier .animation(.linear) + repeatForever + .rotationEffect") {
                    
                    ZStack(alignment: .center) {
                        Circle()
                            .stroke(Color.systemGray4, lineWidth: 14)
                            .frame(width: 100, height: 100)

                        Circle()
                            .trim(from: 0, to: 0.2)
                            .stroke(Color.green, lineWidth: 7)
                            .frame(width: 100, height: 100)
                            .rotationEffect(Angle(degrees: twoState ? 360 : 0))
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                            .onAppear {
                                twoState = true
                            }
                    }
                    .frame(width: 114, height: 114)
                    .border(Color.red)
                    
                    TestResult {
                        Check(".rotationEffect(Angle(degrees: twoState ? 360 : 0))", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))", .success(os: .iOS), .success(os: .macOS))
                    }
                }

                TestCase("Modifier .animation(.linear) + repeatForever + .offset") {
                    
                    VStack(alignment: .center) {
                        Text("Loading")
                            .font(.system(.body, design: .rounded))
                            .bold()
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.systemGray4, lineWidth: 3)
                                .frame(width: 250, height: 3)
                            
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.green, lineWidth: 3)
                                .frame(width: 30, height: 3)
                                .offset(x: twoState ? 110 : -110, y: 0)
                                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        }
                    }
                    .frame(width: 260, height: 50)
                    .border(Color.red)
                    .onAppear {
                        twoState = true
                    }
                    
                    TestResult {
                        Check(".offset(x: twoState ? 110 : -110, y: 0)", .success(os: .iOS), .success(os: .macOS))
                        Check(".animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))", .success(os: .iOS), .success(os: .macOS))
                    }
                }

            }
        }
    }
}

struct TestAnimations_Previews: PreviewProvider {
    static var previews: some View {
        TestAnimations()
    }
}

