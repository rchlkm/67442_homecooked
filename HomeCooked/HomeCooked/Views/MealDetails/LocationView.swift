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
            SectionTitle("Location")
//            Section { Text(meal.city).font(.body) }.padding(.top, 5)
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
        let coordinate = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lng)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
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
            Button(action: { self.open_maps() }) {
                Text("Open Maps")
            }
        )
    }
    
    func open_maps() {
//        print("open maps clicked!!")
//    }
//    func openMapForPlace() {
//            let latitude: CLLocationDegrees = 37.2
//            let longitude: CLLocationDegrees = 22.9
//
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(self.lat, self.lng)
//            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "HomeCooked Meal Location"
            mapItem.openInMaps(launchOptions: options)
        }
     
}
