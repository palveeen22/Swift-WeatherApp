//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import Foundation

// this is from IOS Dev for get location
import CoreLocation

class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func reqLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error Getting Location...", error)
        isLoading = false
    }
}
