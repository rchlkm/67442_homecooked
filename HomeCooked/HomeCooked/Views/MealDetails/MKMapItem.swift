//
//  MKMapItem.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/6/19.
//  Copyright © 2019 67442. All rights reserved.
// https://www.techotopia.com/index.php/Integrating_Maps_into_iOS_8_Applications_using_MKMapItem_and_Swift

import Foundation
import SwiftUI
import MapKit

//
//struct MapPlace: View {
//    let newLocation = CLLocation(latitude: 40.74835, longitude: -73.984911)
//    
//    CLGeocoder().reverseGeocodeLocation(newLocation, completionHandler: {(placemarks, error) in
//    if error != nil {
//    print("Geocode failed with error: \(error!.localizedDescription)")
//    }
//    
//    if let marks = placemarks, marks.count > 0 {
//    let placemark = marks[0]
//    let postalAddress = placemark.postalAddress
//    
//    if let address = postalAddress?.street,
//    let city = postalAddress?.city,
//    let state = postalAddress?.state,
//    let zip = postalAddress?.postalCode {
//    
//    print("\(address) \(city) \(state) \(zip)")
//    }
//    }
//    })
//    
//    
//    
//    let place = MKPlacemark(coordinate: coords, addressDictionary: address)
//    
//    let mapItem = MKMapItem(placemark: place)
//    mapItem.openInMaps(launchOptions: nil)
//
//
//}
