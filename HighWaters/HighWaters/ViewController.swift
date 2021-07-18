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
        setupUI()
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

    private func setupUI() {
        
        let addFloodButton = UIButton(frame: CGRect.zero)
        addFloodButton.setImage(UIImage(named :"plus-image"), for: .normal)
        
        addFloodButton.addTarget(self, action: #selector(addFloodAnnotationButtonPressed), for: .touchUpInside)
        addFloodButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(addFloodButton)
        
        addFloodButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addFloodButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        addFloodButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        addFloodButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
    }
    
    @objc func addFloodAnnotationButtonPressed(sender :Any?) {
        
        print("addFloodAnnotationButtonPressed")
    }

}

