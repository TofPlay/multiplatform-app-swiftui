//
//  TestStepper.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestStepper: View {
    @State private var beer: Int = 1
    @State private var beerStr: String = "1"
    
    var body: some View {
        TestBody(test: .stepper) {
            TestCase("Select number of beers") {
                Text("How much beer are you going to drink?")
                HStack {
                    Stepper(value: $beer, in: 0...10, step: 1) {
                        HStack {
                            Text("Choice (0 to 10):")
                            // The code just below works with one exception. onChange is not called when the user types a
                            // character it is only called when he presses Enter.
                            // To check if the user types is correct, we have to use a string. With a
                            // String onChange is called each time a character is entered.
                            // To be checked with the final version of Xcode 12 if this bug is fixed.
                            //TextField("", value: $beer, formatter: NumberFormatter())
                            //    .frame(width: 100)
                            //    .textFieldStyle(RoundedBorderTextFieldStyle())
                            //    .multilineTextAlignment(.trailing)
                            
                            TextField("", text: $beerStr)
                                .frame(width: 100)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                                .onChange(of: beer) {
                                    _ in
                                    beerStr = "\(beer)"
                                }
                                .onChange(of: beerStr) {
                                    _ in
                                    if let lBeer = Int(beerStr) {
                                        if lBeer <= 10 {
                                            beer = lBeer
                                        } else {
                                            beerStr = "\(beer)"
                                        }
                                    } else {
                                        beerStr = "\(beer)"
                                    }
                                }
                            
                            TextField("", text: $beerStr)
                                .frame(width: 100)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.center)
                                .onChange(of: beer) {
                                    _ in
                                    beerStr = "\(beer)"
                                }
                                .onChange(of: beerStr) {
                                    _ in
                                    if let lBeer = Int(beerStr) {
                                        if lBeer <= 10 {
                                            beer = lBeer
                                        } else {
                                            beerStr = "\(beer)"
                                        }
                                    } else {
                                        beerStr = "\(beer)"
                                    }
                                }
                            
                            TextField("", text: $beerStr)
                                .frame(width: 100)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                                .onChange(of: beer) {
                                    _ in
                                    beerStr = "\(beer)"
                                }
                                .onChange(of: beerStr) {
                                    _ in
                                    if let lBeer = Int(beerStr) {
                                        if lBeer <= 10 {
                                            beer = lBeer
                                        } else {
                                            beerStr = "\(beer)"
                                        }
                                    } else {
                                        beerStr = "\(beer)"
                                    }
                                }
                            
                            Image(systemName: "arrowtriangle.backward")
                        }
                    }

                    Spacer()
                }
                
                TestResult {
                    Check(valid:  false, test: "Spacer() doesn't work")
                    Check(valid:  false, test: "TextField .onChange is not called each time a character is entered with NumberFormatter")
                    Check(valid:  true, test: "TextField .multilineTextAlignment(.leading)")
                    Check(valid:  true, test: "TextField .multilineTextAlignment(.center)")
                    Check(valid:  true, test: "TextField .multilineTextAlignment(.trailing)")
                    Check(valid:  true, test: "TextField .onChange is called each time a character is entered if it's a String")
                }
            }
        }
    }
}

struct TestStepper_Previews: PreviewProvider {
    static var previews: some View {
        TestStepper()
    }
}
