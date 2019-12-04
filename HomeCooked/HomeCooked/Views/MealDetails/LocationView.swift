//
//  LocationView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//  https://developer.apple.com/tutorials/swiftui/creating-and-combining-viewså

import SwiftUI
import MapKit

struct LocationView: View {
    let meal: Meal
    let marker: Bool
    
    init(meal: Meal, marker: Bool = false) {
        self.meal = meal
        self.marker = marker
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text(meal.city)
                    .font(.body)
                    .fontWeight(.bold)
                //                Text("5 minute walk from")
                //                    .font(.body)
            }.padding(.top, 5)
            
            if self.marker {
                NavigationLink(destination: FullMapView(lat: self.meal.latitude, lng: self.meal.longitude, marker: self.marker)) {
                    MapView(lat: self.meal.latitude, lng: self.meal.longitude, marker: self.marker)
                        .frame(height: 170)
                }
            } else {
                MapView(lat: self.meal.latitude, lng: self.meal.longitude, marker: self.marker)
                    .frame(height: 170)
            }
        }
    }
}


struct FullMapView: View {
    let lat: Double
    let lng: Double
    let marker: Bool
    init(lat: Double, lng: Double, marker: Bool) {
        self.lat = lat
        self.lng = lng
        self.marker = marker
    }
    
    var body: some View {
        VStack {
            MapView(lat: self.lat, lng: self.lng, marker: self.marker)
        }
        .navigationBarItems(trailing:
            Button("Open Maps") {
                print("Open Maps tapped!")
            }
        )
    }
}

struct MapView: UIViewRepresentable {
    let lat: Double
    let lng: Double
    let marker: Bool
    
    init(lat: Double, lng: Double, marker: Bool) {
        self.lat = lat
        self.lng = lng
        self.marker = marker
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: self.lat, longitude: self.lng)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: self.lat, longitude:self.lng)
        if marker {
            let annotation = MKPointAnnotation()
            annotation.coordinate = centerCoordinate
            view.addAnnotation(annotation)
        } else {
            let circle = MKCircle(center: centerCoordinate, radius: 5)
            view.addOverlay(circle)
        }
    }
}
