//
//  ViewController.swift
//  HighWaters
//
//  Created by Anika Tomichen on 16/07/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetUp()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            let cordinate = location.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: cordinate, span: span)
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    func mapSetUp(){
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.distanceFilter = kCLDistanceFilterNone
        self.locationManager?.requestWhenInUseAuthorization()
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        self.locationManager?.startUpdatingLocation()
    }


}

