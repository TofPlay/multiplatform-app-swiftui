//
//  TestShape.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 03/09/2020.
//

import SwiftUI

struct TestShape: View {
    
    struct PathLine: Shape {
        
        func path(in pRect: CGRect) -> Path {
            var lRet = Path()
            
            lRet.move(to: CGPoint(x: 0, y: pRect.midY))
            lRet.addLine(to: CGPoint(x: pRect.width,y: pRect.midY))
            
            return lRet
        }
    }
    
    struct PathElippse: Shape {
        
        func path(in pRect: CGRect) -> Path {
            let lRet = Path(ellipseIn: pRect)
            return lRet
        }
    }
    
    struct PathRoundedRectangle: Shape {
        
        func path(in pRect: CGRect) -> Path {
            let lRet = Path(roundedRect: pRect, cornerRadius: 20)
            return lRet
        }
    }
    
    struct PathRectangle: Shape {
        
        func path(in pRect: CGRect) -> Path {
            let lRet = Path(roundedRect: pRect, cornerSize: CGSize(width: 0, height: 0))
            return lRet
        }
    }
    
    let shape = RoundedRectangle(cornerRadius: 8)
    
    @State private var endDrawLines = CGFloat.zero
    @State private var showDrawLines:Bool = false
    
    var body: some View {
        TestBody(test: .shape) {
            TestCase("Basic Shapes") {
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 70)
                    .overlay(
                        Text("Circle")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .padding(.all,2)
                    .border(Color.red)
                
                Ellipse()
                    .fill(Color.blue)
                    .frame(width: 100, height: 70)
                    .overlay(
                        Text("Ellipse")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .padding(.all,2)
                    .border(Color.red)
                
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 100, height: 70)
                    .overlay(
                        Text("Capsule")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .padding(.all,2)
                    .border(Color.red)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 70)
                    .overlay(
                        Text("Rectangle")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .padding(.all,2)
                    .border(Color.red)
                
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.blue)
                    .frame(width: 100, height: 70)
                    .overlay(
                        Text("Rounded\nRectangle")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    )
                    .padding(.all,2)
                    .border(Color.red)
                
                TestResult {
                    Check(iOS: true, macOS: true, test: "Circle")
                    Check(iOS: true, macOS: true, test: "Ellipse")
                    Check(iOS: true, macOS: true, test: "Capsule")
                    Check(iOS: true, macOS: true, test: "Rectangle")
                    Check(iOS: true, macOS: true, test: "RoundedRectangle")
                }
            }
            
            TestCase("Dynamique Shape") {
                VStack(alignment: .leading) {
                    TestCode(
                        """
                        ContainerRelativeShape()
                           .inset(by: 4)
                           .fill(Color.blue)
                           .frame(width: 100)
                        """
                    )
                    
                    ContainerRelativeShape()
                        .inset(by: 4)
                        .fill(Color.blue)
                        .frame(width: 100)
                        .padding(.all,2)
                        .border(Color.red)
                }
                
                VStack(alignment: .leading) {
                    TestCode(
                        """
                         OffsetShape(shape: Circle(), offset: CGSize(width: 30, height: 15))
                             .fill(Color.blue)
                             .frame(width: 40, height: 40)
                         """
                    )
                    
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 2, height: 2)
                        
                        OffsetShape(shape: Circle(), offset: CGSize(width: 30, height: 15))
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 100, height: 70)
                    .border(Color.red)
                }
                
                VStack(alignment: .leading) {
                    TestCode(
                        """
                         RotatedShape(shape: Rectangle(), angle: Angle(degrees: 120))
                             .fill(Color.blue)
                             .frame(width: 40, height: 50)
                         """
                    )
                    
                    VStack {
                        RotatedShape(shape: Rectangle(), angle: Angle(degrees: 120))
                            .fill(Color.blue)
                            .frame(width: 40, height: 50)
                    }
                    .frame(width: 100, height: 70)
                    .border(Color.red)
                }
                
                VStack(alignment: .leading) {
                    TestCode(
                        """
                        ScaledShape(shape: Circle(), scale: CGSize(width: 0.80, height: 1.60), anchor: .center)
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                        """
                    )
                    
                    VStack {
                        ScaledShape(shape: Circle(), scale: CGSize(width: 0.80, height: 1.60), anchor: .center)
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 100, height: 70)
                    .border(Color.red)
                }
                
                VStack(alignment: .leading) {
                    TestCode(
                        """
                         let shape = RoundedRectangle(cornerRadius: 8)\n
                         shape
                             .fill(Color.blue)
                             .frame(width: 40, height: 20)\n
                         TransformedShape(shape: shape, transform: CGAffineTransform(rotationAngle: 25 * (.pi / 180)))
                                 .fill(Color.green)
                                 .frame(width: 40, height: 20)
                         """
                    )
                    
                    HStack {
                        shape
                            .fill(Color.blue)
                            .frame(width: 40, height: 20)
                        
                        TransformedShape(shape: shape, transform: CGAffineTransform(rotationAngle: 25 * (.pi / 180)))
                            .fill(Color.green)
                            .frame(width: 40, height: 20)
                    }
                    .frame(width: 100, height: 70)
                    .border(Color.red)
                    
                }
                
                TestResult {
                    Check(iOS: true, macOS: true, test: "ContainerRelativeShape")
                    Check(iOS: true, macOS: true, test: "OffsetShape")
                    Check(iOS: true, macOS: true, test: "RotatedShape")
                    Check(iOS: true, macOS: true, test: "ScaledShape")
                    Check(iOS: true, macOS: true, test: "TransformedShape")
                }
            }
            
            TestCase("Path Shapes") {
                
                VStack(alignment: .leading) {
                    TestCode(
                        """
                        PathLine()
                            .stroke(Color.blue, lineWidth: 2)
                        """
                    )
                    
                    HStack {
                        PathLine()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .frame(width: 100, height: 20)
                    .padding(.all, 3)
                    .border(Color.red)
                }

                VStack(alignment: .leading) {
                    TestCode(
                        """
                        PathElippse()
                            .stroke(Color.blue, lineWidth: 2)
                        """
                    )
                    
                    HStack {
                        PathElippse()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .frame(width: 100, height: 100)
                    .padding(.all, 3)
                    .border(Color.red)
                }

                VStack(alignment: .leading) {
                    TestCode(
                        """
                        PathRectangle()
                            .stroke(Color.blue, lineWidth: 2)
                        """
                    )
                    
                    HStack {
                        PathRectangle()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .frame(width: 100, height: 100)
                    .padding(.all, 3)
                    .border(Color.red)
                }

                VStack(alignment: .leading) {
                    TestCode(
                        """
                        PathRoundedRectangle()
                            .stroke(Color.blue, lineWidth: 2)
                        """
                    )
                    
                    HStack {
                        PathRoundedRectangle()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .frame(width: 100, height: 100)
                    .padding(.all, 3)
                    .border(Color.red)
                }

                TestResult {
                    Check(iOS: true, macOS: true, test: "PathLine")
                    Check(iOS: true, macOS: true, test: "PathElippse")
                    Check(iOS: true, macOS: true, test: "PathRectangle")
                    Check(iOS: true, macOS: true, test: "PathRoundedRectangle")
                }
            }
        }
    }
}


struct TestShape_Previews: PreviewProvider {
    static var previews: some View {
        TestShape()
    }
}
