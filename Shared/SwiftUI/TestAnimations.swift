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
                        Check(iOS: true, macOS: true, test: ".rotationEffect(Angle(degrees: animate ? 360 : 0))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 2.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.move(edge: .leading))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.move(edge: .trailing))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.move(edge: .top))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.move(edge: .bottom))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))")
                        Check(iOS: true, macOS: true, test: ".transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: ".transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))")
                        Check(iOS: true, macOS: true, test: ".transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))")
                        Check(iOS: true, macOS: true, test: ".animation(.easeInOut(duration: 1.0))")
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
                        Check(iOS: true, macOS: true, test: "Rectangle .trim(from: 0, to: twoState ? 1.0 : 0)")
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
                        Check(iOS: true, macOS: true, test: "RoundedRectangle .trim(from: 0, to: twoState ? 1.0 : 0)")
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
                        Check(iOS: true, macOS: true, test: "Circle .trim(from: 0, to: twoState ? 1.0 : 0)")
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
                        Check(iOS: true, macOS: true, test: "Path .move()")
                        Check(iOS: true, macOS: true, test: "Path .addLines()")
                        Check(iOS: true, macOS: true, test: "Path .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))")
                    }
                }
            }

            Group {
                TestCase("Modifier .animation(.linear) + repeatForever + .scaleEffect") {
                    
                    ZStack(alignment: .center) {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.red)
                            .animation(.default)
                        
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
                        Check(iOS: true, macOS: true, test: ".scaleEffect(twoState ? 1.0 : 0.5)")
                        Check(iOS: true, macOS: true, test: ".animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))")
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
                        Check(iOS: true, macOS: true, test: ".rotationEffect(Angle(degrees: twoState ? 360 : 0))")
                        Check(iOS: true, macOS: true, test: ".animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))")
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
                        Check(iOS: true, macOS: true, test: ".offset(x: twoState ? 110 : -110, y: 0)")
                        Check(iOS: true, macOS: true, test: ".animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))")
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

