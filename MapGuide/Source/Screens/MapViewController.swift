//
//  MapViewController.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/13/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var googleMaps: GMSMapView!
    
    var locationManager = CLLocationManager()
    var currentPlace = CLLocationCoordinate2D()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.tag = TabBarItemTag.navigationItem.rawValue
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
     
        let camera = GMSCameraPosition.camera(withLatitude: 47.824952, longitude: 35.090359, zoom: 13)

        self.googleMaps.camera = camera
        self.googleMaps.delegate = self
        self.googleMaps.isMyLocationEnabled = true
        self.googleMaps.settings.myLocationButton = true
        self.googleMaps.settings.compassButton = true
        self.googleMaps.settings.zoomGestures = true
        
        let marker = GMSMarker()
       
        marker.position = CLLocationCoordinate2D(latitude: 47.824952, longitude: 35.090359)
        marker.map = self.googleMaps
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        let location: CLLocation? = googleMaps.myLocation
        if location != nil {
            googleMaps.animate(toLocation: (location?.coordinate)!)
        }
       return true
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let infoWindow = Bundle.main.loadNibNamed("MapMarkerWindowView", owner: self.googleMaps, options: nil)?.first as! MapMarkerWindow
        marker.infoWindowAnchor =   CGPoint(x: 0.5, y: 0.5)
        infoWindow.markerImageView.image = UIImage(named: "station")
        infoWindow.markerImageView.contentMode = .scaleAspectFit
        return infoWindow
    }
    // MARK: GMSMapViewDelegate
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    
}

