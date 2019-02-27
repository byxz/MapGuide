//
//  LocationServices.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/13/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import CoreLocation
import CoreMotion

final class LocationServices: NSObject, CLLocationManagerDelegate {
    
//    private let locationManager = CLLocationManager()
//    private let motionManager = CMMotionActivity()
//
//    override init() {
//        super.init()
//
//    }
//
//    func configurate() {
//        locationManager.delegate = self
//    }
//
    
    final class LocationService: NSObject, CLLocationManagerDelegate {
        private let locationManager = CLLocationManager()
        
        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager,
                             didUpdateLocations locations: [CLLocation]) {
        }
    }
}
