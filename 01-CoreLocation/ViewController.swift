//
//  ViewController.swift
//  01-CoreLocation
//
//  Created by Gianfranco Cotumaccio on 30/12/14.
//  Copyright (c) 2014 Edenco. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Variables
    
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    var placeMark: CLPlacemark?
    
    // MARK: - ViewController-Livecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("ERROR: \(error.localizedDescription)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("New Location: \(manager.location)")
        
        let currentLocation = locationManager.location
        
        if currentLocation != nil {
            println("Latitude: \(currentLocation.coordinate.latitude)")
            println("Longitude: \(currentLocation.coordinate.longitude)")
            
            geocoder.reverseGeocodeLocation(currentLocation, completionHandler: {
                placemarks, error in
                
                if error != nil && placemarks.count > 0 {
                    self.placeMark = placemarks.last as? CLPlacemark
                    println("Placemark: \(self.placeMark?.country)")
                    self.locationManager.stopUpdatingLocation()
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

