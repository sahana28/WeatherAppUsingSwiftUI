//
//  LocationManager.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 07/01/23.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate  {
    let manager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading  = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
        manager.allowsBackgroundLocationUpdates = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error fetching the location")
         isLoading = false
        
    }
}
