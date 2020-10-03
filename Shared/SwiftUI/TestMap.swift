//
//  TestMap.swift
//  MultiplatformAppSwiftUI
//
//  Created by Christophe Braud on 29/08/2020.
//

import SwiftUI
import MapKit

struct TestMap: View {
    struct Place: Identifiable {
        let id = UUID()
        let name: String
        let latitude: Double
        let longitude: Double
        let color: Color
        
        var coordinate: CLLocationCoordinate2D {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    private let places:[Place] = [
        Place(name: "Louvre Museum", latitude: 48.864824, longitude: 2.334595, color: .blue),
        Place(name: "Eiffel Tower", latitude: 48.858370, longitude: 2.294481, color: .green)
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.855372, longitude: 2.313163), latitudinalMeters: 4000, longitudinalMeters: 4000)
    
    var body: some View {
        TestBody(test: .map, scroll: false) {
            TestCase("Display map of Paris with pins for Eiffel Tower (green) and Louvre Museum (blue)") {
                Map(coordinateRegion: $region, annotationItems: places) {
                    (pPlace: Place) in
                    MapPin(coordinate: pPlace.coordinate, tint: pPlace.color)
                }
                .padding()

                TestResult {
                    Check("Display map", .success(os: .iOS), .success(os: .macOS))
                    Check("Display pin", .success(os: .iOS), .success(os: .macOS))
                }
            }
        }
    }
}

struct TestMap_Previews: PreviewProvider {
    static var previews: some View {
        TestMap()
    }
}
