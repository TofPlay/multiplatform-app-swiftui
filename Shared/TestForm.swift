//
//  TestForm.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI

struct TestForm: View {
    // personal
    @State private var name: String = ""
    @State private var age: String = ""
    
    // address
    @State private var street: String = ""
    @State private var place: String = ""
    @State private var postcode: String = ""
    
    @State private var birthday = Date()
    
    @State private var acceptedTerms: Bool = true
    @State private var selectedGenderIndex: Int = 0
    @State private var selectedAnimalIndex: Int = 2
    
    private var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female"]
    private var animalOptions = [
        "🐴 Horse",
        "🐢 Turtle",
        "🐶 Dog",
        "🐱 Cat",
        "🐭 Mouse",
        "🦆 Duck",
    ]
    
    var body: some View {
        TestBody(test: .form, scroll: false) {
            Form {
                Section(header: Text("Personal")) {
                    TextField("Your name", text: $name)
                    #if os(macOS)
                    TextField("Your age", text: $age)
                    #else
                    TextField("Your age", text: $age)
                        .keyboardType(.numberPad)
                    #endif
                    
                    Picker("Gender", selection: $selectedGenderIndex) {
                        ForEach(0..<genderOptions.count) {
                            Text(self.genderOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Birthday")) {
                    DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday")
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Picker("Favorite animal", selection: $selectedAnimalIndex) {
                        ForEach(0..<animalOptions.count) {
                            Text(animalOptions[$0])
                        }
                    }
                }
                
                Section(header: Text("Address")) {
                    TextField("Street", text: $street)
                    TextField("Place", text: $place)
                    TextField("Postcode", text: $postcode)
                }
                
                Section(header: Text("Terms")) {
                    Toggle("I agree to the terms & conditions", isOn: $acceptedTerms)
                }
            }

            TestResult {
                #if os(macOS)
                Check(valid:  false, test: "Section are not well design")
                Check(valid:  false, test: "TextField are not well design")
                #else
                Check(valid:  true, test: "Section are well design")
                Check(valid:  true, test: "TextField are well design")
                #endif
            }
            .padding(.top, 20)
            .padding(.leading, 10)
        }
    }
}

struct TestForm_Previews: PreviewProvider {
    static var previews: some View {
        TestForm()
    }
}
