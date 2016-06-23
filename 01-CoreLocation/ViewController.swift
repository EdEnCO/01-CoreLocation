//
//  ViewController.swift
//  01-CoreLocation
//
//  Created by Gianfranco Cotumaccio on 23/06/16.
//  Copyright © 2016 Propaganda Studio. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Variables
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("ERROR: \(error.localizedDescription)")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location: \(manager.location)")
        
        let currentLocation = locationManager.location
        
        if currentLocation != nil {
            let lat = (currentLocation?.coordinate.latitude)!
            let lon = (currentLocation?.coordinate.longitude)!
            print("Latitude: \(lat) - Longitude: \(lon)")
        }
        
        manager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

